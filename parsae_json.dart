import 'dart:convert';
import 'package:http/http.dart' as http;
class Samplemodel {
  int? id;
  String? courseName;
  String? aboutCourse;
  String? coursePrice;

  Samplemodel({this.id, this.courseName, this.aboutCourse, this.coursePrice});

  Samplemodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    aboutCourse = json['about_course'];
    coursePrice = json['course_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['about_course'] = this.aboutCourse;
    data['course_price'] = this.coursePrice;
    return data;
  }
}

 

main () async{
  var url = "https://purnendu-tudu.github.io/json_test_data/sample_data.json";
  var res = await http.get(Uri.parse(url)); 
  List<dynamic> list = json.decode(res.body);
    
  print(list.length);
  
  for(int index = 0 ; index < list.length; index++){
    Samplemodel fact =  Samplemodel.fromJson(list[index]);
    print('CourseName: ${fact.courseName}');
    print('CoursePrice: ${fact.coursePrice}');
  }
  
}
