import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/position.dart';
import 'package:weather/searchpage.dart';
import 'position.dart';
import 'weatherdata.dart';


const String apikey='dcd4d2c6d5ed37144f1232314fcddb41';

class second extends StatefulWidget {
  final data;
  second({this.data});
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
int temperature;
String location;
int condition;
  @override
  void initState() {
    super.initState();
    getvalues(widget.data);
  }

  void getvalues(dynamic newdata){
    setState(() {
      double temp=(jsonDecode(newdata)['main']['temp']);
      temperature=temp.toInt();
      condition=jsonDecode(newdata)['weather'][0]['id'];
      location=jsonDecode(newdata)['name'];
      print('new data fetched $location');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                color: Colors.blue,
                  child: Text(
                    'Search for location',
                  ),
                onPressed: ()async{
                  var searchText=await Navigator.push(context,MaterialPageRoute(builder: (context){return searchpage();}));
                  print(searchText);
                  if(searchText!=null){
                    data fetched1=data('https://api.openweathermap.org/data/2.5/weather?q=$searchText&appid=$apikey&units=metric');
                    await fetched1.fetch();
                    setState(() {
                      getvalues(fetched1.fulldata);
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                color: Colors.red,
                child: Text('Update data at your location'),
                onPressed: () async {
                  findPosition f=new findPosition();
                  await f.findLocation();
                  var latitude=f.latitude;
                  var longitude=f.longitude;
                  data fetched1=data('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
                  await fetched1.fetch();
//                  print('this is supposed to be first ${fetched1.fulldata}');
                  setState(() {
                    getvalues(fetched1.fulldata);
                  });
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Text(temperature.toString()+'°',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 100,
                ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(location.toString(),
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 60,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

