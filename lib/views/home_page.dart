// lib/view/home_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/cep_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cepController = Provider.of<CepController>(context);
    final TextEditingController cepControllerText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cepControllerText,
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final cep = cepControllerText.text;
                if (cep.isNotEmpty) {
                  cepController.fetchCep(cep);
                }
              },
              child: Text('Consultar'),
            ),
            SizedBox(height: 16),
            cepController.error.isNotEmpty
                ? Text(cepController.error, style: TextStyle(color: Colors.red))
                : cepController.cepModel != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Logradouro: ${cepController.cepModel?.logradouro}'),
                          Text('Bairro: ${cepController.cepModel?.bairro}'),
                          Text('Cidade: ${cepController.cepModel?.localidade}'),
                          Text('UF: ${cepController.cepModel?.uf}'),
                        ],
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
