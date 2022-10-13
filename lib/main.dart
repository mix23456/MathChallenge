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
      debugShowCheckedModeBanner: false,
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
  String output = 'No Input';

  String mathchallenge(String input) {
    if (input.isNotEmpty) {
      if (input.length != 1) {
        for (int i = input.length ~/ 2; i > 0; i--) {
          var temp = input.substring(0, i);
          // ignore: dead_code
          for (int j = temp.length; j < input.length; j += temp.length) {
            if (input.startsWith(temp, j) && input.length % temp.length == 0) {
              return temp;
            }
            break;
          }
        }
        return '-1';
      } else {
        return '-1';
      }
    } else {
      return 'No Input';
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
