import 'package:flutter/material.dart';
//import 'package:punjabi/main.dart';
import 'package:punjabi/LoginPage.dart';
class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, //
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/br1.jpg"),
                    fit: BoxFit.cover
                )
            ),

            child: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),

                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');

                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.amber,
                                fontSize: 20.0),

                          ),
                        ),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');

                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      )
                  ),

                ],

              ),


            )
        )


    );
  }
}