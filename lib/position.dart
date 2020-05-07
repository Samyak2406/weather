import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class findPosition{

double latitude,longitude;


  Future<void> findLocation() async{
   try{
     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     latitude=position.latitude;
     longitude=position.longitude;
   }
   catch(exception){}
  }
}