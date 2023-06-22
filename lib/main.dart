import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoHome | MiniProject'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: ref.child('home1/hall').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data!.snapshot.value);
                    return SizedBox(
                      height: 300,
                      child: GestureDetector(
                        onTap: () async {
                          await ref.child("home1/").update({
                            "hall": !(snapshot.data!.snapshot.value as bool)
                          });
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.asset(
                                      (snapshot.data!.snapshot.value as bool)
                                          ? "assets/lighton.png"
                                          : "assets/lightoff.png")),
                              Text(
                                "Hall",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: ref.child('home1/room').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: GestureDetector(
                        onTap: () async {
                          await ref.child("home1/").update({
                            "room": !(snapshot.data!.snapshot.value as bool)
                          });
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.asset(
                                      (snapshot.data!.snapshot.value as bool)
                                          ? "assets/lighton.png"
                                          : "assets/lightoff.png")),
                              Text(
                                "Room",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
