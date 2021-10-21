import 'package:flutter/foundation.dart';

class SelectorProvider with ChangeNotifier {
  //Crea un mapa de valores booleanos
  final Map<String, bool> _seleccion = {
    'think-tank': true,
    'parklive': false,
    '13': false,
  };
  String _rutaSeleccionada = 'think-tank.jpg';

  //Sirve para obtener el mapa
  Map<String, bool> get seleccion => _seleccion;
  //Sirve para obtener la ruta de la imagen seleccionada
  String get rutaSeleccionada => _rutaSeleccionada;

  void cambiarSeleccion(String nombre, String ruta) {
    //Establece todos los valores del mapa a falso
    _seleccion.updateAll((key, value) => false);
    //Establece un valor verdadero según la clave indicada
    _seleccion[nombre] = true;
    //Establece la ruta seleccionada
    _rutaSeleccionada = ruta;
    //Notifica a los escuchadores para actualizar el widget
    notifyListeners();
  }
}
