import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex=0;
  @override
  Widget build(BuildContext context) {


    //! Esto sirve para comprobar si nuestro dispositivo tiene Notch, y en caso de tenerlo de cuánto es.
    final hasNotch=MediaQuery.of(context).viewPadding.top>24;
    if(Platform.isAndroid){
      print('Android $hasNotch');
    }else{
      print('IOS $hasNotch');
    }
    
    return  NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected:(value){
        setState(() {
          navDrawerIndex=value;
        });

        final menuItem=appMenuItems[value];
        //.push crea un Stack y .go mueve la ruta, solo con .push podremos volver al stack anterior.
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();



      } ,
      children: [


        Padding(
          padding:  EdgeInsets.fromLTRB(28, hasNotch? 10 :20 , 16, 10),
          child: Text('MAIN')),

          ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon( item.icon ), 
            label: Text( item.title ),
          ),
          ),
        const  Padding(
            padding:  EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
            ),
        const  Padding(
            padding:  EdgeInsets.fromLTRB(28, 10 , 16, 10),
            child:  Text('More Options'),
            ),


            ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon( item.icon ), 
            label: Text( item.title ),
          ),)
        
          
      ]
      );
  }
}