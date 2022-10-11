import 'package:travel_app/models/activity.dart';

class Tour {
  final int id;
  final String title;
  final int creator_id;
  final String creator;
  final String? category;
  final String image;
  final String destination;
  final String content;
  final List<Activity>? tour_activity;

  Tour(
      {required this.id,
      required this.title,
      required this.creator_id,
      required this.creator,
      this.category,
      required this.image,
      required this.destination,
      required this.content,
      this.tour_activity
      });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return _$TourFromJson(json);
  }
  Map<String, dynamic> toJson() => _$TourToJson(this);
}

// part of 'activity.dart';

// import 'package:travel_app/models/activity_model.dart';

Tour _$TourFromJson(Map<String, dynamic> json) => Tour(
      id: json['id'] as int,
      title: json['title'] as String,
      creator_id: json['creator_id'] as int,
      creator: json['creator'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      destination: json['star'] as String,
      content: json['avgCost'] as String,
      tour_activity: (json['tour_activity'] as List<dynamic>)
      .map((e) => Activity.fromJson(e as Map<String, dynamic>))
      .toList(),
    );

Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creator_id': instance.creator_id,
      'creator': instance.creator,
      'category': instance.category,
      'image': instance.image,

      'destination': instance.destination,
      'content': instance.content,
      'tour_activity': instance.tour_activity,
      
    };
