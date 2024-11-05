import '../copy_methods.dart';
import 'copy_methods_split2.dart';

@CopyMethods()
class A {
  static final B? target = null;
}

@CopyMethods()
class B {
  static final C? target = null;
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
}
