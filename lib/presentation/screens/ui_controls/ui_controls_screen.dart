import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'iu_controls_screen';
  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast=false;
  bool wantsLunch=false;
  bool wantDinner=false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        //Agrupa todos los widgets dentro de la pestaña
        ExpansionTile(
          title: const Text('Forma de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar en coche'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
          ],
        ),
      
      CheckboxListTile(
        title: const Text('¿Desayuno?'),
        subtitle:const Text('¿Desea alojamiento que ofrezca desayuno?'),
        value: wantsBreakfast, 
        onChanged: (value) => setState(() {
          wantsBreakfast = !wantsBreakfast;
        }),
        ),
        CheckboxListTile(
        title: const Text('¿Alumuerzo?'),
        subtitle:const Text('¿Desea alojamiento que ofrezca almuerzo?'),
        value: wantsLunch, 
        onChanged: (value) => setState(() {
          wantsLunch= !wantsLunch;
        }),
        ),
        CheckboxListTile(
        title: const Text('¿Cena?'),
        subtitle:const Text('¿Desea alojamiento que ofrezca Cena?'),
        value: wantDinner, 
        onChanged: (value) => setState(() {
          wantDinner = !wantDinner;
        }),
        )
      
      ],
    );
  }
}
