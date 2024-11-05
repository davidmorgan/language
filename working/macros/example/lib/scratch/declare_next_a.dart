import '../declare_next.dart';
import 'declare_next_b.dart';

@DeclareNext()
class A {
  B? foo() {
    return null;
  }
}

void main() {
  A().macroRan;
  //A().fooNext1Next2();
  A().barNext1();
}
