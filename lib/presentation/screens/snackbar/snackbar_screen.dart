import 'package:flutter/material.dart';


class SnackbarScreen extends StatelessWidget {

  static const name ='snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context){

    //Limpiamos los snackbars antiguos para que parezca que se están regenerando y no se queden esperando.
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );


    ScaffoldMessenger.of(context).showSnackBar(snackback);

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
         label: const Text('Mostrar Snackbar'),
         icon: const Icon(Icons.remove_red_eye_outlined),
         ),
    );
  }
}