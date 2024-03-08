import 'dart:convert';
import 'dart:developer';

import 'package:conversor_moedas/pages/conversor_moedas_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main () async{
  runApp(const MyApp());
    //TODO: trecho para teste -> remover 
    http.Response response = await http.get(Uri.parse(request));
    //log(Uri.parse(request).toString());
    log(json.decode(response.body)["results"]["currencies"].toString()); // para log é importante usar toString
    //print(json.decode(response.body)["results"]["currencies"]);
    //log(response.body);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
/*
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConversorMoedaPageState(),
    );
  }*/
  //
  //TODO: trecho para teste -> remover 
   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Placeholder(),
    );
  }

}