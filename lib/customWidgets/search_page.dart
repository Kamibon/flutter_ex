import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customModels/post_model.dart';
import 'package:http/http.dart' as http;
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


   List<Post> posts = [];
   String searchValue = '';
   bool isModalOpen = false;
   String currentModalImage = '';


  void fetchPosts() async{
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
   
  if (response.statusCode == 200) {
    
    
    List <dynamic> lista = jsonDecode(response.body) ;
   
    setState(() {
      
      posts = lista.map((data)=>Post.fromJson(data)).toList();
      
    });
   
    
  } else {
    
   
    throw Exception('Failed to load posts');
  }
 }

@override
  void initState() {
    super.initState();
    fetchPosts();
    
  }

  @override
  Widget build(BuildContext context) {
    return  Column( children: [  Container(margin: const EdgeInsets.all(5), child:
     SearchBar ( onChanged: (value) => setState(() {
      searchValue = value;
    }), hintText: 'Cerca qui persone, luoghi, post... ',)
     ,), 
    searchValue.isEmpty?
    Flexible(child: GridView.builder( shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, ), itemCount: posts.length,
    itemBuilder: (BuildContext context, index)=>TapRegion( onTapInside: (event) => setState(() {
      isModalOpen = true;
       currentModalImage = posts[index].image;
       showDialog(context: context, builder: (index)=>Dialog(child: Container( height: 550, width: 450, decoration: BoxDecoration( image: 
    DecorationImage(fit: BoxFit.cover ,image: NetworkImage(currentModalImage))
    ),
    child: TextButton(onPressed:()=> Navigator.of(context).pop(), child: const Text('X'),),
    ),
    ));
     
    }), child:GridTile(
      child: Container( height: 200, width: 300, decoration: BoxDecoration(image: 
    DecorationImage(image: NetworkImage(posts[index].image)) 
     ),
    
     ),
    ) ,
    )
    ) 
    )
     : Flexible(child:  ListView.builder(itemCount: posts.where((item)=>item.title.contains(searchValue)).length, 
     itemBuilder: (context, index)=>ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(posts.where((item)=>item.title.contains(searchValue)).toList()[index].image),
      ),
      title: Text(posts.where((item)=>item.title.contains(searchValue)).toList()[index].title),)
      )
     ),
   /*  isModalOpen? Dialog.fullscreen(child: Container(decoration: BoxDecoration( image: 
    DecorationImage(image: NetworkImage(currentModalImage))
    ),
    ),
    ): const Text('') */
    
     
       ],
       
       );
  }
}