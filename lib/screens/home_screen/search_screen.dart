
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

import '../../database/database.dart';
import '../add_task_screen/add_task.dart';
import 'component/component.dart';

Widget search_body(String data){

  return FutureBuilder(future:   DatabaseHelper.instance.search(data),builder: (BuildContext context,AsyncSnapshot<List<task>> snapshot){
return Column(
  children: snapshot.data!.map((task) {
    return GestureDetector(
    
        onLongPress: () async {
          await DatabaseHelper.instance
              .remove(task.id);
       
        },
        onTap: ()async {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => add_task(
                      title: task.title,
                      description:
                          task.description,
                    )),
          );
        },
        child: task_c(context, task.title,task.time));
  }).toList(),
);

  });
}