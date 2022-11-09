import 'package:flutter/material.dart';

class Atogglebutton extends StatefulWidget {
  const Atogglebutton({ Key? key }) : super(key: key);

  @override
  State<Atogglebutton> createState() => _AtogglebuttonState();
}

class _AtogglebuttonState extends State<Atogglebutton> {
 
bool toggleValue=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height:20.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: toggleValue? Colors.greenAccent[100]: Colors.redAccent[100]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [],
        ),
        )
    );
  }
}