
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay Gallery'),
      ),
      body: BlocProvider(
        create: (context) => ImageBloc(Dio())..add(FetchImages()),
        child: ImageGrid(),
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final imageBloc = BlocProvider.of<ImageBloc>(context);
    final state = imageBloc.state;
    // Calculate the number of columns based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth =130; // Width of each grid item
    final crossAxisCount = (screenWidth / itemWidth).floor();
    if (state is ImageLoaded) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child:  GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 2.0, // Spacing between columns
              mainAxisSpacing: 2.0, // Spacing between rows
              childAspectRatio: 0.8, // Aspect ratio of each grid item

            ),
            itemCount: state.images.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final image = state.images[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(image: image),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 7,
                    shadowColor: Colors.black12,
                    child: Column(
                      children: [
                        Card(
                          child: GridTile(
                            child: Image.network(
                              image.url,
                              fit:BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Text('Likes: ${image.likes} Views: ${image.views}'),
                      ],
                    ),
                  ));
            },
          ),
      );

    }
    else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 150).floor();
  }
}

class FullScreenImage extends StatelessWidget {
  final ImageModel image;

  FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: image.id,
            child: Image.network(
              image.url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final Dio dio;
  ImageBloc(this.dio) : super(ImageInitial()) {
    on<FetchImages>(_onFetchImages);
  }
  void _onFetchImages(FetchImages event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    try {
      final response = await dio.get(
          'https://pixabay.com/api/?key=43650806-de05f914498025c692386ea65&per_page=30');
      final List<dynamic> data = response.data['hits'];
      final List<ImageModel> images =
          data.map((json) => ImageModel.fromJson(json)).toList();
      emit(ImageLoaded(images: images));
    } catch (e) {
      emit(ImageError());
    }
  }
}

abstract class ImageEvent {}
class FetchImages extends ImageEvent {}
abstract class ImageState {}
class ImageInitial extends ImageState {}
class ImageLoading extends ImageState {}
class ImageLoaded extends ImageState {
  final List<ImageModel> images;
  ImageLoaded({required this.images});
}
class ImageError extends ImageState {}
class ImageModel {
  final int id;
  final String url;
  final int likes;
  final int views;

  ImageModel({
    required this.id,
    required this.url,
    required this.likes,
    required this.views,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['webformatURL'],
      likes: json['likes'],
      views: json['views'],
    );
  }
}
