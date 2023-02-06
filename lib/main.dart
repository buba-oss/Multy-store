import 'package:bobde6_multi_web_admin/views/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb
          ? FirebaseOptions(
              apiKey: "AIzaSyDwHqrOkTbD5C6P6bJHChe-jJ67X6008s8",
              appId: "1:49065987595:web:baa4c6ee0199b53de4810e",
              messagingSenderId: "49065987595",
              projectId: "bobde6-multi-store",
              storageBucket: "bobde6-multi-store.appspot.com",
            )
          : null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}
