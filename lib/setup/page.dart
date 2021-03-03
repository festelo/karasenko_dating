import 'package:flutter/material.dart';
import 'package:karasenko/fadable.dart';
import 'package:karasenko/setup/city.dart';
import 'package:karasenko/setup/details.dart';
import 'package:karasenko/setup/summary.dart';
import 'package:karasenko/setup/target.dart';

class SetupPage extends StatefulWidget {
  final VoidCallback finish;
  final bool setupCompleted;
  final VoidCallback resetSetup;

  const SetupPage({
    Key? key,
    required this.finish,
    required this.setupCompleted,
    required this.resetSetup,
  }) : super(key: key);

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  bool next = false;
  bool settedUp = false;

  @override
  void initState() {
    super.initState();
    settedUp = widget.setupCompleted;
  }

  void finish() {
    widget.finish();
    setState(() => next = true);
  }

  PageController controller = PageController();

  String? cityId;
  Set<Sex> selectedTargets = {Sex.male, Sex.female};

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
              SizedBox(
                height: 320,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: settedUp
                      ? SetupDetails(
                          selectedTargets: selectedTargets,
                          onReset: () {
                            setState(() => settedUp = false);
                            widget.resetSetup();
                          },
                        )
                      : PageView(
                          controller: controller,
                          onPageChanged: (page) {
                            if (page == 2) {
                              finish();
                            }
                          },
                          children: [
                            SetupCity(
                              citySelected: (s) async {
                                setState(() => cityId = s);
                                controller.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubic,
                                );
                              },
                            ),
                            if (cityId != null)
                              SetupTarget(
                                selectedTargets: selectedTargets,
                                onTargetsUpdated: (t) =>
                                    setState(() => selectedTargets = t),
                                onNext: () {
                                  controller.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                  );
                                },
                              ),
                            if (cityId != null && selectedTargets.isNotEmpty)
                              SetupSummary(
                                selectedTargets: selectedTargets,
                              ),
                          ],
                        ),
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
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 600),
                  child: settedUp || next
                      ? Icon(
                          Icons.arrow_downward,
                          key: ValueKey('nextIcon'),
                          color: Colors.white,
                          size: 42,
                        )
                      : Icon(
                          Icons.person_outline_rounded,
                          key: ValueKey('waitIcon'),
                          color: Colors.white,
                          size: 42,
                        ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
