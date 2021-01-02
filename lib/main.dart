import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lfdel24@gmail.com Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('lfdel24@gmail.com Provider')),
        body: Body(),
        floatingActionButton: FAButton());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Count()],
      ),
    );
  }
}

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class FAButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<Counter>().increment(),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class Counter extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
