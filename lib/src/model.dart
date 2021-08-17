library cep_search;

import 'package:cep_search/src/viaCep_repository.dart';
import 'package:dio/dio.dart';

//?Para realizar esse codigo abaixo fiz o seguinte, entrei no site viacepApi e peguei esse json
// {
//   "cep": "01001-000",
//   "logradouro": "Praça da Sé",
//   "complemento": "lado ímpar",
//   "bairro": "Sé",
//   "localidade": "São Paulo",
//   "uf": "SP",
//   "ibge": "3550308",
//   "gia": "1004",
//   "ddd": "11",
//   "siafi": "7107"
// }
//? Depois fui ate o site 'json to dart' https://javiercbk.github.io/json_to_dart/ e colei o json acima e dei o nome da classe
//? ao clicar 'Generate Dart' ele gera a classe abaixo \/
class ViaCepSearch {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  ViaCepSearch(
      {this.cep = '',
      this.logradouro = '',
      this.complemento = '',
      this.bairro = '',
      this.localidade = '',
      this.uf = '',
      this.ibge = '',
      this.gia = '',
      this.ddd = '',
      this.siafi = ''});

//? Estava assim, porém trocamos para factory
  /*
  ViaCepSeatch.fromJson(Map<final String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }
*/
//? agora o codigo acima esta com uma factory
  factory ViaCepSearch.fromJson(Map<String, dynamic> json) {
    return ViaCepSearch(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    return data;
  }

  //*Classe static que retorna uma Future dele mesmo
  //*Toda vez que for chamado o getInstance e passar o cep vai ser retornado todas as variaveis criadas aqui
  //?repare como foi estruturado e separado os metodos nessa função !!
  static Future<ViaCepSearch> getInstance(String cep) async {
    return ViaCepRepository().getViaCep(cep);
  }
}
