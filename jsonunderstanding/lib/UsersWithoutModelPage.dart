import 'package:flutter/material.dart';
import 'package:jsonunderstanding/Apis.dart/ApiProvider.dart';

class UsersWithoutModelPage extends StatefulWidget {
  const UsersWithoutModelPage({super.key, required this.title});



  final String title;

  @override
  State<UsersWithoutModelPage> createState() => _UsersWithoutModelPageState();
}

class _UsersWithoutModelPageState extends State<UsersWithoutModelPage> {
  UserApiProviderWithoutModel usersApiProviderWithoutModel=UserApiProviderWithoutModel();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
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
           future:usersApiProviderWithoutModel.getUsers(),
           builder: (context, snapshot) {
            if (snapshot.hasData) {
            var data=snapshot.data as List;

              return ListView.builder(
               itemCount: data.length,
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
                        Text('User no ${data[index]['id']}'),
                        Container(
                          color: Color.fromARGB(255, 189, 215, 236),
                          child: ListTile(
                           leading: Text(data[index]['username'].toString()),
                           title: Text(data[index]['name'].toString()),
                           subtitle: Text(data[index]['email'].toString()),
                           trailing: Text(data[index]['website'].toString()),
                          ),
                        ),
                        Text("Address = ${data![index]['address']['city']}"),
                        Container(
                          color: const Color.fromARGB(255, 197, 198, 198),
                          child: ListTile(
                           leading: Text(data[index]['address']['suite'].toString()),
                           title: Text(data[index]['address']['zipcode'].toString()),
                           subtitle: Text(data[index]['address']['street'].toString()),
                    
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 197, 198, 198),
                          child: ListTile(
                           title: Text(data[index]['address']['geo']['lat'].toString()),
                           subtitle: Text(data[index]['address']['geo']['lng'].toString()),
                          )
                          ),
                        Container(
                          color: Color.fromARGB(255, 170, 250, 250),
                          child: ListTile(
                           title: Text(data[index]['company']['name'].toString()),
                           subtitle: Text(data[index]['company']['catchPhrase'].toString()),
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
