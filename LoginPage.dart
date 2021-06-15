import 'dart:io';
//import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:punjabi/Fetchmenu.dart';
import 'package:punjabi/Homepage.dart';
import 'Profile.dart';
class Log extends StatelessWidget {
  final  todos;
  Log({Key key, @required  this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Route()
          ),
        ));
  }
}
//import 'package:punjabi/main.dart';
class Route extends StatefulWidget
{

  @override
  Show createState() => Show();


}
class Show extends State<Route> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visible = false ;



  Future userRegistration() async{
    FocusScope.of(context).requestFocus(FocusNode());
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String username = usernameController.text;
    //  String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://punjabisunrise.com/punjabisunrise_api/login_ser.php';

    // Store all data with Param Name.
    var data = {'username': username,'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

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
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                if (message == 'login success') {
                  // Navigator.pushNamed(context, '/home');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProfileUI2(todo: username)));
                }

                else
                  {
                    Navigator.pop(context);
                  }
              },
            ),
          ],
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body:Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bg2.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Positioned(
                                child: AppBar(
                                  title: Text("Login",
                                      style: TextStyle(
                                        color: Colors.amber,)
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide()
                                  ),
                                  //  labelText: 'User Name',
                                  hintText: 'Enter Your Username',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  //labelText: 'Password',
                                  hintText: 'Enter Password',
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: userRegistration,
                              textColor: Colors.white,
                              color: Colors.amber,
                              child: Text('Login'),
                              //(){
                              // Navigator.pushNamed(context, '/home');


                              //  },
                            ),
                            Visibility(
                                visible: visible,
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: CircularProgressIndicator()
                                )
                            ),
                          ],
                        )
                    ) ,
                  )
                ]
            )
        )
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) =>true;
  }
}
