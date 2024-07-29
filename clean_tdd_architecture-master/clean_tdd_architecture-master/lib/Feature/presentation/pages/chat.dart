import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  final String chatId = 'chat1'; // Example chatId
  final String userId = 'user1'; // Example userId

  Future<String?> _uploadFile(File file) async {
    try {
      final storageRef = _storage.ref().child('chat_attachments/${DateTime.now().toString()}');
      final uploadTask = storageRef.putFile(file);

      final snapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }

  Future<void> _pickAndUploadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final imageUrl = await _uploadFile(file);
      _sendMessage(_controller.text, imageUrl);
    }
  }

  Future<void> _sendMessage(String text, String? imageUrl) async {
    if (text.isNotEmpty || imageUrl != null) {
      final messageRef = _firestore.collection('messages').doc();
      await messageRef.set({
        'text': text,
        'imageUrl': imageUrl,
        'senderId': userId,
        'timestamp': FieldValue.serverTimestamp(),
        'chatId': chatId,
        'read': false,
      });

      // Update chat metadata
      await _firestore.collection('chats').doc(chatId).set({
        'lastMessage': text,
        'timestamp': FieldValue.serverTimestamp(),
        'unreadCount': FieldValue.increment(1),
      }, SetOptions(merge: true));

      _controller.clear();
    }
  }

  Future<void> _markMessagesAsRead() async {
    final messagesQuery = _firestore.collection('messages')
        .where('chatId', isEqualTo: chatId)
        .where('read', isEqualTo: false);
    final messagesSnapshot = await messagesQuery.get();

    for (var doc in messagesSnapshot.docs) {
      await doc.reference.update({'read': true});
    }

    // Reset unread count in chat metadata
    await _firestore.collection('chats').doc(chatId).update({
      'unreadCount': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.collection('chats').doc(chatId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Chat');
            }
            final chatData = snapshot.data!;
            final unreadCount = chatData['unreadCount'] ?? 0;
            return Text('Chat (${unreadCount})');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _pickAndUploadImage,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages')
                  .where('chatId', isEqualTo: chatId)
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final text = message['text'] ?? '';
                    final imageUrl = message['imageUrl'] as String?;

                    return ListTile(
                      title: Text(text),
                      subtitle: imageUrl != null
                          ? Image.network(imageUrl)
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                    ),
                    onSubmitted: (value) {
                      _sendMessage(value, null);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text, null),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mark_chat_read),
        onPressed: _markMessagesAsRead,
      ),
    );
  }
}
