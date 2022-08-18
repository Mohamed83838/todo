import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:todo/constants/constant_widget.dart';
import 'package:todo/screens/add_task_screen/add_task.dart';
import 'package:todo/screens/home_screen/search_screen.dart';

import '../../constants/global_variable.dart';
import '../../database/database.dart';
import '../../models/task_model.dart';
import '../../notifications/notification_service.dart';
import 'component/component.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override

  String search_text="";
  bool is_searching=false;
  TextEditingController _search=TextEditingController();
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService().init();


    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
    setState(() {});
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    
    _search.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => add_task()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenH(context) / 20),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async{ 
              setState(() {
                
              });
             },
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: ScreenH(context) / 10),
                  child: Row(
                    children: [
                      Ctext(20, FontWeight.bold, "Hi Fraj"),
                      Expanded(child: SizedBox()),
                      Icon(Icons.person)
                    ],
                  ),
                ),
                Vspace(ScreenV(context) / 150),
                text(15, Colors.redAccent, FontWeight.normal, "10 task pending",
                    false),
                Vspace(ScreenH(context) / 15),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: ScreenH(context) / 2 * 1.45,
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness==Brightness.dark? Colors.black12.withOpacity(0.2) :Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: TextField(
                          controller: _search,
                          onChanged: (data){
                            print(data);
                            print(DatabaseHelper.instance.search(search_text));
                            print(search_text);
                              
                                setState(() {
                                    search_text=data;
                                    is_searching=true;
                                });
                          },
                          onSubmitted: (data){
setState(() {
  is_searching=false;
});
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            alignLabelWithHint: false,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Search",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(Icons.settings))
                  ],
                ),

Vspace(ScreenH(context) / 15),
                    Visibility(
                      visible: !is_searching,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Ctext(20, FontWeight.bold, "Categories"),
                          Vspace(ScreenH(context) / 20),
                          Container(
                            height: 200,
                            child: ListView(
                            scrollDirection: Axis.horizontal,
                              children: [
                                category(context),
                                category(context),
                                category(context)
                              ],
                            ),
                          ),
                          Vspace(ScreenH(context) / 15),
                          Row(
                            children: [
                              Ctext(20, FontWeight.bold, "Ongoing Task"),
                              Expanded(child: SizedBox()),
                              text(15, Colors.redAccent, FontWeight.normal, "see all",
                                  false),
                            ],
                          ),
                          Vspace(ScreenH(context) / 15),
                        ],
                      ),
                    ),

                    !is_searching?                   FutureBuilder(
                        future: DatabaseHelper.instance.gettasks(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<task>> snapshot) {
                          if (!snapshot.hasData) {
                            return Column(
                              children: [
                                waiting(context),
                                waiting(context),
                                waiting(context),
                                waiting(context),
                                waiting(context),
                                waiting(context),
                              ],
                            );
                          } else {
                            return !(snapshot.data == null)
                                ? Column(
                                  children: snapshot.data!.map((task) {
                                    return GestureDetector(
                                    
                                        onLongPress: () async {
                                          await DatabaseHelper.instance
                                              .remove(task.id);
                                          setState(() {});
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
                                )
                                : Center(
                                    child: Text("no data found"),
                                  );
                          }
                        }):search_body(search_text)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
