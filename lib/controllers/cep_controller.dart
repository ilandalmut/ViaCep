// lib/controller/cep_controller.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cep_model.dart';

class CepController extends ChangeNotifier {
  CepModel? _cepModel;
  String _error = '';

  CepModel? get cepModel => _cepModel;
  String get error => _error;

  Future<void> fetchCep(String cep) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _cepModel = CepModel.fromJson(data);
        _error = '';
      } else {
        _error = 'Erro ao buscar o CEP';
      }
    } catch (e) {
      _error = 'Erro ao buscar o CEP';
    }
    notifyListeners();
  }
}
