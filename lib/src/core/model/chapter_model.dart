import 'package:zexonline/src/core/model/story_model.dart';

class ChapterModel {
  final String id;
  final String? storyId;
  final String? title;
  final List<String>? content;
  final int? order;
  final String? scheduledAt;
  final String? createdAt;
  final String? updatedAt;
  final Count? count;
  final int totalOrder;
  final String? chapterPrevious;
  final String? chapterNext;

  ChapterModel({
    required this.id,
    this.storyId,
    this.title,
    this.content,
    this.order,
    this.scheduledAt,
    this.createdAt,
    this.updatedAt,
    this.count,
    this.totalOrder = 1,
    this.chapterPrevious,
    this.chapterNext,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      storyId: json['story_id'],
      title: json['title'],
      content: json['content'] == null ? [] : List<String>.from(json['content']),
      order: json['order'],
      scheduledAt: json['scheduled_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      count: json['_count'] == null ? null : Count.fromJson(json['_count']),
      totalOrder: json['order_count'] ?? 1,
      chapterPrevious: json['metadata'] != null && json['metadata'] != null
          ? json['metadata']['previous']
          : null,
      chapterNext:
          json['metadata'] != null && json['metadata'] != null ? json['metadata']['next'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'story_id': storyId,
      'title': title,
      'content': content,
      'order': order,
      'scheduled_at': scheduledAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      '_count': count?.toJson(),
      'order_count': totalOrder
    };
  }
}
