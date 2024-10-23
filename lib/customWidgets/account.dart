
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customModels/post_model.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

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
    return  Padding(
      padding: const  EdgeInsets.all(5),
      child:  Column( children: [
          const  ListTile(  leading: CircleAvatar( radius: 50,),  title: Text('Jhon Stravolta'),),
          const Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ 
            Text( 'Post',  style: TextStyle(fontWeight: FontWeight.bold) ),
           Text('Follower',  style: TextStyle(fontWeight: FontWeight.bold) ),
           Text('Seguiti',  style: TextStyle(fontWeight: FontWeight.bold) ),],),
           const Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text('5'),
              Text('231'),
              Text('500'),
             ],
           ),
           Flexible(child:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: posts.length,
           itemBuilder: (context, index) => GridTile(child: Container( height: 300, width: 200, decoration: BoxDecoration( image: DecorationImage(image: NetworkImage(posts[index].image)) ),)),
           ) )
           

      ],
      ),


    );
  }
}