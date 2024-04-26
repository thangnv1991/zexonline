class StoryRequest {
  String? sort;
  String? type;
  String? genres;
  String? search;
  int page;
  int limit;
  bool isAdult;
  String status;

  StoryRequest(
      {this.sort,
      this.type,
      this.genres,
      this.search,
      this.page = 1,
      this.limit = 10,
      this.isAdult = false,
      this.status = "publish"});

  factory StoryRequest.fromJson(Map<String, dynamic> json) {
    return StoryRequest(
      sort: json['sort'] ?? "",
      type: json['type'] ?? "",
      genres: json['genres'] ?? "",
      search: json['search'] ?? "",
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      isAdult: json['is_adult'] ?? false,
      status: json['status'] ?? 'dropped',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sort': sort,
      'type': type,
      'genres': genres,
      'search': search,
      'page': page,
      'limit': limit,
      'is_adult': isAdult,
      'status': status,
    };
  }
}
