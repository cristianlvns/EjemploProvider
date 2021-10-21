import 'package:app_provider/models/disco_model.dart';
import 'package:app_provider/providers/disco_provider.dart';
import 'package:app_provider/providers/selector_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NuevoDisco extends StatelessWidget {
  const NuevoDisco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String txtFieldNombre = '', txtFieldArtista = '';
    DiscoModel discoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Disco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                labelText: 'Nombre del Álbum',
              ),
              onChanged: (value) {
                txtFieldNombre = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                labelText: 'Artista',
              ),
              onChanged: (value) {
                txtFieldArtista = value;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    selectedTileColor: Colors.teal,
                    //Se busca el valor en el provider
                    selected: context
                        .watch<SelectorProvider>()
                        .seleccion['think-tank']!,
                    onTap: () {
                      //Se asigna la selección
                      context
                          .read<SelectorProvider>()
                          .cambiarSeleccion('think-tank', 'think-tank.jpg');
                    },
                    title: const Image(
                      image: AssetImage('img/think-tank.jpg'),
                      height: 80,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    selectedTileColor: Colors.teal,
                    //Se busca el valor en el provider
                    selected: context
                        .watch<SelectorProvider>()
                        .seleccion['parklive']!,
                    onTap: () {
                      //Se asigna la selección
                      context
                          .read<SelectorProvider>()
                          .cambiarSeleccion('parklive', 'parklive.jpg');
                    },
                    title: const Image(
                      image: AssetImage('img/parklive.jpg'),
                      height: 80,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    selectedTileColor: Colors.teal,
                    //Se busca el valor en el provider
                    selected:
                        context.watch<SelectorProvider>().seleccion['13']!,
                    onTap: () {
                      //Se asigna la selección
                      context
                          .read<SelectorProvider>()
                          .cambiarSeleccion('13', '13.jpg');
                    },
                    title: const Image(
                      image: AssetImage('img/13.jpg'),
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('GUARDAR DISCO'),
              onPressed: () {
                //Se le asignan los valores del objeto
                discoModel = DiscoModel(
                  //Se asigna un id superior al del último item
                  id: Provider.of<DiscoProvider>(context, listen: false)
                          .lastId +
                      1,
                  nombre: txtFieldNombre,
                  artista: txtFieldArtista,
                  //Se establece la ruta de la imagen seleccionada
                  rutaImagen:
                      Provider.of<SelectorProvider>(context, listen: false)
                          .rutaSeleccionada,
                );
                //Se llama al método agregar del Provider
                context.read<DiscoProvider>().agregarAlCatalogo(discoModel);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
