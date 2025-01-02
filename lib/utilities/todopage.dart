import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool TaskCompleted;
  final Function(bool?)? onChanged;

  Todotile({
    super.key,
    required this.taskName,
    required this.TaskCompleted,
    required this.onChanged,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.yellow,
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
    );
  }
}