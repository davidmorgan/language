import 'dart:async';

import 'package:_fe_analyzer_shared/src/macros/api.dart';

macro class Value implements ClassDeclarationsMacro {
  const Value();

  @override
  FutureOr<void> buildDeclarationsForClass(IntrospectableClassDeclaration clazz, MemberDeclarationBuilder builder) {
    builder.declareInType(DeclarationCode.fromString('SimpleValue.gen({required this.anInt});'));
  }
}
