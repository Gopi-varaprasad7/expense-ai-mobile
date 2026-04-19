import 'package:flutter/material.dart';

void main() {
  runApp(const FintraqApp());
}

class FintraqApp extends StatelessWidget {
  const FintraqApp({super.key})

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Fintraq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
