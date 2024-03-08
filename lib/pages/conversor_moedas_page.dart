import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?key=cdcc5dac";


dynamic jsonDecoder(String text){
  return json.decode(text);
}

Future<http.Response> obtainRequest() async {
  http.Response response = await http.get(Uri.parse(request));
  log(jsonDecoder(response.body));
  return jsonDecoder(response.body);
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
    obtainRequest();
    return const Placeholder();
  }
}
