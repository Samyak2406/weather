import 'package:flutter/material.dart';
var newdata;
class searchpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (data){
                  newdata=data;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on,color: Colors.teal,size: 45,),
                  filled: true,
                  fillColor: Colors.lightBlueAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search a City',
                  hintStyle: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ),
              FlatButton(
                child: Text('Search'),
                onPressed: (){
                  Navigator.pop(context,newdata);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
