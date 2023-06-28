
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);





//Listado de colores inmutables

final colorListProvier = Provider((ref) => colorList);

//Un simple int
final selectedColorProvider = StateProvider((ref) => 0);