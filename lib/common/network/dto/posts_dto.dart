class PostDto {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
