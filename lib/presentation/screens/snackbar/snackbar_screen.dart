import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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

    void openDialog(BuildContext context){
      showDialog(
        //Obligamos al usuario a seleccionar una de las opciones disponibles.
        barrierDismissible: false,
        context: context, 
        // ignore: prefer_const_constructors
        builder: (context) =>AlertDialog(
          title: const Text('Estás seguro?'),
          content: const Text('Consequat consequat fugiat voluptate veniam esse. Est reprehenderit eu aliquip eu. Culpa occaecat cillum dolor dolore ut pariatur culpa fugiat exercitation aute.'),
          actions: [
            TextButton(onPressed: ()=> context.pop(), 
            child: const Text('Cancelar')),
            FilledButton(onPressed: ()=> context.pop(), 
            child: const Text('Aceptar')),
          ],
        ) , );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(onPressed: (){
            showAboutDialog(context: context,
            children: [
              const Text('Cillum incididunt veniam consectetur voluptate laboris do ex tempor id aliquip Lorem labore.Eiusmod non et quis reprehenderit. Ad esse excepteur culpa minim velit ex occaecat. Magna sit officia aliquip nisi ipsum sunt. Dolor excepteur nulla labore ex exercitation ullamco anim laboris aliquip qui commodo magna Lorem commodo.')
            ]);
          }, 
          child: const Text('Licencias usadas')
          ),
          FilledButton.tonal(onPressed: () => openDialog(context),
           
          child: const Text('Mostrar diálogo de pantalla')
          )
        ],
      ),
      ) ,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
         label: const Text('Mostrar Snackbar'),
         icon: const Icon(Icons.remove_red_eye_outlined),
         ),
    );
  }
}