import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/register_page.dart';
import 'package:flutter_basic/store/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var theme = ThemeData.light().copyWith(
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo));

    var textTheme = theme.textTheme;
    return MultiProvider(
      providers: [
        Provider<Counter>(
          create: (_) => Counter(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
            textTheme: textTheme.copyWith(
          headline1: textTheme.headline1?.copyWith(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
          headline2: textTheme.headline2?.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
          headline3: textTheme.headline3?.copyWith(
              fontSize: 18.72,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
          headline4: textTheme.headline4?.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
          headline5: textTheme.headline5?.copyWith(
              fontSize: 13.28,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
          headline6: textTheme.headline6?.copyWith(
              fontSize: 10.72,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF6545a4)),
        )),
        home: const RegisterPage(),
      ),
    );
  }
}

class MyPageWithMobx extends StatelessWidget {
  const MyPageWithMobx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ceylon AI"),
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
