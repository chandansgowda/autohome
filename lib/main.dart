import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLightOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ananya'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            SizedBox(
              height: 300,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isLightOn = !isLightOn;
                  });
                },
                child: Card(child: Column(
                  children: [
                    Expanded(child: Image.asset(isLightOn ? "assets/lighton.png" : "assets/lightoff.png")),
                    Text("Room", style: TextStyle(fontSize: 30),),
                  ],
                ),),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 300,
              child: Card(child: Column(
                children: [
                  Expanded(child: Image.asset("assets/lightoff.png")),
                  Text("Hall", style: TextStyle(fontSize: 30),),
                ],
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
