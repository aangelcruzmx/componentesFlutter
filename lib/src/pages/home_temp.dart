import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  // Lista de opciones declarada como constante
  final List<String> opciones = const ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),
      body: ListView(
        children:
            _crearItemsCorta(), // Se llama al método que genera los elementos de la lista
      ),
    );
  }

  // Método que utiliza el operador map para generar la lista de widgets con más atributos
  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'), // Añade un signo de exclamación al final
            subtitle: const Text('Probando atributos'), // Añade un subtítulo
            leading: const Icon(Icons.accessible_sharp), // Ícono a la izquierda
            trailing:
                const Icon(Icons.keyboard_arrow_right), // Ícono a la derecha
            onTap: () {
              // Acción al tocar el elemento
              print('Has seleccionado $item');
            },
          ),
          const Divider(), // Separador entre los elementos
        ],
      );
    }).toList(); // Convierte el iterable en una lista de widgets
  }
}
