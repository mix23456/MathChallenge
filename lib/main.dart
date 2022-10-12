import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = 'None';

  String mathchallenge(String input) {
    String casenum;
    if (input.isNotEmpty) {
      if (input.length != 1) {
        if (input.length.isEven) {
          casenum = '1';
        } else {
          casenum = '2';
        }
      } else {
        casenum = '0';
      }
    } else {
      casenum = 'default';
    }
    switch (casenum) {
      case '0':
        return '-1';
      case '1':
        if (input.substring(0, input.length ~/ 2) !=
            input.substring(input.length ~/ 2, input.length)) {
          for (int i = 2; i <= input.length / 2; i++) {
            print('${input.substring(0, i)}  ${input.substring(i, i + i)}');
            if (input.substring(0, i) != input.substring(i, i + i)) {
              return 'input.';
            } else {
              return input.substring(0, i);
            }
          }
        } else {
          return input.substring(0, input.length ~/ 2);
        }
        return '';
      default:
        return 'None';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              margin: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Typesome'),
                onChanged: (value) {
                  setState(() {
                    output = mathchallenge(value);
                  });
                },
              ),
            ),
            Text(
              'Output: $output',
            ),
          ],
        ),
      ),
    );
  }
}
