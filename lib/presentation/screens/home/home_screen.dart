import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';
import 'package:widget_app/presentation/widgets/side_menu.dart';



class HomeScreen extends ConsumerWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    //Creamos esta key para poder acceder desde otras partes de la apliación a este scaffold
    final scaffoldKey=GlobalKey<ScaffoldState>();
    final isDarkmode= ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      //tiene la refeencia del estado actual del Scaffold.
      key:scaffoldKey,
      appBar: AppBar(
         title: const Text('Flutter + Material3'),
         actions: [
          IconButton(
          
         icon: Icon(isDarkmode? Icons.dark_mode_outlined
        :Icons.light_mode_outlined),
        onPressed: (){
          //!Dentro de un método siempre se usa el READ.
          ref.read(themeNotifierProvider.notifier).toggleDarkmode();
          
        },
        ),
         ],
      ),
      body:const _HomeView(),
      drawer:  SideMenu(scaffoldKey: scaffoldKey)
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final MenuItem menuItem = appMenuItems.elementAt(index);
      
      return _CustomListTile(menuItem: menuItem);
      
      
      });
  }
}


class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

 
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color:colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: colors.primary,),
      onTap: (){

        //Navigator.of(context).push(
          //MaterialPageRoute(builder: (context)=>const ButtosScreens())
        //);
       // Navigator.pushNamed(context, menuItem.link);

//GO ROUTER
       context.push(menuItem.link);

       //context.pushNamed(CardsScreen.name);
        
      },
    );
  }
}


