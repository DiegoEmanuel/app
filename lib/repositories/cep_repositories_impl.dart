import 'package:app/models/endereco_model.dart';
import 'package:dio/dio.dart';

import './cep_repositories.dart';

class CepRepositoriesImpl implements CepRepositories {
  @override
  Future<EnderecoModel> getCep(String cep) async {
    final result = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return EnderecoModel.fromMap(result.data);
  }
}
