// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:macros/macros.dart';

macro class CopyMethods
    implements ClassDeclarationsMacro {
  const CopyMethods();

  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    final fields = await builder.fieldsOf(clazz);
    final field = fields.where((f) => f.identifier.name == 'target').single;
    builder.declareInType(DeclarationCode.fromParts([
      'int copyMethodsRan = 0;',
    ]));

    final targetType = field.type as NamedTypeAnnotation;
    final targetDeclaration = await builder.typeDeclarationOf(targetType.identifier);
    final targetMethods = (await builder.methodsOf(targetDeclaration)).where((m) => m.identifier.name != 'toString').toList();

    for (final method in targetMethods) {
      final name = method.identifier.name;
    builder.declareInType(DeclarationCode.fromParts([
      'void $name() { print("$name"); }',
    ]));
    }
  }
}

macro class CopyMethods2
    implements ClassDeclarationsMacro {
  const CopyMethods2();

  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    final fields = await builder.fieldsOf(clazz);
    final field = fields.where((f) => f.identifier.name == 'target').single;
    builder.declareInType(DeclarationCode.fromParts([
      'int copyMethods2Ran = 0;',
    ]));

    final targetType = field.type as NamedTypeAnnotation;
    final targetDeclaration = await builder.typeDeclarationOf(targetType.identifier);
    final targetMethods = (await builder.methodsOf(targetDeclaration)).where((m) => m.identifier.name != 'toString').toList();

    for (final method in targetMethods) {
      final name = method.identifier.name;
    builder.declareInType(DeclarationCode.fromParts([
      'void ${name}2() { print("${name}2"); }',
    ]));
    }
  }
}
