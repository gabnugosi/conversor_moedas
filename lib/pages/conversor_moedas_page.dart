import 'dart:convert';
import 'dart:developer';

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
  double? dolar;
  double? euro;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  void _realChanged(String text) {
    log(text);
  }

  void _dolarChanged(String text) {
    log(text);
  }

  void _euroChanged(String text) {
    log(text);
  }

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
              } else {
                dolar = snapShot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapShot.data?["results"]["currencies"]["EUR"]["buy"];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Icon(Icons.monetization_on,
                            size: 150.0, color: Colors.amber),
                        buildTextField(
                            "Reais", "R\$", realController, _realChanged),
                        const Divider(),
                        buildTextField(
                            "Dólar", "US\$", dolarController, _dolarChanged),
                        const Divider(),
                        buildTextField(
                            "Euros", '€', euroController, _euroChanged),
                      ],
                    ),
                  ),
                );
              }
          }
          throw Exception('Erro ao rodar o switch LOL');
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController coinController, Function(String) coinFunction) {
  return TextField(
    controller: coinController,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.amber),
      border: const OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: const TextStyle(color: Colors.amber),
    onChanged: coinFunction,
    keyboardType: TextInputType.number,
  );
}
