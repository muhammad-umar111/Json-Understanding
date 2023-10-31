import 'package:flutter/material.dart';
import 'package:jsonunderstanding/Apis.dart/ApiProvider.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key, required this.title});



  final String title;

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  CountriesApiProvider countriesApiProvider=CountriesApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
         future:countriesApiProvider.fetch(),
         builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(snapshot.data!.data!.dZ!.country.toString()),
                    Text(snapshot.data!.data!.dZ!.region.toString())
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },),
      ));
  }
}
