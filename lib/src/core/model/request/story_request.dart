class StoryRequest {
  String? sort;
  String? type;
  String? genres;
  String? search;
  int page;
  int limit;

  StoryRequest({
    this.sort,
    this.type,
    this.genres,
    this.search,
    this.page = 1,
    this.limit = 10,
  });

  factory StoryRequest.fromJson(Map<String, dynamic> json) {
    return StoryRequest(
      sort: json['sort'] ?? "",
      type: json['type'] ?? "",
      genres: json['genres'] ?? "",
      search: json['search'] ?? "",
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
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
    };
  }
}
