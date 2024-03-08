import 'package:conversor_moedas/pages/conversor_moedas_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConversorMoedaPageState(),
    );
  }
  //
  //TODO: trecho para teste -> remover
  /*
   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Placeholder(),
    );
  }
*/
}
