import 'package:flutter/material.dart';
import 'package:flutter_opacity_slider/hex_color.dart';
import 'package:flutter_opacity_slider/opacity_slider_widget.dart';

///
/// Created By AURO (aurosmruti@smarttersstudio.com) on 7/14/2020 4:11 PM
///



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _selectedColor = '000000';
  TextEditingController textEditingController = TextEditingController();
  List<String> colorsList = [
    "db2727",
    "C0B40C",
    "56252F",
    "BB5E11",
    "F26157",
    "1EA896",
    "FF715B",
    "4C5454",
    "1B2A41",
    "CCC9DC",
    "12EAEA",
    "A4243B"
  ];

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width  =  MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: width/4,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Enter a valid hex color code", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
          Center(
            child: SizedBox(
              width: width/3,
              child: TextField(
                maxLength: 6,
                controller: textEditingController,
                onChanged: (value){
                  setState(() {
                    _selectedColor = value;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15, color: Color(0xff9b9b9b)) ,
                  fillColor: Color(0xfff0f0f0),
                  filled: true,
                  errorStyle: TextStyle(fontSize: 11, height: 1, color: Colors.red),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(width: 0.5)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color:  Color(0xfff0f0f0))),
                ),

              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("---------------OR---------------", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Pick a color", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          Center(
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: colorsList.map((e) => InkWell(
                onTap: (){
                  setState(() {
                    _selectedColor = e;
                  });
                },
                child: Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor(e),
                    border: Border.all(color: _selectedColor == e?Colors.amberAccent:Colors.transparent, width: 7)
                  ),

                ),
              )).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Opacity Slider'),
                      content: OpacitySlider(colorHexValue: _selectedColor,),
                    )
                );
              },
              child: Container(
                  width: 170,
                  height: 50,
                  child: Center(child: Text("Opacity Slider", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      gradient: LinearGradient(
                          begin: Alignment(1, 0.5694444179534912),
                          end: Alignment(0.0882352963089943, 0.5),
                          colors: [const Color(0xfffe9654), const Color(0xfffd6c57)])
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
