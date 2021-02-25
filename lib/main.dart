import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
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
                children: [
                  LoginView(),
                  ProgressView(),
                  FirstView(),
                  SecondView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'НИИ Лев Карасенко',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      padding: EdgeInsets.all(1),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://sun1-92.userapi.com/s/v1/ig2/KRg6lLY3i0IErDeYe9dCfcP-nqT5jmNAw3CZMoW8KKRI7aQV-GQAbbC8YfVFEY_mtHlzWBj2eHfc8qOCTxU9j2d1.jpg?size=200x0&quality=96&crop=374,612,382,382&ava=1',
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Илья',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Данное приложение поможет вам найти новых знакомых с похожими интересами, основываясь на информации с вашей страницы',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        children: [
                          Text(
                            'Ваш город - ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Калининград',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(onPressed: () {}, child: Text('Да')),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Fadable(
                child:
                    Icon(Icons.arrow_downward, color: Colors.white, size: 42),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Идет поиск',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Приложение ищет людей среди всех пользователей ВК. Скорее всего, они не будут в курсе, как и где вы их нашли.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Поиск может занять какое-то время',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
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
        SizedBox(height: 15),
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),
        Text(
          'НИИ Лев Карасенко',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 50),
        Expanded(
          child: TabBarView(
            controller: controller,
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
          'https://sun9-3.userapi.com/c630017/v630017880/1271c/1OvQJ6Gew98.jpg?ava=1',
          'Пикабу',
        ),
        SizedBox(height: 14),
        card(
          'https://sun1-84.userapi.com/s/v1/ig1/xiDx2spXM3Ax-SxOfKB1JOUg2WW0Mu8vJESd-5HHNT5JD1H7YoN0P8gX2GfuaTJF_0WH6SCy.jpg?size=200x0&quality=96&crop=0,0,567,567&ava=1',
          'Хабр',
        ),
        SizedBox(height: 14),
        card(
          'https://sun1-88.userapi.com/s/v1/if1/33eIzx3D5Pd0inXw-Lcx20gbmOWfTAptG9cp47aVfyYhtYivtQPgMZ-4zXjA58J8TYZHZjPz.jpg?size=200x0&quality=96&crop=0,0,500,500&ava=1',
          'Калининград Онлайн',
        ),
      ],
    );
  }
}

class Fadable extends StatefulWidget {
  final Widget child;

  const Fadable({Key? key, required this.child}) : super(key: key);

  @override
  _FadableState createState() => _FadableState();
}

class _FadableState extends State<Fadable> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600),
      lowerBound: 0.6,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: widget.child,
    );
  }
}
