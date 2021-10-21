import 'package:app_provider/models/disco_model.dart';
import 'package:app_provider/providers/disco_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Importa el mapa y se le asigna un alias
import 'package:app_provider/models/discos.dart' as discos_iniciales;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Hace el recorrido del mapa
    for (var element in discos_iniciales.listaDiscos) {
      //Se llama al método agregar del Provider y se le manda un objeto DiscoModel
      context.read<DiscoProvider>().agregarDiscosIniciales(DiscoModel(
            id: element['id'],
            nombre: element['nombre'],
            artista: element['artista'],
            rutaImagen: element['rutaImagen'],
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Discos'),
      ),
      body: const ListaDiscos(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/nuevodisco');
        },
      ),
    );
  }
}

class ListaDiscos extends StatelessWidget {
  const ListaDiscos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8,
      ),
      //Se obtiene la propiedad count del Provider para determinar el número de items
      itemCount: context.watch<DiscoProvider>().count,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  //Se obtiene la ruta de la imagen del item
                  'img/${context.watch<DiscoProvider>().catalogo[index].rutaImagen}',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //Se obtiene el nombre del álbum
                          context.watch<DiscoProvider>().catalogo[index].nombre,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          //Se obtiene el artista del álbum
                          context
                              .watch<DiscoProvider>()
                              .catalogo[index]
                              .artista,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      //Se llama al método borrar del Provider
                      context.read<DiscoProvider>().borrarDelCatalogo(
                          //Se obtiene el objeto que el usuario seleccionó
                          Provider.of<DiscoProvider>(context, listen: false)
                              .catalogo[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
