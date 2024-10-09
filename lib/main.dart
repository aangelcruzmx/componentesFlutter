import 'package:flutter/material.dart';
import 'package:procesos/src/pages/HomePage.dart';
import 'package:procesos/src/pages/alert_page.dart';
import 'package:procesos/src/pages/avatar_page.dart';
import 'package:procesos/src/pages/card_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 47, 255)),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        'alert': (BuildContext context) => const AlertPage(),
        'avatar': (BuildContext context) => const AvatarPage(),
        'card': (BuildContext context) => const CardPage(),
      },
      // Agregar onGenerateRoute para rutas dinámicas
      onGenerateRoute: (RouteSettings settings) {
        // Captura de ruta dinámica
        if (settings.name == 'dynamic') {
          return MaterialPageRoute(
            builder: (BuildContext context) => const AlertPage(),
          );
        }
        return null; // Si no es la ruta dinámica, retorna null
      },
      // Manejo de rutas no encontradas (404)
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const UnknownPage(),
        );
      },
    );
  }
}

// Página para rutas no encontradas
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página no encontrada'),
      ),
      body: const Center(
        child: Text(
          '404 - Página no encontrada',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}
