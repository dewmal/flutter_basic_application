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

  _Counter() {
    Stream<DatabaseEvent> _countStream = counter.onValue;
    _countStream.listen((event) {
      value = event.snapshot.value as int;
    });
  }

  @action
  void increment() async {
    int newVal = value + 1;
    await counter.set(newVal);
  }
}
