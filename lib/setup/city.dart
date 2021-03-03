import 'package:flutter/material.dart';

class SetupCity extends StatelessWidget {
  final void Function(String) citySelected;

  const SetupCity({
    Key? key,
    required this.citySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        TextButton(
          onPressed: () => citySelected('test'),
          child: Text('Да'),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
