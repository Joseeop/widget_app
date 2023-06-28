import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';



class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';


  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch( counterProvider );
   final bool isDarkmode = ref.watch( isDarkModeProvider ); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      actions: [
        IconButton(
          
         icon: Icon(isDarkmode? Icons.dark_mode_outlined
        :Icons.light_mode_outlined),
        onPressed: (){
          //!Dentro de un método siempre se usa el READ.
          ref.read(isDarkModeProvider.notifier)
          .update((state) => !state);
        },
        ),
      ],
      ),

      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: (){
          // ref.read(counterProvider.notifier)
          //   .update((state) => state + 1);
          ref.read( counterProvider.notifier ).state++;

        },
      ),
      
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     final ValueNotifier<int> valor = ValueNotifier<int>(0);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter Screen'),
//       ),
//       body: Center(
        
//         child: ValueListenableBuilder<int>(
//           valueListenable: valor,
//           builder: (context, value, child) {
//             return Text(
//               'Valor: $value',
//               style: Theme.of(context).textTheme.titleLarge,
              
//         );
//           },
//         ),
//         ),
        
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.plus_one_outlined),
//         onPressed: () {
//           valor.value+=1;
//         },
//     )
//     );
//   }