import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            appBar: AppBar(title: Text('Contact Us form'),backgroundColor:Colors.black),
            body: Center(
                child: ContactUser()
            )
        )
    );
  }
}

class ContactUser extends StatefulWidget {

  ContactUserState createState() => ContactUserState();

}

class ContactUserState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final firstName = TextEditingController();
  final lastName= TextEditingController();
  final phoneNo= TextEditingController();
  final subject= TextEditingController();
  final message= TextEditingController();
  final emailController = TextEditingController();

  Future contactUser() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String fName = firstName.text;
    String email = emailController.text;
    String lName = lastName.text;
    String no = phoneNo.text;
    String msg = message.text;
    String sub = subject.text;
    // SERVER API URL
    var url = 'https://punjabisunrise.com/punjabisunrise_api/contact_us.php';

    // Store all data with Param Name.
    var data = {'fName': fName, 'email': email, 'lName' : lName,'no':no,'msg':msg,'sub':sub};

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
            ElevatedButton(
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
                        controller: firstName,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Name Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: lastName,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Last Name Here'),
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
                        controller: phoneNo,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Enter Your Phone No Here'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: subject,
                        autocorrect: true,

                        decoration: InputDecoration(hintText: 'Subject'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: message,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Enter Your message'),
                      )
                  ),


                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: contactUser,
                    color: Colors.amberAccent,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('Submit'),
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