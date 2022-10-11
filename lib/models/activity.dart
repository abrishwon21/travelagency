// omport 'package: json_annotation/'
// part of 'activity.g.dart';

class Activity {
  final int id;
  final String title;
  final String actionsTobeDone;
  final String image;
  final String star;
  final String avgCost;

  Activity(
      {required this.id,
      required this.title,
      required this.actionsTobeDone,
      required this.image,
      required this.star,
      required this.avgCost});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return _$ActivityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}


// part of 'activity.dart';

// import 'package:travel_app/models/activity_model.dart';

Activity _$ActivityFromJson(Map<String, dynamic> json)=>Activity(
  id: json['id'] as int,
  title:json['title'] as String,
 actionsTobeDone:json['actionsTobeDone'] as String,
  image:json['image'] as String,
  star:json['star'] as String,
 avgCost:json['avgCost'] as String,
);

Map<String, dynamic> _$ActivityToJson(Activity instance)=><String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'actionsTobeDone': instance.actionsTobeDone,
  'image': instance.image,
  'star': instance.star,
  'avgCost': instance.avgCost,
};