import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Crea tu paciente',
      'Esse et amet ad aliqua irure commodo in adipisicing cupidatat fugiat non sit ex enim. Sit duis do laborum sunt ad ad eu aute ex nisi deserunt et duis. Non sit non commodo fugiat elit deserunt esse quis ut. Esse nisi ea ad ea quis labore Lorem velit voluptate ex ex. Proident occaecat ad proident Lorem ipsum laboris. Id proident aliquip nisi aute voluptate labore occaecat non ut culpa.',
      'assets/images/1.png'),
  SlideInfo(
      'Sube tus fotos con sus etiquetas',
      'Elit nostrud quis aliquip officia aute qui consectetur dolore consequat. Ex quis deserunt mollit quis excepteur ipsum nostrud adipisicing ad mollit laborum sunt. Fugiat amet in laborum culpa veniam proident. Amet non pariatur reprehenderit eu aliquip duis ullamco excepteur non.',
      'assets/images/2.png'),
  SlideInfo(
      'Edita, compara y mucho más',
      'Esse incididunt exercitation aliqua sit deserunt sit. Aute et qui consectetur mollit esse esse ut non sunt anim elit consectetur. Adipisicing magna nisi voluptate cillum. Anim minim esse enim sunt anim fugiat do quis duis dolore.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached=false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page??0;
      if(!endReached && page>=(slides.length-1.5)){
        setState(() {
          endReached=true;
        });
      }
      //print('${pageViewController.page}');
    });
  }

//!Siempre que usemos un listener o un controlador es casi obligatorio poner el dispose, puesto que forma parte del ciclo de vida de StatefulWidget
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))),
         endReached? Positioned(
            bottom: 30,
            right: 30,
              child: FadeInRight(
                from:15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                          child: const Text('Comenzar'),
                        ),
              )):const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
