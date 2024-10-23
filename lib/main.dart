



import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/account.dart';
import 'package:flutter_application_1/customWidgets/add_post.dart';
import 'package:flutter_application_1/customWidgets/post_panel.dart';
import 'package:flutter_application_1/customWidgets/search_page.dart';
import 'package:flutter_application_1/customWidgets/story_panel.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeGram',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 44, 49, 53)),
        useMaterial3: true,
      ),
      home: const DefaultTabController(length: 4, child: MyHomePage(title: 'Fakegram'))
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
//int _counter = 0;
  String value = '';
  /* void _changeValue(String newValue){
      setState(() {
        value = newValue;
      });
    
    } */

  void _incrementCounter( ) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter+= plus;
    });

  }

  @override
  Widget build(BuildContext context) {

   
    List<int> num = [1,2,3,4];

     return Scaffold(
        resizeToAvoidBottomInset: true,
          appBar: AppBar(
         
        backgroundColor: Colors.black26, //Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
         bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.add)),
            Tab(icon: Icon(Icons.account_circle_outlined)),
          ],
        ),
        title: Text(widget.title),
      ),
      body: /* const  Column(  crossAxisAlignment: CrossAxisAlignment.center, children: [ 
        StoryPanel() ,
        PostPanel() 
        
      
      ],)  */
      const TabBarView(children: [ 
         Column(  crossAxisAlignment: CrossAxisAlignment.center, children: [ 
        StoryPanel() ,
        PostPanel() 
        
      
      ],
      ), 
      SearchPage(),
      AddPost(),
      Account(),
      
      ])
      
     ,
      
      drawer: Drawer(backgroundColor: const Color.fromARGB(111, 219, 230, 211),  width: 120, 
      child: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, 
      children: [for(var i in num) Container( margin: const EdgeInsets.all(5), child: Text('imp$i'),)]),) ,

      floatingActionButton: FloatingActionButton(
        hoverColor: const Color((0xFFFF9000)),
        onPressed:()=> _incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}










/* Stack(
        
        children: [Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Scrollbar( controller: ScrollController() ,thumbVisibility: true, scrollbarOrientation: ScrollbarOrientation.bottom ,child:
            const SingleChildScrollView( padding: EdgeInsets.all(10), scrollDirection: Axis.horizontal, child:Expanded(child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround , children: [
                CircleAvatar(  backgroundColor: Colors.grey,),
              CircleAvatar( backgroundColor: Colors.grey,), 
              CircleAvatar( backgroundColor: Colors.grey,)]) ,),
              
             ) )
               ,
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter e la tua frase è $value',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed:()=> _incrementCounter(5), child: const Icon(Icons.add_task_rounded)),
            TextField(decoration:  const InputDecoration(icon: Icon(Icons.draw_rounded)), onChanged: (value)=>
              _changeValue(value)

            ,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
             
               children: [ 
                IconButton.filled(onPressed: ()=>_incrementCounter(3 ), icon: const Icon(Icons.heart_broken)),
                IconButton.filled(onPressed: ()=>_incrementCounter(3 ), icon: const Icon(Icons.heat_pump_sharp)),
                IconButton.filled(onPressed: ()=>_incrementCounter(3 ), icon: const Icon(Icons.javascript_rounded)),

                ],
             ),
             /* Container(decoration:const BoxDecoration(color: Colors.amberAccent), height: 500, width: 400, 
             child: Column( children: [
              FilledButton(onPressed: () => _changeValue('Ciao'), child: const Text('Ciao'),),
              const Dialog(backgroundColor: Colors.blueAccent, elevation: 3, shadowColor: Colors.cyan, child: Text('Questo è un dialog'),)
            
              ],),) */
          ],
        ),
      ]) */