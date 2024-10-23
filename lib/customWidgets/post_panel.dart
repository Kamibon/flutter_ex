import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/customModels/post_model.dart';
import 'package:flutter_application_1/customWidgets/post_widget.dart';
import 'package:http/http.dart' as http;
class PostPanel extends StatefulWidget{
  const PostPanel({super.key});
  

    
 
@override
  State<PostPanel>createState()=>PostState();
  
}
class PostState extends State<PostPanel>{

 
  List<Post> posts = [];

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
    return 
        ( 
           SizedBox(height: 500, width: 800, child: ListView.builder( itemCount: posts.length, 
           itemBuilder: (context, index )=>
               PostWidget(post: posts[index])
            ,)
           ,));

        
      
      //NetworkImage(posts[index].images[0])
    
  }
}