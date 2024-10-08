import 'package:apitutorial/Services/apiController.dart';
import 'package:apitutorial/photosExample.dart';
import 'package:apitutorial/postsExample.dart';
import 'package:apitutorial/productsExample.dart';
import 'package:apitutorial/usersExample.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>PostsApiController()),
        ChangeNotifierProvider(create: (context)=> productsApiController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const usersExample(),
      ),
    );
  }
}

