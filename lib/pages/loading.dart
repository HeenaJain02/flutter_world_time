import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';


class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {


void setupWorldTime() async {
  WorldTime world= WorldTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');
 await world.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': world.location,
    'flag': world.flag,
    'time': world.time,
    'isDaytime': world.isDaytime
  });
}
void initState(){
  super.initState();
  setupWorldTime();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
        body:Center(
          child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
        )
    );

  }
}
