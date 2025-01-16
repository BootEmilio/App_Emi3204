import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_emi3204/main.dart';

void main() {
  testWidgets('Test de navegación y contenedores', (WidgetTester tester) async {
    // Construir la aplicación y disparar un frame
    await tester.pumpWidget(MyApp());

    // Verificar que los contenedores con los nombres correctos se muestran
    expect(find.text('Design'), findsOneWidget);
    expect(find.text('Images'), findsOneWidget);
    expect(find.text('List'), findsOneWidget);
    expect(find.text('Forms'), findsOneWidget);

    // Tocar el contenedor 'Design' y verificar que navega correctamente
    await tester.tap(find.text('Design'));
    await tester.pumpAndSettle(); // Esperar a que la animación de navegación termine

    // Verificar que estamos en la página de 'Design'
    expect(find.text('Página de Design'), findsOneWidget);

    // Volver a la página principal
    Navigator.of(tester.element(find.text('Página de Design'))).pop();
    await tester.pumpAndSettle();

    // Tocar el contenedor 'Images' y verificar que navega correctamente
    await tester.tap(find.text('Images'));
    await tester.pumpAndSettle(); // Esperar a que la animación de navegación termine

    // Verificar que estamos en la página de 'Images'
    expect(find.text('Página de Images'), findsOneWidget);
  });
}
