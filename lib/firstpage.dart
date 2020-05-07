import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/position.dart';
import 'package:weather/secondpage.dart';
import 'position.dart';
import 'secondpage.dart';
import 'weatherdata.dart';


//step1 find my position    /               error when the user denies to give location permission
//step2 ask the api for the data of my location


const String apikey='dcd4d2c6d5ed37144f1232314fcddb41';
class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  @override
  void initState() {
    super.initState();
    findPositionData();
  }

  void findPositionData() async{
    findPosition f=new findPosition();
    await f.findLocation();
    var latitude=f.latitude;
    var longitude=f.longitude;
    data fetched=data('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
//    data fetched=data('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    await fetched.fetch();
//    Navigator.pop(context);
    Navigator.push(context,MaterialPageRoute(builder: (context){return second(data: fetched.fulldata);}));
//
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: SpinKitFoldingCube(
              color: Colors.red,
              size: 125,
            ),
          ),
          decoration:BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
