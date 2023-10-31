import 'package:flutter/material.dart';
import 'package:jsonunderstanding/Apis.dart/ApiProvider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.title});



  final String title;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UsersApiProvider usersApiProvider=UsersApiProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder(
           future:usersApiProvider.fetchUsers(),
           builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
               itemCount: snapshot.data!.length,
               itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                     color: Color.fromARGB(255, 243, 191, 5)
                     
                    ),
                    child: Column(
                      children: [
                        Text('User no ${snapshot.data![index].id}'),
                        Container(
                          color: Color.fromARGB(255, 189, 215, 236),
                          child: ListTile(
                           leading: Text(snapshot.data![index].username.toString()),
                           title: Text(snapshot.data![index].name.toString()),
                           subtitle: Text(snapshot.data![index].email.toString()),
                           trailing: Text(snapshot.data![index].website.toString()),
                          ),
                        ),
                        Text("Address = ${snapshot.data![index].address!.city}"),
                        Container(
                          color: const Color.fromARGB(255, 197, 198, 198),
                          child: ListTile(
                           leading: Text(snapshot.data![index].address!.suite.toString()),
                           title: Text(snapshot.data![index].address!.zipcode.toString()),
                           subtitle: Text(snapshot.data![index].address!.street.toString()),
                    
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 197, 198, 198),
                          child: ListTile(
                           title: Text(snapshot.data![index].address!.geo!.lat.toString()),
                           subtitle: Text(snapshot.data![index].address!.geo!.lng.toString()),
                          )
                          ),
                        Container(
                          color: Color.fromARGB(255, 170, 250, 250),
                          child: ListTile(
                           title: Text(snapshot.data![index].company!.name.toString()),
                           subtitle: Text(snapshot.data![index].company!.catchPhrase.toString()),
                          )
                          ),
                        
                      ],
                    ),
                  ),
                );
              },);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },),
        )),
    );
  }
}
