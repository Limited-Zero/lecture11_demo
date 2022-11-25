import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  static const String title3 = 'Third Page Route';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text(ThirdPage.title3)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go to First Page')
            ),
          ],
        ),
      )
  );
}