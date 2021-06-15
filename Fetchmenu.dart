import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;

import 'package:punjabi/sublist.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
  }
}

class GetUsers {

  int id;
  String name;
  String category_image;
  String phoneNumber;

  GetUsers({
    this.id,
    this.name,
    this.category_image,
    this.phoneNumber,
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
      // id: json['id'],
      name: json['category_name'],
       category_image: json['category_image'],
      // phoneNumber: json['phone']
    );
  }
}

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {

  final String apiURL = 'https://punjabisunrise.com/punjabisunrise_api/get_api.php';

  Future<List<GetUsers>> fetchJSONData() async {

    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {

      final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
      print(jsonResponse.body);

      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();

      return usersList;

    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

         // String uri;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
           child: ListView(
            itemExtent: 70.0,
            shrinkWrap: true,
            children: snapshot.data
                .map((user) => ExpansionTile(
              title: Text(user.name,style: TextStyle(fontSize: 22.0),textAlign: TextAlign.left),
              //onTap: (){ print(user.name);},
              //subtitle: Text(user.phoneNumber),

              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 64,
                  minHeight: 64,
                  maxWidth: 70,
                  maxHeight: 70,
                ),
                //backgroundColor: Colors.green
                // /,
                 //uri= 'http://genesisrealtypark.com/Projects/punjabisunrise/public/category_im'+user.name;
                child: Image.network('https://punjabisunrise.com/public/category_image/'+user.category_image),



              ),
             /* children: [
                ListView (
                  children: snapshot.data
                    .map((user) => ListTile(
                  title: Text(user.name,style: TextStyle(fontSize: 22.0)),
                  // onTap: (){ print(user.name);},
                  //subtitle: Text(user.phoneNumber),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    //uri= 'http://genesisrealtypark.com/Projects/punjabisunrise/public/category_im'+user.name;
                    backgroundImage: NetworkImage('https://punjabisunrise.com/public/category_image/'+user.category_image),
                    radius: 60,



                  ),
                  // trailing: Icon(Icons.arrow_drop_down_sharp)

                ),
                ).toList(),
                ),
              ]*/
            ),
            )
                .toList(),
          ),);
        },
      ),
    );
  }
}