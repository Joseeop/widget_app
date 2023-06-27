

import 'package:flutter/material.dart' ;

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
   required this.title, 
   required this.subTitle,
   required this.link, 
   required  this.icon});
}

const appMenuItems = <MenuItem>{

//Tenemos que definir estos elementos en el router
  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined),

    MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card),

    MenuItem(
    title: 'Progress Indicator', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded),

    MenuItem(
    title: 'Snackbars y diálogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline),

    MenuItem(
    title: 'Animated container', 
    subTitle: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded),

    MenuItem(
    title: 'UI controls + tiles', 
    subTitle: 'Ejemplo controles de Flutters', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined),

    MenuItem(
    title: 'Tutorial', 
    subTitle: 'Tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessibility_new_rounded),

        MenuItem(
    title: 'InfiniteScroll y Pull', 
    subTitle: 'Listas infinitas y pull to refres', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded),


};
