import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/screens/add_task_screen/add_task.dart';
import 'package:todo/screens/home_screen/component/component.dart';

import 'database/database.dart';
import 'models/task_model.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(body: Column(children: [
       FutureBuilder(future:   DatabaseHelper.instance.search("aa"),builder: (BuildContext context,AsyncSnapshot<List<task>> snapshot){
return Expanded(
                                flex: 8,
                                child: Column(
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
                                ),
                              );

  })
    ]),);
  }
}