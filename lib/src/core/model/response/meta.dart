class Meta {
  int total;
  int page;
  int limit;
  int lastPage;
  int? nextPage;
  int? prevPage;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.lastPage,
    this.nextPage,
    this.prevPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'page': page,
      'limit': limit,
      'last_page': lastPage,
      'next_page': nextPage,
      'prev_page': prevPage,
    };
  }
}
