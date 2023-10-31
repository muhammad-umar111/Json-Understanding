import 'package:flutter/material.dart';
import 'package:jsonunderstanding/Apis.dart/ApiProvider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostsProvider postApiProvider=PostsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
         future:postApiProvider.fetchPost() ,
         builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
             itemCount: snapshot.data!.length,
             itemBuilder: (context, index) {
              return ListTile(
               leading: Text(snapshot.data![index].id.toString()),
               subtitle: Text(snapshot.data![index].title.toString()),
              );
            },);
          } else {
            return Text('Hello');
          }
        },),
      ));
  }
}
