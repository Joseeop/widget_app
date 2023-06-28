import 'package:flutter/material.dart';


const colorList= <Color>[
  Colors.blue,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.yellow,
  Colors.brown
];

class AppTheme {

  final int selectedColor;
  final bool isDarkmode;

  AppTheme( {
    this.isDarkmode=false,
    this.selectedColor=0
    }): assert ( selectedColor >= 0,'Selected color must be greater than 0'),
    assert ( selectedColor< colorList.length,'Selected color must be less or equal than ${colorList.length -1}') ;


    ThemeData getTheme() => ThemeData(
      appBarTheme:const AppBarTheme(
        centerTitle: false
      ),
      useMaterial3: true,
      brightness: isDarkmode? Brightness.dark 
      :Brightness.light,
      colorSchemeSeed: colorList[selectedColor] );

//Metodo qe sirve para copiar la instancia de la clase.
  AppTheme copyWith({
    int? selectedColor,
    bool?isDarkmode
  })=> AppTheme(
    selectedColor: selectedColor?? this.selectedColor,
    isDarkmode: isDarkmode??this.isDarkmode
  );

}