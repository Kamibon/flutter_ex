 import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:file_picker/file_picker.dart'; 
import 'package:open_file/open_file.dart';


class AddPost extends StatefulWidget {
   const AddPost({super.key});
 
   @override
   State<AddPost> createState() => _AddPostState();
 }
 
 class _AddPostState extends State<AddPost> {

  late PlatformFile photo = PlatformFile(name: '', size: 0);

  void _pickFile() async { 
      
    // opens storage to pick files and the picked file or files 
    // are assigned into result and if no file is chosen result is null. 
    // you can also toggle "allowMultiple" true or false depending on your need 
    final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false); 
  
    // if no file is picked 
    if (result == null) return; 
  
    // we get the file from result object 
    final file = result.files.first; 
    
     setState(() {
      photo = file;
      
    }); 
    //_openFile(file); 
  } 
  
  void _openFile(PlatformFile file) { 
    OpenFile.open(file.bytes.toString()); 
  } 



   @override
   Widget build(BuildContext context) {
     return Padding(padding: const EdgeInsets.all(15), child: Column( children: [
      Container( margin: const EdgeInsets.only(top:5, bottom: 5), height: 400, width: 300,
      child: photo.name.isNotEmpty? Container(decoration:  BoxDecoration(  borderRadius: BorderRadius.circular(6), color: Colors.blueGrey,
        image:  DecorationImage( fit: BoxFit.cover, image:  FileImage(File(photo.name)))
      )
      ): Container(decoration:  BoxDecoration(  borderRadius: BorderRadius.circular(6), color: Colors.blueGrey)),
       ),
      ElevatedButton(onPressed: ()=>{_pickFile()}, child: const Text('Aggiungi foto')),
      const Text('Inserisci una descrizione'),
      const TextField( maxLength: 200)  ,
      ElevatedButton(onPressed: ()=>{}, child: const Text('Carica post')),
     ],
     ),
     );
   }
 }