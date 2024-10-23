import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customModels/user_model.dart';
import 'package:http/http.dart' as http;


class StoryPanel extends StatefulWidget {
   const StoryPanel({super.key});
   

   
  @override
  State<StoryPanel> createState() => _StoryPanelState();
}

class _StoryPanelState extends State<StoryPanel> {
 List<User> users = [];
    int currentIndex = 0;
    String currentModalImage = '';
    double storyProgress = 0;
@override
 void initState(){
    super.initState();
    fetchUsers();
 }

Future <void> fetchUsers() async{
  final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/users'));
  if (response.statusCode == 200) {
    
    
    List <dynamic> lista = jsonDecode(response.body) ;
    
    setState(() {
      users = lista.map((data)=>User.fromJson(data)).toList();
    });
    
    
  } else {
    
    throw Exception('Failed to load user');
  }
}

 @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 100, width: double.infinity, 
        child: ListView.builder( scrollDirection: Axis.horizontal, itemCount: users.length, itemBuilder: (context, index) =>( 
          TapRegion(child:Container(  padding: const EdgeInsets.all(5), child: CircleAvatar(  backgroundColor: Colors.red, radius: 30, 
        child: CircleAvatar( radius: 28, backgroundImage: NetworkImage(users[index].avatar),),) ,),
         onTapInside: (event)=>setState(() {
            currentModalImage = users[index].avatar;
            currentIndex = index;
            
            showDialog(context: context, builder: (index)=> Dialog.fullscreen( child: TapRegion( onTapInside: (event) {
               setState(() {
                  currentIndex++;
                  showDialog(context: context, builder: (index)=> Dialog.fullscreen( child: TapRegion( onTapInside: (event) {
               setState(() {
                  currentIndex++;
                  currentModalImage = users[currentIndex].avatar;
                 
               });
               
            }, child: Container( 
              decoration:
             BoxDecoration(
               image: DecorationImage(  fit: BoxFit.cover, image: NetworkImage(currentModalImage)), ), 
          
            )
            ) ,
            ) 
            );
               });
               
            }, child: Container( 
              decoration:
             BoxDecoration(
               image: DecorationImage(  fit: BoxFit.cover, image: NetworkImage(currentModalImage)), ), 
          
            )) ,
            ) 
            );
          })
            ,)
        ) )
        
      ,
      );
  }
}