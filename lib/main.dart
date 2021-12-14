import 'package:flutter/material.dart';
import 'package:flutter_basic/store/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final Counter counter = Counter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPageWithMobx(),
    );
  }
}

class MyPageWithMobx extends StatelessWidget {
  const MyPageWithMobx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ceylon AI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count with Mobx',
            ),
            Observer(
                builder: (_) => Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {counter.increment()},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;
  }
}
