class task{
   var id;
   final String time;
  final String title;
  final String description;

  task({
        this.id,
        required this.time,
    required this.title,
    required this.description
  });
  
  factory task.fromMap(Map<String,dynamic>json)=>new task(
    id: json['id'],
time:json["time"],
    title:json["title"],
    description:json["description"]
  );
  Map<String,dynamic> toMap(){
    return {
      "time":time,
      "id":id,
      "title":title,
      "description":description

    };
  }
}