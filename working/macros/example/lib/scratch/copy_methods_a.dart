import '../copy_methods.dart';
import '../params_to_methods.dart';
import '../print_methods.dart';
import 'copy_methods_split1.dart' as split1;

@CopyMethods()
@PrintMethods()
class A {
  static final B? target = null;

  String toString();
}

@CopyMethods()
class B {
  static final C? target = null;
}

@CopyMethods2()
@ParamsToMethods()
@PrintMethods()
class C {
  static final C? target = null;

  C({int? x, int? y, int? z});

  void a() {}

  String toString();
}

@PrintMethods()
class D {
  static final C? target = null;

  String toString();
}

@PrintMethods()
class D2 {
  static final split1.A? target = null;

  String toString();
}

void main() {
  A().copyMethodsRan;

  // Works on analyzer and CFE.

  C().a2();
  C().x();
  C().x2();

  // Remainder work on analyzer but fail on CFE.

  /*B().a2();
  B().x();
  B().x2();

  A().a2();
  A().x();
  A().x2();*/

  // analyzer: a, x, y, z, a2, x2, y2, z2
  // cfe: same
  print('methods: ${D()}');

  // cfe: empty string
  print('methods elsewhere: ${D2()}');

  print('A: ${A()}');
  print('B: ${B()}');
  print('C: ${C()}');
  print('D: ${D()}');
  print('D2: ${D2()}');
}
