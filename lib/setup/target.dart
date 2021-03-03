import 'package:flutter/material.dart';

enum Sex { male, female, child }

extension SexExtension on Sex {
  String emoji() {
    switch (this) {
      case Sex.male:
        return '👨';
      case Sex.female:
        return '👩';
      case Sex.child:
        return '👶';
    }
  }
}

class SetupTarget extends StatelessWidget {
  final void Function() onNext;
  final void Function(Set<Sex> sex) onTargetsUpdated;
  final Set<Sex> selectedTargets;

  const SetupTarget({
    Key? key,
    required this.selectedTargets,
    required this.onTargetsUpdated,
    required this.onNext,
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
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            children: [
              Text(
                'Кого вы ищите?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final sex in Sex.values)
              GestureDetector(
                onTap: () {
                  final list = selectedTargets.contains(sex)
                      ? ({...selectedTargets}..remove(sex))
                      : {...selectedTargets, sex};
                  onTargetsUpdated(list);
                },
                child: Container(
                  width: 40,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: Text(
                          sex.emoji(),
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedTargets.contains(sex)
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        height: 4,
                        width: 4,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 25),
        TextButton(
          onPressed: selectedTargets.isNotEmpty ? onNext : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('Дальше'),
          ),
        ),
      ],
    );
  }
}
