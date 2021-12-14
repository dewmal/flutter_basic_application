import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

final counter = FirebaseDatabase.instance.ref("counter");

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() async {
    value++;
    await counter.set(value);
  }
}
