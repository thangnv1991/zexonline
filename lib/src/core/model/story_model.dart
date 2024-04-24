import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';

class StoryModel {
  final String? id;
  final String? ownerId;
  final String? author;
  final String? title;
  final String? description;
  final String banner;
  final bool? active;
  final String? reviewedAt;
  final double? avgRating;
  final int? totalViews;
  final String? type;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final List<Genre>? genres;
  final Count? count;
  final bool isFavorite;

  StoryModel({
    this.id,
    this.ownerId,
    this.author,
    this.title,
    this.description,
    required this.banner,
    this.active,
    this.reviewedAt,
    this.avgRating,
    this.totalViews,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.genres,
    this.count,
    this.isFavorite = false,
  });

  StoryModel copyWith({
    String? id,
    String? ownerId,
    String? author,
    String? title,
    String? description,
    String? banner,
    bool? active,
    String? reviewedAt,
    double? avgRating,
    int? totalViews,
    String? type,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<Genre>? genres,
    Count? count,
    bool? isFavorite,
  }) {
    return StoryModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      banner: banner ?? this.banner,
      active: active ?? this.active,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      avgRating: avgRating ?? this.avgRating,
      totalViews: totalViews ?? this.totalViews,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      genres: genres ?? this.genres,
      count: count ?? this.count,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      ownerId: json['owner_id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      banner: json['banner'],
      active: json['active'],
      reviewedAt: json['reviewed_at'],
      avgRating: json['avg_rating']?.toDouble(),
      totalViews: json['total_views'],
      type: json['type'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      genres: json['genres'] == null
          ? null
          : List<Genre>.from(json['genres'].map((genre) => Genre.fromJson(genre))),
      count: Count.fromJson(json['_count'] ?? {}),
      isFavorite: (json['_count'] != null &&
              json['_count']['favorites'] != null &&
              (json['_count']['favorites'] is int))
          ? (json['_count']['favorites']) == 0
              ? false
              : true
          : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'author': author,
      'title': title,
      'description': description,
      'banner': banner,
      'active': active,
      'reviewed_at': reviewedAt,
      'avg_rating': avgRating,
      'total_views': totalViews,
      'type': type,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'genres': genres == null ? null : List<dynamic>.from(genres!.map((genre) => genre.toJson())),
      '_count': count?.toJson(),
      'is_favorite': isFavorite
    };
  }

  StoryType storyType() => getStoryType(type);
}

class Count {
  final int views;
  final int favorites;

  Count({
    this.views = 0,
    this.favorites = 0,
  });

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      views: json['views'] ?? 0,
      favorites: json['favorites'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'views': views,
      'favorites': favorites,
    };
  }
}
