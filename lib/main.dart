import 'package:ablelo_chat/Screens/chat_page.dart';
import 'package:ablelo_chat/Screens/discover_page.dart';
import 'package:ablelo_chat/Screens/profile_page.dart';
import 'package:flutter/material.dart';
//import 'Screens/splashpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/home_page.dart';
import 'Screens/login_page.dart';
import 'Screens/chat_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ablelo Chat',
      debugShowCheckedModeBanner: false,
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, userSnapshot) {
      //     if (userSnapshot.hasData) {
      //       return HomePage();
      //     } else if (userSnapshot.hasError) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return HomePage();
      //   },
      // ),
      home: DiscoverPage(),
    );
  }
}
