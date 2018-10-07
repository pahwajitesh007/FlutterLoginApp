import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userPassController = new TextEditingController();
  String _WelcomeString="";

  _erase() {
    setState(() {
      _userNameController.clear();
      _userPassController.clear();
    });
  }

  _showWelcom() {
    setState(() {
      if (_userNameController.text.isNotEmpty &&
          _userPassController.text.isNotEmpty) {
        _WelcomeString=_userNameController.text;
      } else {
        _WelcomeString='Nothing!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 150.00,
              height: 150.00,
            ),
            //form
            new Container(
              padding: new EdgeInsets.all(15.00),
              height: 180.0,
              width: 380.0,
              color: Colors.greenAccent,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userNameController,
                    decoration: new InputDecoration(
                        hintText: "User Name", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    obscureText: true,
                    controller: _userPassController,
                    decoration: new InputDecoration(
                        hintText: "User Password", icon: new Icon(Icons.lock)),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 10.00)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10.20),
                            child: new RaisedButton(
                                onPressed: _showWelcom,
                                color: Colors.red,
                                textColor: Colors.white70,
                                child: new Text(
                                  "Submit",
                                  style: new TextStyle(
                                    fontSize: 20.10,
                                  ),
                                )),
                          ),
                        ),
                        new Expanded(
                            child: new Container(
                          margin: EdgeInsets.only(left: 10.20),
                          child: new RaisedButton(
                              onPressed: _erase,
                              color: Colors.red,
                              textColor: Colors.white70,
                              child: new Text(
                                "Cancel",
                                style: new TextStyle(
                                  fontSize: 20.10,
                                ),
                              )),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //end form here

            Padding(padding: EdgeInsets.only(top: 51.00)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, $_WelcomeString",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(
                      fontSize: 22.20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _pressSubmit() {
    debugPrint('Submit');
  }

  _pressCancel() {
    debugPrint('Cancel');
  }
}
