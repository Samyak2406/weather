import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class data{
  var url;
  var fulldata;
  data(this.url);
  Future<void> fetch() async{
    var response=await http.get(url);
    if(response.statusCode==200){
     fulldata=response.body;
//     print(fulldata);
      var temperature=jsonDecode(fulldata)['main']['temp'];
      var  condition=jsonDecode(fulldata)['weather'][0]['id'];
      var cityName=jsonDecode(fulldata)['name'];
//      print(temperature);
//      print(condition);
//      print(cityName);
    }
    else{
      //not reached website
    }
  }
}