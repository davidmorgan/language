import '../declare_next.dart';

@DeclareNext()
class B {
  C? bar() {
    return null;
  }
}

class C {
  void foo() {}
}

void main() {
  B().fooNext1();
}
