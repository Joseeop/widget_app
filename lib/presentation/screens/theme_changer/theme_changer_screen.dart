import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {
  static const name='theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final isDarkmode= ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Them Changer'),
        actions: [
           IconButton(
          
         icon: Icon(isDarkmode? Icons.dark_mode_outlined
        :Icons.light_mode_outlined),
        onPressed: (){
          //!Dentro de un método siempre se usa el READ.
          ref.read(isDarkModeProvider.notifier).update((state) => !state);
          
        },
        ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch( colorListProvier );
    final int selectedColor = ref.watch( selectedColorProvider );
    
    // final int selectedColor = ref.watch( selectedColorProvider );
    

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style:  TextStyle( color: color )),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read( selectedColorProvider.notifier )
              .state=index;
          },
        );
      },
    );
  }
}
