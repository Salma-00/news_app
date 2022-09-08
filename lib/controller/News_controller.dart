import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../model/nes_moel.dart';


class NewsController extends GetxController{
  RxInt currentIndex=0.obs;
  getData(String cat)async{
    //https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=22312b38d0ab4658a4fb4317e7ae036f
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=22312b38d0ab4658a4fb4317e7ae036f");
  http.Response response = await http.get(url);
  
  if(response.statusCode==200)
  {
    try{
      return Articles.fromJson(jsonDecode(response.body));
    }catch(e)
    {
      Get.snackbar("error", e.toString());
    }
  }
  }
}