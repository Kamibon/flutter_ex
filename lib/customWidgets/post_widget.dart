// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customModels/post_model.dart';

class PostWidget extends StatefulWidget {
   
    Post post;
   PostWidget({super.key, required this.post});
    

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  bool liked = false;
  
  @override
 

  @override
  Widget build(BuildContext context) {
    return  Column( crossAxisAlignment: CrossAxisAlignment.start, children:[Container( height: 500, width: 700, 
            margin: const  EdgeInsets.all(18), 
            decoration: BoxDecoration(color: Colors.blue, 
            image: DecorationImage(fit:BoxFit.cover, image:  NetworkImage(widget.post.image))),  
           padding: const EdgeInsets.all(15),),
           Text('Piace a ${widget.post.price.floor()} persone'),
           SizedBox(child: Text(widget.post.description),),
           SizedBox( height: 50, child: Row(children: [ 
          
            IconButton( onPressed: ()=> setState(() {
              liked = !liked;
            }), icon: Icon( color: liked? Colors.red : Colors.black, Icons.heart_broken_outlined)),
            IconButton(onPressed: ()=> debugPrint(  ''), icon: const Icon(Icons.message_outlined)),
            IconButton(onPressed: ()=> debugPrint(  ''), icon: const Icon(Icons.send))
            ],),)
           ]
           );
  }
}