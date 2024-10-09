import 'package:flutter/material.dart';
import 'package:procesos/src/providers/menu_providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importar FontAwesome

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes')),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los datos'));
        }

        return ListView(
          children: _crearItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _crearItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: _getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          // Navegación a rutas con nombre
          if (opt['ruta'] == 'dynamic') {
            // Navegación a una ruta dinámica
            Navigator.pushNamed(context, 'dynamic');
          } else {
            Navigator.pushNamed(context, opt['ruta']);
          }
        },
      );

      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    });

    return opciones;
  }

  // Método para obtener el ícono adecuado usando FontAwesome
  Icon _getIcon(String nombreIcono) {
    switch (nombreIcono) {
      case 'add_alert':
        return const Icon(FontAwesomeIcons.bell, color: Colors.blue);
      case 'accessibility':
        return const Icon(FontAwesomeIcons.accessibleIcon, color: Colors.blue);
      case 'folder_open':
        return const Icon(FontAwesomeIcons.folderOpen, color: Colors.blue);
      default:
        return const Icon(FontAwesomeIcons.question,
            color: Colors
                .blue); // Icono predeterminado si no se encuentra el nombre
    }
  }
}
