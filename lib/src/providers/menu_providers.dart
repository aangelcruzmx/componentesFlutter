import 'dart:convert'; // Para decodificar el JSON
import 'package:flutter/services.dart'
    show rootBundle; // Para cargar el archivo desde assets

class MenuProvider {
  List<dynamic> opciones = [];

  // Método público para cargar el archivo JSON de manera asíncrona
  Future<List<dynamic>> cargarData() async {
    try {
      // Cargar el archivo JSON desde la ruta assets
      final respuesta =
          await rootBundle.loadString('assets/data/menu_opts.json');

      // Imprimir el contenido del archivo para verificar si se carga correctamente
      print('Contenido del archivo JSON: $respuesta');

      // Decodificar la respuesta (el archivo JSON)
      Map<String, dynamic> dataMap = json.decode(respuesta);

      // Extraer la lista de rutas (opciones del menú) del mapa
      opciones = dataMap['rutas'];

      // Retornar la lista de opciones
      return opciones;
    } catch (e) {
      // Imprimir el error en la consola si algo falla
      print('Error al cargar el archivo JSON: $e');

      // Retornar una lista vacía en caso de error
      return [];
    }
  }
}

// Crear una instancia global para acceder al menú desde cualquier parte de la app
final menuProvider = MenuProvider();
