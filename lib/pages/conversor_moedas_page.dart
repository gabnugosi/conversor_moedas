import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?key=cdcc5dac";

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class ConversorMoedaPageState extends StatefulWidget {
  const ConversorMoedaPageState({super.key});

  @override
  State<ConversorMoedaPageState> createState() =>
      _ConversorMoedaPageStateState();
}

class _ConversorMoedaPageStateState extends State<ConversorMoedaPageState> {
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('\$ Conversor de moedas \$'),
      ), /*body: ,*/
    );
  }
}
