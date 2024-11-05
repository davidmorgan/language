// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:macros/macros.dart';

macro class PrintMethods
    implements ClassDefinitionMacro {
  const PrintMethods();

  @override
  void buildDefinitionForClass(
      ClassDeclaration clazz, TypeDefinitionBuilder builder) async {
    final fields = await builder.fieldsOf(clazz);
    final field = fields.where((f) => f.identifier.name == 'target').single;

    final targetType = field.type as NamedTypeAnnotation;
    final targetDeclaration = await builder.typeDeclarationOf(targetType.identifier);
    final targetMethods = await builder.methodsOf(targetDeclaration);
    final targetMethodNames= targetMethods.map((m) => m.identifier.name).toList();


    final methodIdentifier = (await builder.methodsOf(clazz)).where((m) => m.identifier.name == 'toString').single.identifier;
    final methodBuilder = await builder.buildMethod(methodIdentifier);
    methodBuilder.augment(FunctionBodyCode.fromParts([
      '=> "',
      targetMethodNames.join(', '),
      '";',
    ]));
    }

    }

