import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSlides extends StatefulWidget {
  @override
  _IntroSlidesState createState() => _IntroSlidesState();
}

class _IntroSlidesState extends State<IntroSlides> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Prepare",
        description: "Prepare your unwashed laundry, set a time limit and make us a request",
        pathImage: "assets/images/laundryPng1.png",
        backgroundColor: Color(0xff2979ff),
      ),
    );
    slides.add(
      new Slide(
        title: "Hold On",
        description: "Hold on a bit while we process your laundry using the best and most recent materials",
        pathImage: "assets/images/laundryPng4.png",
        backgroundColor: Color(0xff757575),
      ),
    );
    slides.add(
      new Slide(
        title: "Enjoy",
        description:
        "Enjoy your newly washed and ironed laundry delivered to your front door within the specified time limit",
        pathImage: "assets/images/laundryPnng2.png",
        backgroundColor: Color(0xff7c4dff),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      colorActiveDot: Color(0xffffffff),
      onDonePress: this.onDonePress,
    );
  }
}