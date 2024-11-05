import '../copy_methods.dart';
import '../params_to_methods.dart';

@CopyMethods2()
@ParamsToMethods()
class C {
  static final C? target = null;

  C({int? x, int? y, int? z});

  void a() {}
}
