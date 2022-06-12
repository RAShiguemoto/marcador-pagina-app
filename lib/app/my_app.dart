import 'package:flutter/material.dart';
import 'package:marca_pagina_app/app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador de Páginas',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff0d1117)),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
