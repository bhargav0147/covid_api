import 'dart:convert';

import 'package:covid_api/covid/modal/covid_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apiHelper=ApiHelper();
  String link='https://corona.lmao.ninja/v2/countries/';
  CovidModal covidModal=CovidModal();
  List<CovidModal> jsonData=[];
  Future<List<CovidModal>> getJson()
  async {
    var get =await http.get(Uri.parse(link));
    List json= jsonDecode(get.body);
    jsonData=json.map((e) => CovidModal.fromJson(e)).toList();
    return jsonData;
  }
}