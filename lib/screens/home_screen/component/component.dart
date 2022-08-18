import 'package:flutter/material.dart';
import 'package:todo/constants/constant_widget.dart';
import 'package:todo/constants/global_variable.dart';

Widget category( BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    height: 200,
    width: 150,
     decoration: BoxDecoration(
                        color:Theme.of(context).brightness==Brightness.dark? Colors.black12.withOpacity(0.2) :Colors.white,
                        borderRadius: BorderRadius.circular(15)),
    child: Column(children: [
      Vspace(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ctext(20, FontWeight.bold, "Mobile App"),
          

        ],

      ),
      Vspace(5),
     Container(
      margin: EdgeInsets.only(left: 24),
       child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
         children: [
           text(15, Colors.grey, FontWeight.normal, "10 Tasks", false),
         ],
       ),
     ),
     Expanded(child: Image.asset("assets/images/category.png"))
    ]),

  );
}

Widget task_c(BuildContext context, String title ,String time){
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    height: ScreenH(context)/2.5,
    width: double.infinity,
     decoration: BoxDecoration(
                        color: Theme.of(context).brightness==Brightness.dark? Colors.black12.withOpacity(0.2) :Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: ScreenV(context)/30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Vspace(15),
                            Row(
                              children: [
                                    Ctext(15, FontWeight.bold,title),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      width: 35,
                                      height: 20,
                                       decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("done",style:TextStyle(fontSize: 10) ,),),
                                    ),
                                
                              ],
                            ),
                             Vspace(15),
                              text(12, Colors.grey, FontWeight.normal, "Team members", false),
                             Vspace(5),
                              Row(
                                children: [
                                  Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                       
                                        children: [
                                        CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.j4uqoQqHX14hsF1y5Xs4BQHaLG?pid=ImgDet&rs=1"),radius: 10,),
                                         Hspace(5),
                                         CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.j4uqoQqHX14hsF1y5Xs4BQHaLG?pid=ImgDet&rs=1"),radius: 10,),
                                         Hspace(5),
                                          CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.j4uqoQqHX14hsF1y5Xs4BQHaLG?pid=ImgDet&rs=1"),radius: 10,)
                                      
                                      ],),
                                      Vspace(10),
                                      Row(children: [
                                        Icon(Icons.watch,color: Colors.red,),
                                        text(12, Colors.grey, FontWeight.normal,time, false),
                                      
                                      ],)
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Stack(
                                    children:[Container(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        
                                        backgroundColor: Colors.grey,
                                        color: Colors.yellow,
                                        value: 0.5,
                                        
                                      
                                      ),
                                    ),
                                    Positioned(
                                      left: 13.5,
                                      top: 18,
                                      child: Text("50%",style: TextStyle(color: Colors.grey),))
                                    ]
                                  )

                                ],
                              )
                          ]),
                        ),


  );
}
Widget waiting(BuildContext context){
  return Container(
     margin: EdgeInsets.only(bottom: 20),
    height: ScreenH(context)/2.5,
    width: double.infinity,
     decoration: BoxDecoration(
                        color:  Theme.of(context).brightness==Brightness.dark? Colors.black12.withOpacity(0.2) :Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                        child:Container(
                            margin: EdgeInsets.symmetric(horizontal: ScreenV(context)/30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Vspace(20),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey
                                ),
                              ),
                                 Vspace(20),
                                Container(
                                height: 20,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey
                                ),
                              ),
                               Vspace(20),
                                Container(
                                height: 20,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey
                                ),
                              )

                          ],),
                        )
                          

                          
  );
  
  
}