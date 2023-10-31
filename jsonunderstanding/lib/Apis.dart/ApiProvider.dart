import 'dart:convert';

import 'package:http/http.dart';
import 'package:jsonunderstanding/Model.dart/PhotosModel.dart';

import '../Model.dart/CountriesModel.dart';
import '../Model.dart/PostsModel.dart';
import '../Model.dart/UsersModel.dart';

abstract class ApiProvider {
  String get baseUrl;
  Uri getUrl({String endpoint=''})=>Uri.parse(baseUrl+endpoint);
  _fetch()async{
   var response= await get(getUrl());
   print(response.statusCode);
   if (response.statusCode==200) {
     var map= await jsonDecode(response.body);
     return map;
   } else {
     return null;
   }
  }
}
class PostsProvider extends ApiProvider{
  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Posts>> fetchPost() async {
    List map = await _fetch();
    var posts = map.map((map) =>Posts.fromMap(map)).toList();
    return posts;
  }
}

class PhotosApiProvider extends ApiProvider{
  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://jsonplaceholder.typicode.com/photos';
  Future<List<Photos>> fetchPhotos()async{
  List map=await _fetch();
  var photos=map.map((e) => Photos.fromJson(e)).toList();
  return photos;
  }
}
class UsersApiProvider extends ApiProvider{
  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://jsonplaceholder.typicode.com/users';
  Future<List<Users>> fetchUsers()async{
    List map=await _fetch();
    List<Users> list=map.map((e) => Users.fromJson(e)).toList();
    return list;
  }

}
class UserApiProviderWithoutModel extends ApiProvider{
  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://jsonplaceholder.typicode.com/users';
   getUsers()async{
    List map=await _fetch();
    return map.map((e) => e).toList();
   }
}
class CountriesApiProvider extends ApiProvider{
  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://webhook.site/31cec52e-6cc8-41ab-9f8d-4d307685da65';
 Future<Countries> getCountries()async{
    var country=await _fetch();
    print(country.toString());
    Countries my= Countries.fromJson(country);
    return my;

  }
   Future<Countries> fetch() async {
    try {
    final response =
        await get(Uri.parse('https://api.first.org/data/v1/countries'));
        print(response.body.toString());
        print(response.statusCode);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Countries.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
    
    } catch (e) {
      throw Exception(e.toString());
    }
    }

}