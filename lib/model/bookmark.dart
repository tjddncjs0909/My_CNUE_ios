class Bookmark {
  String? userId;
  String? websiteName;
  String? websiteUrl;
  String? time;

  Bookmark({
    required this.userId,
    required this.websiteName,
    required this.websiteUrl,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'websiteName': websiteName,
      'websiteUrl': websiteUrl,
      'time' : time
    };
  }

  factory Bookmark.fromMap(Map<String, dynamic> map) {
    return Bookmark(
      userId: map['userId'],
      websiteName: map['websiteName'],
      websiteUrl: map['websiteUrl'],
      time: map['time'],
    );
  }
}