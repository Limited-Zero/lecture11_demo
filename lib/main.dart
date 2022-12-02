import 'package:flutter/material.dart';
import 'thirdpage.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  static const String title = 'Route Example';
  static const String title2 = 'Second Page Route';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          routes: <GoRoute>[
            GoRoute(
              path: 'page2',
              builder: (BuildContext context, GoRouterState state) =>
              const SecondPage(),
            ),
            GoRoute(
              path: 'page3',
              builder: (BuildContext context, GoRouterState state) =>
              const ThirdPage(),
            ),
          ],
        path: '/',
        builder: (BuildContext context,  GoRouterState state) =>
        const FirstPage(),
      ),
    ],
  );
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
   appBar: AppBar(title: const Text(App.title)),
   body: Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children:<Widget>[
       SizedBox(height: 100),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
           onPressed: () => context.go('/page2'),
           child: const Text('Select Page 2'),
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
           onPressed: () => context.go('/page3'),
           child: const Text('Select Page 3'),
         ),
       ),
     ],
   ),
  );
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text(App.title2)),
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