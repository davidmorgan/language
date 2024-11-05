// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:macros/macros.dart';

macro class DeclareNext
    implements ClassDeclarationsMacro {
  const DeclareNext();

  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    final methods = await builder.methodsOf(clazz);
    final targetType = methods.first.returnType as NamedTypeAnnotation;
    final targetDeclaration = await builder.typeDeclarationOf(targetType.identifier);
    final targetMethods = await builder.methodsOf(targetDeclaration);
    final name = (targetMethods.map((m) => m.identifier.name).toList()..sort()).last;
    final nextName = '${name}Next${targetMethods.length}';
    builder.declareInType(DeclarationCode.fromParts([
      'int declareNextRan = 0;',
    ]));
    builder.declareInType(DeclarationCode.fromParts([
      'void $nextName() { print("$nextName"); }',
    ]));


    /*final targetMethods = await builder.methodsOf;
    final name = targetMethods.last.identifier.name;
    final nextName = '${name}Next';
    builder.declareInType(DeclarationCode.fromParts([
      'void $nextName() {}',
    ]));*/

  }
}
