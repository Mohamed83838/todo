import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/constants/constant_widget.dart';
import 'package:todo/screens/home_screen/home_screen.dart';

import '../../constants/global_variable.dart';


class welcome_screen extends StatefulWidget {
  const welcome_screen({Key? key}) : super(key: key);

  @override
  State<welcome_screen> createState() => _welcome_screenState();
}


class _welcome_screenState extends State<welcome_screen> {
  @override
  void initState() {
    // TODO: implement initState
  iswelcome();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  iswelcome()async{
    final prefs = await SharedPreferences.getInstance();
if( prefs.getString('welcome')==null){

      final prefs = await SharedPreferences.getInstance();
    await prefs.setString('welcome', '1');
}else{

   Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => home_screen()),
                                              );
}





  }

  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: ScreenH(context)/12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top:ScreenH(context)/10),
                child: Row(
                  children: [
                    Icon(Icons.logo_dev),
                    Hspace(5),
                  Ctext(15, FontWeight.normal, "Taskoo")
                    
                  ],
                ),
              ),
              Vspace(ScreenH(context)/15),
              Ctext(30, FontWeight.bold,"Manage your"),
              Vspace(ScreenV(context)/150),
              Ctext(30, FontWeight.bold,"team & everything"),
              Vspace(ScreenV(context)/150),
              Row(
                children: [
                  Ctext(30, FontWeight.bold,"with"),
                  Hspace(5),
                  text(30, Colors.redAccent, FontWeight.bold, "taskoo",true),
                ],
              ),
              Vspace(ScreenV(context)/15),
               
               Image.asset("assets/images/team1.png",width: ScreenH(context)),
               Vspace(ScreenV(context)/50),
               Ctext(15, FontWeight.normal, "When you'are overwhelmed by the"),
               Ctext(15, FontWeight.normal, "omount of work you have on your"),
               Ctext(15, FontWeight.normal, "plate,stop and rethink."),
               Vspace(ScreenV(context)/15),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   FloatingActionButton(onPressed: (){},child: Icon(Icons.play_arrow),),
                 ],
               ),
                Vspace(ScreenV(context)/15),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(
                    onTap: (){
                     Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => home_screen()),
                                              );
                    },
                    child: button("start",ScreenH(context)/2*1.1)),
                 ],
               )
             

              
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}
