import 'package:dart_hello/dart_hello.dart' as dart_hello;

void main(List<String> arguments) {
  print('Hello world: ${dart_hello.calculate()}!');

  for (final f in fs.reversed) {
    f();
  }
}

var fs = [
  () {
    // const/final
    final name = 'Bob';
    const name2 = 'Paul';
    //name = 'blubb'; // not possible
    //name2 = 'blebb'; // also not possible
    final c = SimpleClass();
    //const d = SimpleClass(); // not possible
    c.x = 10; // final; only shallow const (assignment); can still modify internals
    var X = OtherClass();
    //X.Z = 18; // not possible - final
    OtherClass.U.x = 3;
  },
  () {
    // Functions
    void f() {
      print('f');
    }

    f();
    g(int x) => x * 2; // single statement functions
    print(g(3));
  },
  () {
    // Variables
    int i; // initial value: null
    i = 3; // needs to be initialized before use - null not allowed!
    var j = 5; // auto type
    print('$i $j');
  }
];

// Classes
class Spacecraft {
  String name;
  DateTime? launchDate; // optional member
  Spacecraft(this.name, this.launchDate); // empty constructor, assigning values
  Spacecraft.unlaunched(String name) : this(name, null); // named constructor
}

////////////////////////////////////////////////////

class SimpleClass {
  int x = 0;
  int y = 0;
}

class OtherClass {
  static const X = 10;
  static final Y = 14;
  static final U = SimpleClass();
  final Z = 15;
}
