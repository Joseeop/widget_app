import 'package:animate_do/animate_do.dart';
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
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    
    scrollController.addListener(() { 

      if((scrollController.position.maxScrollExtent + 500)>=scrollController.position.maxScrollExtent){
        //Cargar siguente página
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    isMounted=false;
    super.dispose();
  }

  Future loadNextPage() async{

    if(isLoading)return;
    isLoading=true;

    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading=false;
    if(!isMounted) return;

    setState(() {
      
        moveScrollToBottom();

    });
  }

  Future<void> onRefresh() async{
    isLoading=true;
    setState(() {
      
    });
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
    isLoading=false;
    final lastId=imagesIds.last;

    imagesIds.clear();

    imagesIds.add(lastId+1);

    addFiveImages();

  setState(() {
    
  });
    
  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels+150 <= scrollController.position.maxScrollExtent)return;

    scrollController.animateTo(
      scrollController.position.pixels+120, 
      duration: const Duration(milliseconds:300 ), 
      curve: Curves.fastOutSlowIn);
  }

  void addFiveImages(){
    final lastId=imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId+e)
    );
  }
  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      
      //! Para remover padding, en este caso el superior.
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 3,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context,index){
              return  FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
                );
            }
            ),
        ),
      ),

        floatingActionButton: FloatingActionButton(
          
          onPressed: () => context.pop(),
          
          child: isLoading 
          ? SpinPerfect(
            infinite: true,
            child: 
             const Icon(Icons.refresh_rounded)
            ):FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        
    ));
  }
}