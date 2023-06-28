
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);





//Listado de colores inmutables

final colorListProvier = Provider((ref) => colorList);

//Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

//Un objeto de tipo AppTheme(Custom)

//StateNorifierProvider me permite mantener un estado más complejo, que es administrado por el ThemeNotifier
//Podemos usar los métodos que queramos dentro de esa clase.
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  //Creamos la primera instacia de ThemeNotifier, que es la que inicializa el tema
  (ref) => ThemeNotifier()  
  );

//Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  //Creamos una instancia de nuestro AppTheme. Este es el STATE= new AppTheme();
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode(){
    state=state.copyWith(isDarkmode: !state.isDarkmode);

  }

  void changeColorIndex(int colorIndex){
     state=state.copyWith(selectedColor:colorIndex );
  }
  

}