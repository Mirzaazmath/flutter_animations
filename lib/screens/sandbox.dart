import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {


  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin=0;
  double _opacity=1;
  double _width=200;
  Color _color=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds:1 ),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            RaisedButton(
                child: Text("animate margin"),
                onPressed: (){
                  setState(() {
                    _margin=50;
                  });
                }),
            RaisedButton(
                child: Text("animate color "),
                onPressed: (){
                  setState(() {
                    _color=Colors.purple;
                  });
                }),
            RaisedButton(
                child: Text("animate width "),
                onPressed: (){
                  setState(() {
                    _width=MediaQuery.of(context).size.width;
                  });
                }),

            RaisedButton(
                child: Text("animate opacity "),
                onPressed: (){
                  setState(() {
                    _opacity=0;
                  });
                }),
            AnimatedOpacity(opacity: _opacity, duration: Duration(seconds: 2),
            child: Text("hide me",style: TextStyle(color: Colors.white, fontSize: 50),),
            )


          ],
        ),


      ),
    );
  }
}
