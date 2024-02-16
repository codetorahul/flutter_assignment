import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ProfileToolbar(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/welcome_image.png'),
                width: 100.0,
                height: 100.0,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Text(
                  "Adarsh Gupta",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyle(fontSize: 20.0)),
                  Text("Adarsh Gupta", style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email ID", style: TextStyle(fontSize: 20.0)),
                  Text("Not Available", style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Text("Logout",
                  style: TextStyle(fontSize: 20.0, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
