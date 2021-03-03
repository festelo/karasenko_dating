import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:karasenko/physics.dart';
import 'package:karasenko/progress/page.dart';
import 'package:karasenko/setup/page.dart';

import 'fadable.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool setupCompleted = false;
  bool searching = true;

  void setLoggedIn() {
    setState(() => setupCompleted = true);
    Timer(Duration(seconds: 4), () => setSearching(false));
  }

  void setSearching(bool val) {
    setState(() => searching = val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            center: FractionalOffset.center,
            startAngle: 0.0,
            endAngle: 3.14 * 2,
            colors: const <Color>[
              Color(0xFF4285F4),
              Color(0xFF34A853),
              Color(0xFFFBBC05),
              Color(0xFFEA4335),
              Color(0xFF4285F4),
            ],
            stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: SizedBox.expand(
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: CustomPageViewScrollPhysics(),
                allowImplicitScrolling: false,
                children: [
                  SetupPage(
                    finish: () {
                      setSearching(true);
                      setLoggedIn();
                    },
                    setupCompleted: setupCompleted,
                    resetSetup: () => setState(() => setupCompleted = false),
                  ),
                  if (setupCompleted) ...[
                    if (searching)
                      ProgressPage()
                    else ...[
                      FirstView(),
                      SecondView(),
                    ]
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  Widget content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(),
                Fadable(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  height: 200,
                  width: 200,
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://sun1-92.userapi.com/s/v1/ig2/KRg6lLY3i0IErDeYe9dCfcP-nqT5jmNAw3CZMoW8KKRI7aQV-GQAbbC8YfVFEY_mtHlzWBj2eHfc8qOCTxU9j2d1.jpg?size=200x0&quality=96&crop=374,612,382,382&ava=1',
                    ),
                  ),
                ),
                Spacer(),
                Fadable(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Text(
                'Илья',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Text(
                        '😡',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Text(
                        '💬',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Text(
                        '👀',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: 30 * 4 + 10,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(1),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(pikabuAva),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(1),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(habrAva),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(1),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(kaliningradAva),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(1),
                        alignment: Alignment.center,
                        child: Text(
                          '+5',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: Fadable(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Icon(Icons.keyboard_arrow_up,
                      color: Colors.white, size: 38),
                ),
                Positioned(
                  top: 24,
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment(0, 0.5),
            child: Text(
              'Ваши совпадения',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: TabBarView(
            controller: controller,
            physics: CustomPageViewScrollPhysics(),
            children: [
              content(),
              content(),
              content(),
            ],
          ),
        ),
        Center(
          child: Fadable(
            child: Icon(Icons.arrow_downward, color: Colors.white, size: 42),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

const pikabuAva =
    'https://sun9-3.userapi.com/c630017/v630017880/1271c/1OvQJ6Gew98.jpg?ava=1';

const habrAva =
    'https://sun1-84.userapi.com/s/v1/ig1/xiDx2spXM3Ax-SxOfKB1JOUg2WW0Mu8vJESd-5HHNT5JD1H7YoN0P8gX2GfuaTJF_0WH6SCy.jpg?size=200x0&quality=96&crop=0,0,567,567&ava=1';

const kaliningradAva =
    'https://sun1-88.userapi.com/s/v1/if1/33eIzx3D5Pd0inXw-Lcx20gbmOWfTAptG9cp47aVfyYhtYivtQPgMZ-4zXjA58J8TYZHZjPz.jpg?size=200x0&quality=96&crop=0,0,500,500&ava=1';

class SecondView extends StatelessWidget {
  Widget card(String imageUrl, String name) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Подписчиков: ',
                      ),
                      Text(
                        '120К',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          'Илья Береговский',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Общие группы',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 20),
        card(
          pikabuAva,
          'Пикабу',
        ),
        SizedBox(height: 14),
        card(
          habrAva,
          'Хабр',
        ),
        SizedBox(height: 14),
        card(
          kaliningradAva,
          'Калининград Онлайн',
        ),
      ],
    );
  }
}
