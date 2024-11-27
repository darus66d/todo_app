import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<todo> todos=[];
  final titleTEController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ToDo App")),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
        return ListTile(
          title: Text(todos[index].title),
          trailing: IconButton(onPressed: (){

            todos.removeAt(index);
            setState(() {

            });

          }, icon:Icon(Icons.delete)),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                 children: [
                   TextField(
                     controller: titleTEController,
                   ),
                   ElevatedButton(onPressed: (){
                     todos.add(todo(titleTEController.text, false));
                     setState(() {

                     });
                   }, child: Text("Add")),
                 ],
              ),
            ),



          );
        });
      },child: Icon(Icons.add),),
    );
  }
}
class todo {
  String title;
  bool isdone;

  todo(this.title, this.isdone);
}
