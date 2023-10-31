import 'package:flutter/material.dart';
import 'package:jsonunderstanding/Apis.dart/ApiProvider.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key, required this.title});



  final String title;

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  PhotosApiProvider photosApiProvider=PhotosApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
         future:photosApiProvider.fetchPhotos() ,
         builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
             itemCount: snapshot.data!.length,
             itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                   leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data![index].url.toString())),
                   subtitle: Text(snapshot.data![index].title.toString()),
                   
                  ),
                  
                ],
              );
            },);
          } else {
            return Text('Hello');
          }
        },),
      ));
  }
}
