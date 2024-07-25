import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
           child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
            icon:  const Icon(Icons.arrow_back_ios,size: 20,)),
         ),
          title: const Text(
            "Notification",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              width: 315,
              height: 105,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning! Get 20% Voucher",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      "Summer sale up to 20% off. Limited voucher. Get now!! 😜",
                      style:
                          TextStyle(color: Color(0xff686868), fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
