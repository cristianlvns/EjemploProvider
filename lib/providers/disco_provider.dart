import 'package:app_provider/models/disco_model.dart';
import 'package:flutter/foundation.dart';

class DiscoProvider with ChangeNotifier {
  //Inicializa una lista de items
  final List<DiscoModel> _catalogo = [];

  //Sirve para obtener la lista
  List<DiscoModel> get catalogo => _catalogo;
  //Sirve para obtener el número de items en la lista
  int get count => _catalogo.length;
  //Sirve para obtener el id del último widget
  int get lastId => _catalogo.last.id;

  void agregarDiscosIniciales(DiscoModel discoModel) {
    _catalogo.add(discoModel);
    //No es necesario notificar, ya que es el estado inicial
  }

  void agregarAlCatalogo(DiscoModel discoModel) {
    //Agrega un item al catalogo
    _catalogo.add(discoModel);
    //Notifica a los escuchadores para actualizar el widget
    notifyListeners();
  }

  void borrarDelCatalogo(DiscoModel discoModel) {
    //Borra un item del catalogo
    _catalogo.remove(discoModel);
    //Notifica a los escuchadores para actualizar el widget
    notifyListeners();
  }
}
