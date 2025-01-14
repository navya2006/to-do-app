import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool TaskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  Todotile({
    super.key,
    required this.taskName,
    required this.TaskCompleted,
    required this.onChanged,
    required this.deleteTask,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteTask,
              label: "Delete",
              icon: Icons.delete,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //checkox
              Checkbox(
                value: TaskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                
              ),
        
              //TASK
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  decoration: TaskCompleted? TextDecoration.lineThrough: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}