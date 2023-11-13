import 'package:flutter/material.dart';

class LoginCall extends StatelessWidget {
  const LoginCall({Key? key}) : super(key: key);
  static String name = "";
  static String userId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                name = val;
              },
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) {
                userId = val;
              },
              decoration: InputDecoration(
                  hintText: "UserId", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "home_call");
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}