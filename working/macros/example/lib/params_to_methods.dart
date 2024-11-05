// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:macros/macros.dart';

macro class ParamsToMethods
    implements ClassDeclarationsMacro {
  const ParamsToMethods();

  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    builder.declareInType(DeclarationCode.fromParts([
      'int macroRan = 0;',
    ]));

    final constructor = (await builder.constructorsOf(clazz)).single;
    final names = constructor.namedParameters.map((p) => p.identifier.name).toList();

    for (final name in names) {
    builder.declareInType(DeclarationCode.fromParts([
      'void $name() { print("$name"); }',
    ]));
    }
  }
}
