import 'package:app_provider/providers/disco_provider.dart';
import 'package:app_provider/providers/selector_provider.dart';
import 'package:app_provider/screens/nuevo_disco.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_provider/screens/homepage.dart';

void main() {
  runApp(
    //MyApp está envuelto en un MultiPlovider
    MultiProvider(
      //Se colocan los providers
      providers: [
        ChangeNotifierProvider(
          //Se llama a la clase DiscoProvider
          create: (_) => DiscoProvider(),
        ),
        ChangeNotifierProvider(
          //Se llama a la clase SelectorProvider
          create: (_) => SelectorProvider(),
        ),
      ],
      //Aquí va el widget hijo
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/nuevodisco': (_) => const NuevoDisco(),
      },
    );
  }
}
