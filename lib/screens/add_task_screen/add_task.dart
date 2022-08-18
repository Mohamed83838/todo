
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/constants/constant_widget.dart';
import 'package:todo/database/database.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/notifications/notification_service.dart';
import 'package:todo/screens/home_screen/home_screen.dart';
import 'package:intl/intl.dart';

import '../../constants/global_variable.dart';

class add_task extends StatefulWidget {
 
  const add_task({Key? key,  this.title : "",  this.description :"", this.id :0}) : super(key: key);
final String title;
final String description;
final int id;

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  TextEditingController _title=TextEditingController();
  TextEditingController _description=TextEditingController();

  @override
  void dispose() {
    
    _title.dispose();
    _description.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _title.text=widget.title;
    _description.text=widget.description;
    // TODO: implement initState
    super.initState();
  }
  DateTime currentDate = DateTime.now();
   TimeOfDay selectedTime = TimeOfDay.now();
    TimeOfDay selectedTime1 = TimeOfDay.now();
      _selectTime(BuildContext context, bool start) async {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: start ? selectedTime :selectedTime1 ,
        initialEntryMode: TimePickerEntryMode.dial,
 
      );
      if(timeOfDay != null && timeOfDay != selectedTime && start==true)
        {
          setState(() {
            selectedTime = timeOfDay;
            
          });
        }else if(timeOfDay != null && timeOfDay != selectedTime && start==false){
 setState(() {
            selectedTime1 = timeOfDay;
            
          });
        }
  }



Future<void> _selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050));
  if (pickedDate != null && pickedDate != currentDate)
    setState(() {
      currentDate = pickedDate;
    });
}











  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: Container(
           margin: EdgeInsets.symmetric(horizontal: ScreenH(context) / 20),
          child: ListView(
           
            children: [
              Vspace(5),
      Row(children: [
        IconButton(onPressed: (){
        Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => home_screen()),
            );
      
        }, icon: Icon(Icons.arrow_back_ios)),
        Expanded(child: Center(child: Ctext(15, FontWeight.bold, "Todays Task"),)),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(""),
        )
      ],),
      Vspace(20),
      Ctext(20, FontWeight.bold, "Create"),
      Ctext(20, FontWeight.bold, "New Task"),
      Vspace(25),
      Ctext(15,  FontWeight.normal,"Task title"),
      TextFormField(
      
        controller:_title ,
        maxLines: 1,
        
        decoration: InputDecoration(
        
          hintText: "Title",
          
        ),
      ),
      Vspace(25),

         Ctext(20,  FontWeight.bold,"Description"),
         Vspace(15),
       TextFormField(
     textInputAction: TextInputAction.done,
        controller: _description,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "Description",
          
          
        ),
      ),
      Vspace(10),
      Row(children: [

         TextButton(onPressed: (){
          _selectDate(context);
         }, child: Text("Select date")),
         Expanded(child: SizedBox()),
         Text(currentDate.year.toString()+":"+currentDate.month.toString()+":"+currentDate.day.toString())

      ],),
      Vspace(10),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        InkWell(
          onTap: (){
            _selectTime(context,true);
          },
          child: Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Vspace(10),
                Text("Start",style: TextStyle(color: Colors.grey),),
                
                Center(child: Text(selectedTime.hour.toString()+":"+selectedTime.minute.toString()+selectedTime.period.name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
        
              ],
            ),
          ),
        ),
       
         InkWell(
          onTap: (){
            _selectTime(context,false);
          },
           child: Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)
            ),
             child: Column(
              children: [
                Vspace(10),
                Text("End",style: TextStyle(color: Colors.grey),),
                
                Center(child: Text(selectedTime1.hour.toString()+":"+selectedTime1.minute.toString()+selectedTime.period.name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
         
              ],
            ),
                 ),
         )
      ],),
      Vspace(30),

     
      Container(
        height: 20,
        child: ListView(
          scrollDirection: Axis.horizontal,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,),
              CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,),
              CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,),
              CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,),
              CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,)
        ],
        ),
      ),
      Vspace(100),


widget.title==""?
      InkWell(
        onTap: ()async{
          var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
var inputDate = inputFormat.parse('${currentDate.day}/${currentDate.month}/${currentDate.year} ${selectedTime.hour}:${selectedTime.minute}');
var inputDate1 = inputFormat.parse('${currentDate.day}/${currentDate.month}/${currentDate.year} ${selectedTime1.hour}:${selectedTime1.minute}');
          task new_task=new task(title: _title.text, description: _description.text,time: inputDate.toString());
          await DatabaseHelper.instance.add(new_task);


var time = tz.TZDateTime.from(
    inputDate,
    tz.local,
);
var time1 = tz.TZDateTime.from(
    inputDate1,
    tz.local,
);




          await NotificationService().sendTimeNotifications(widget.id,_title.text, _description.text, time);
          await NotificationService().sendTimeNotifications(widget.id+1000,_title.text, _description.text, time1);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => home_screen()),
            );
        },
        child:
        
         button("Create Task", double.infinity)):
         InkWell(
        onTap: ()async{
          var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
          var inputDate = inputFormat.parse('${currentDate.day}/${currentDate.month}/${currentDate.year} ${selectedTime.hour}:${selectedTime.minute}');
var inputDate1 = inputFormat.parse('${currentDate.day}/${currentDate.month}/${currentDate.year} ${selectedTime1.hour}:${selectedTime1.minute}');
          task new_task=new task(title: _title.text, description: _description.text,id: widget.id,time:inputDate.toString());
          await DatabaseHelper.instance.update(new_task);
          

var time = tz.TZDateTime.from(
    inputDate,
    tz.local,
);
var time1 = tz.TZDateTime.from(
    inputDate1,
    tz.local,
);




          await NotificationService().sendTimeNotifications(widget.id,_title.text, _description.text, time);
          await NotificationService().sendTimeNotifications(widget.id+1000,_title.text, _description.text, time1);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => home_screen()),
            );
        },
        child:
        
         button("Update Task", double.infinity))

          ]),
        ),
      ),
    );
  }


}








