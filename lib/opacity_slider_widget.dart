import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_opacity_slider/hex_color.dart';
import 'package:flutter_opacity_slider/my_helper.dart';

///
/// Created By AURO (aurosmruti@smarttersstudio.com) on 7/14/2020 4:12 PM
///






class OpacitySlider extends StatefulWidget {
  final String colorHexValue;
  OpacitySlider({this.colorHexValue});
  @override
  _OpacitySliderState createState() => _OpacitySliderState();
}

class _OpacitySliderState extends State<OpacitySlider> {
  int percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80)
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(children: [
              Container(
                height: 80,
                width: 120,
                decoration: BoxDecoration(
                  color: HexColor(MyHelper.alphaValues[percentage]+widget.colorHexValue),
                  borderRadius: BorderRadius.circular(20)
                ),

              ),
              SizedBox(width: 10,),
              Container(
                height: 40,
                width: 120,
                child: Center(child: Text("#"+MyHelper.alphaValues[percentage]+widget.colorHexValue, style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600
                ),)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
              ),
            ],),
            SizedBox(height: 20,),
            Container(
              height: 40,
              width: 65,
              child: Center(child: Text(percentage.toString()+" %", style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: MyHelper.alphaValues.map((e) =>HexColor(e+widget.colorHexValue) ).toList()
                  )
              ),

              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 20,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20, disabledThumbRadius: 20),
                  thumbColor: Colors.green,
                  activeTrackColor: Colors.transparent,
                  inactiveTrackColor: Colors.transparent,
                ),
                child: Slider(
                  max: 100,
                    min: 0,
                    value: percentage.toDouble() ,
                    onChanged: (value){
                      setState(() {
                        percentage = value.toInt();
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

