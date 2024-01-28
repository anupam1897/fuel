class Post {
  final String profilePicture;
  final String username;
  final String postId;
  final String postImage;
  final String caption;
  final String views;
  final String likes;
  final String createdAt;

  Post({
    required this.profilePicture,
    required this.username,
    required this.postId,
    required this.postImage,
    required this.caption,
    required this.views,
    required this.likes,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      profilePicture: json['profilePicture'],
      username: json['username'],
      postId: json['postId'],
      postImage: json['postImage'],
      caption: json['caption'],
      views: json['views'],
      likes: json['likes'],
      createdAt: json['createdAt'],
    );
  }
}
