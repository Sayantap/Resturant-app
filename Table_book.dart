import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text('User Registration Form')),
            body: Center(
                child: BookingUser(),
            )
        )
    );
  }
}

class BookingUser extends StatefulWidget {

  RegisterUserState createState() => RegisterUserState();

}

class RegisterUserState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final msgController = TextEditingController();
  final pNoController = TextEditingController();
  final headController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String username = nameController.text;
    String email = emailController.text;
    String msg = msgController.text;
    String pNo = pNoController.text;
    String head = headController.text;
    String time = timeController.text;
    String date = dateController.text;

    // SERVER API URL
    var url = 'https://punjabisunrise.com/punjabisunrise_api/table_api.php';

    // Store all data with Param Name.
    var data = {'name': username,'pNo':pNo,'head':head, 'email': email,'time':time, 'date':date, 'msg' : msg};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    //var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(response.body),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
              child: Column(

                children: <Widget>[


                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Enter details',
                          style: TextStyle(fontSize: 21))),

                  Divider(),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: nameController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Name Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: msgController,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter special requirement'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: pNoController,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter Your Phone no'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: headController,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter head count'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: timeController,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter time'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: dateController,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter date in DD/MM/YYYY'),
                      )
                  ),

                  RaisedButton(
                    onPressed: userRegistration,
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('Click Here To Register User Online'),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator()
                      )
                  ),

                ],
              ),
            )));
  }
}