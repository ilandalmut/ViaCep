// lib/model/cep_model.dart

class CepModel {
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
    );
  }
}
