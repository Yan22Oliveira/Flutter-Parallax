import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ScrollController _scrollController;

  double _scrollOffset = 0.0;

  final double _layer1Speed = 0.5;
  final double _layer2Speed = 0.45;
  final double _layer3Speed = 0.42;
  final double _layer4Speed = 0.375;
  final double _sunSpeed    = 0.12;

  final double _layerH1Speed = 0.1;
  final double _layerH2Speed = 0.08;
  final double _layerH3Speed = 0.075;
  final double _layerH4Speed = 0.07;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      _onScroll();
    });
    super.initState();
  }

  void _onScroll(){
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double layoutHeight = height * 3;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 66, 240, 210),
              Color.fromARGB(255, 255, 244, 193),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: (height * 0.5) + (_sunSpeed * _scrollOffset),
              right: width * 0.3,
              left: 0,
              child: SvgPicture.asset('assets/sun.svg'),
            ),
            Positioned(
              bottom: (_layer4Speed * _scrollOffset),
              right: (_layerH4Speed * _scrollOffset * -1),
              left: (_layerH4Speed * _scrollOffset * -1),
              child: SvgPicture.asset('assets/mountains-layer-4.svg'),
            ),
            Positioned(
              bottom: -20 + (_layer3Speed * _scrollOffset),
              right: (_layerH3Speed * _scrollOffset * -1),
              left: (_layerH3Speed * _scrollOffset * -1),
              child: SvgPicture.asset('assets/mountains-layer-2.svg'),
            ),
            Positioned(
              bottom: -20 + (_layer2Speed * _scrollOffset),
              right: (_layerH2Speed * _scrollOffset * -1),
              left: (_layerH2Speed * _scrollOffset * -1),
              child: SvgPicture.asset('assets/trees-layer-2.svg'),
            ),
            Positioned(
              bottom: -50 + (_layer1Speed * _scrollOffset),
              right: (_layerH1Speed * _scrollOffset * -1),
              left: (_layerH1Speed * _scrollOffset * -1),
              child: SvgPicture.asset(
                'assets/layer-1.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: height + (_layer1Speed * _scrollOffset *-1),
              right: 0,
              left: 0,
              height: height,
              child: Container(
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Parallax Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  height: layoutHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
