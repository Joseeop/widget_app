import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScroll extends StatefulWidget {

  static const name ='infinite_screen';
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  List<int> imagesIds=[1,2,3,4,5];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      //! Para remover padding, en este caso el superior.
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: imagesIds.length,
          itemBuilder: (context,index){
            return  FadeInImage(
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
          }
          ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        
    );
  }
}