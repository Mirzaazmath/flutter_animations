import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart>with SingleTickerProviderStateMixin {

  bool isfav=false;
//this is animationcontroller
  AnimationController _animationController;
  //this is used for animation
  Animation<Color> _coloranimation;
  Animation<double>_sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this);
    _coloranimation=ColorTween(begin: Colors.grey[400],end: Colors.red).animate(_animationController);
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 30,end: 50),
          weight: 50,
        ), TweenSequenceItem<double>(
        tween: Tween(begin: 50,end: 30),
        weight: 50,
      ),
      ]
    ).animate(_animationController);
//this is used to listen any change in animation
    _animationController.addListener(() {

    });
    //this is used in listening the controller status it is done or not
    _animationController.addStatusListener((status) {
      //here we changing the bool value depending on  status
      if(status==AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
        if(status==AnimationStatus.dismissed){
          setState(() {
            isfav=false;

          });
      }

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context,_){
        return  IconButton(
          icon: Icon(
            Icons.favorite,
            color:_coloranimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
           isfav? _animationController.reverse(): _animationController.forward();
          },
        );
      },

    );
  }
}
