import 'package:flutter/material.dart';
import 'package:todo/utilities/dialogbox.dart';
import 'package:todo/utilities/todopage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  final _controller = TextEditingController();

  //list of todo tasks
  List ToDoList = [
    ["task 1", false],
    ["task 2", true],
  ];

  //checkbox was tapped
  void CheckBoxChanged(bool? value, int index){
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }
  
  //save new task
  void saveNewTask(){
    setState(() {
      ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  //create new task
  void CreateNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return Dialogbox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],

      appBar: AppBar(
        title: Center(child: Text("TO DO")),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.add,
          size: 30,
          ),
      ),

      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index){
          return Todotile(
            taskName: ToDoList[index][0], 
            TaskCompleted: ToDoList[index][1], 
            onChanged: (value) => CheckBoxChanged(value, index),
          );
        },
      ),
    );
  }
}