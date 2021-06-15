import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
class Test extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: datePageClass(),

    );
  }
}
class GetItems {
  //int id;
  String name;
  String itemImage;
  String itemPrice;

  GetItems({
 //   this.id,
    this.name,
    this.itemImage,
    this.itemPrice,
  });

  factory GetItems.fromJson(Map<String, dynamic> json) {
    return GetItems(
      // id: json['id'],

      name: json['item_name'],
      itemImage: json['item_image'],
      itemPrice: json['item_price']
    );
  }
}


//ignore: camel_case_types
class datePageClass extends StatefulWidget {
  @override
  _datePageClassState createState() => _datePageClassState();
}
//ignore:camel_case_types
class _datePageClassState extends State<datePageClass> {
  int _itemCount = 0;


  // ignore: missing_return
  Future<List<GetItems>> getData() async {
    int id =4;

    var data = {'category_id':id};
    http.Response response = await http.post('https://punjabisunrise.com/punjabisunrise_api/item_api.php',body:jsonEncode(data));

    if (response.statusCode == 200) {
     // final data = response.body;
      final data = json.decode(response.body).cast<Map<String, dynamic>>();

      print(response.body);

      List<GetItems> usersList = data.map<GetItems>((json) {
        return GetItems.fromJson(json);
      }).toList();

      return usersList;

    } else {
      print(response.statusCode);
    }
  /*  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(response.body),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );*/


  }

  @override
  Widget build(BuildContext context) {
  //  getData();
    return Scaffold(
      body: FutureBuilder<List<GetItems>>(
        future: getData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          // String uri;
          return   ListView (
            children: snapshot.data
                .map((user) => ListTile(
              title: Container(
                  width:10,
                  height: 20,
                  child:Text(user.name,style: TextStyle(fontSize: 22.0))
              ),
              //onTap: (){ print(user.name);},
             // subtitle: Text("\$"+user.itemPrice,style: TextStyle(fontSize: 20.0)),
              contentPadding: EdgeInsets.all(5.0),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage('https://punjabisunrise.com/public/item_image/'+user.itemImage),
                radius: 30,



              ),
              /*  trailing:Container(
                    width: 104,
                    height: 20,
                    child:new Row(
                  children: <Widget>[
                    _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                    new Text(_itemCount.toString()),
                    new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
                  ],
                )
          ),*/
            ),
            ).toList(),
          );
          /*ListView(
            itemExtent: 70.0,
            shrinkWrap: true,
            children: snapshot.data
                .map((user) => ListTile(
                title: Text(user.name,style: TextStyle(fontSize: 22.0),textAlign: TextAlign.left),
                // onTap: (){ print(user.name);},
                //subtitle: Text(user.phoneNumber),
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 80,
                    minHeight: 80,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  //backgroundColor: Colors.green,
                  child: Image.network('https://punjabisunrise.com/public/item_image/'+user.itemImage),



                ),

                // trailing: Icon(Icons.arrow_drop_down_sharp)

            ),
            )
                .toList(),
          );*/
        },
      ),
    );
  }
}