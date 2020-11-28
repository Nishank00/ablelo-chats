import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Color: 0xff3f7b82
//Light: 0xffb4d4c0

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  List<String> userNames = ["Nishank", "Keval", "Ashish", "Anuj"];

  List<String> recentMessages = [
    'Hello, how are you?',
    "Hello darkness my old friend",
    'Hello, how are you?',
    "Hello darkness my old friend",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f7b82),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3f7b82),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xff3f7b82),
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      color: Color(0xffb4d4c0),
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Text(
                    "Messages",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      color: Color(0xffb4d4c0),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black45,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //User Chats
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                    color: Colors.white70),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Color(0xffb4d4c0),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nishank Sidhpura",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            "Hello, How are you",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("10:21"))
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
