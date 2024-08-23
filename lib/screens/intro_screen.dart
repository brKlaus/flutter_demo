import 'package:flutter/material.dart';
import 'package:flutter_application_skeleton/data/sp_helper.dart';
import 'package:flutter_application_skeleton/screens/settings_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String name = '';
  String image = 'Lake';

  @override
  void initState() {
    super.initState();
    final helper = SPHelper();
    helper.getSettings().then((settings) {
      name = settings['name'] ?? '';
      image = settings['image'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/$image.jpg',
            fit: BoxFit.cover,
          )),
          const Align(
              alignment: Alignment(0, -0.5),
              child: Text('Welcome',
                  style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                    )
                  ]))),
          Align(
              alignment: const Alignment(0, 0.5),
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SettingsScreen()))
                      },
                  child: const Text('Start')))
        ]));
  }
}
