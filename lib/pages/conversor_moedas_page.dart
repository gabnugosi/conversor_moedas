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
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
               return const Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            default: 
              if (snapShot.hasError) {
                const Center(
                  child: Text(
                    "Erro ao carregar dados...",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else{
                return Container(color: Colors.green);
              }
          }
          throw Exception('Erro ao rodar o switch LOL');
          //TODO: Para a aula 131 olhar o código do themeData da aula 130
        },
      ),
    );
  }
}
