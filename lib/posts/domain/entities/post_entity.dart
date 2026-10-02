class PostEntity {
  final int id;
  final String title;
  final String body;
  PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });
  factory PostEntity.fr(Map<String,dynamic> json){
    return PostEntity(id: json['id'], title: json['title'], body: json['body']);
  }
  
}
