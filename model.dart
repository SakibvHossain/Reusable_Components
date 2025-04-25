// profile_model.dart

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));
String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  final bool success;
  final String message;
  final Result result;

  ProfileResponse({
    required this.success,
    required this.message,
    required this.result,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    success: json["success"] ?? false,
    message: json["message"] ?? '',
    result: Result.fromJson(json["result"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  final String id;
  final String username;
  final String? avatar;
  final String? coverPhoto;
  final String? bio;
  final List<dynamic> userGenre;
  final Count count;
  final List<Record> record;

  Result({
    required this.id,
    required this.username,
    this.avatar,
    this.coverPhoto,
    this.bio,
    required this.userGenre,
    required this.count,
    required this.record,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] ?? '',
    username: json["username"] ?? '',
    avatar: json["avatar"],
    coverPhoto: json["coverPhoto"],
    bio: json["bio"],
    userGenre: List<dynamic>.from(json["userGenre"] ?? []),
    count: Count.fromJson(json["_count"] ?? {}),
    record: List<Record>.from((json["record"] ?? []).map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "avatar": avatar,
    "coverPhoto": coverPhoto,
    "bio": bio,
    "userGenre": List<dynamic>.from(userGenre),
    "_count": count.toJson(),
    "record": List<dynamic>.from(record.map((x) => x.toJson())),
  };

  List<ActiveRead> get allActiveReads =>
      record.where((r) => r.activeRead != null).map((r) => r.activeRead!).toList();

  List<ActiveRead> get allLastReads =>
      record.where((r) => r.lastRead != null).map((r) => r.lastRead!).toList();

  List<ActiveRead> get allLastWatched =>
      record.where((r) => r.lastWatched != null).map((r) => r.lastWatched!).toList();
}

class Count {
  final int followers;
  final int following;
  final int groups;
  final int clubMember;

  Count({
    required this.followers,
    required this.following,
    required this.groups,
    required this.clubMember,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    followers: json["followers"] ?? 0,
    following: json["following"] ?? 0,
    groups: json["groups"] ?? 0,
    clubMember: json["clubMember"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "followers": followers,
    "following": following,
    "groups": groups,
    "clubMember": clubMember,
  };
}

class Record {
  final ActiveRead? activeRead;
  final ActiveRead? lastRead;
  final ActiveRead? lastWatched;

  Record({
    this.activeRead,
    this.lastRead,
    this.lastWatched,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    activeRead: json["activeRead"] != null ? ActiveRead.fromJson(json["activeRead"]) : null,
    lastRead: json["lastRead"] != null ? ActiveRead.fromJson(json["lastRead"]) : null,
    lastWatched: json["lastWatched"] != null ? ActiveRead.fromJson(json["lastWatched"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "activeRead": activeRead?.toJson(),
    "lastRead": lastRead?.toJson(),
    "lastWatched": lastWatched?.toJson(),
  };
}

class ActiveRead {
  final String id;
  final String clubId;
  final String clubLebel;
  final String title;
  final String poster;
  final String? writer;
  final dynamic totalSeasons;
  final dynamic totalEpisodes;
  final dynamic length;
  final int rating;
  final dynamic publishDate;
  final dynamic bookNo;
  final String imdbId;
  final String clubMediumType;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final int timeLine;
  final String preference;
  final int age;
  final int memberSize;
  final List<DateTime> talkPoint;
  final String adminId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ActiveRead({
    required this.id,
    required this.clubId,
    required this.clubLebel,
    required this.title,
    required this.poster,
    this.writer,
    this.totalSeasons,
    this.totalEpisodes,
    this.length,
    required this.rating,
    this.publishDate,
    this.bookNo,
    required this.imdbId,
    required this.clubMediumType,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.timeLine,
    required this.preference,
    required this.age,
    required this.memberSize,
    required this.talkPoint,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActiveRead.fromJson(Map<String, dynamic> json) => ActiveRead(
    id: json["id"] ?? '',
    clubId: json["clubId"] ?? '',
    clubLebel: json["clubLebel"] ?? '',
    title: json["title"] ?? '',
    poster: json["poster"] ?? '',
    writer: json["writer"],
    totalSeasons: json["totalSeasons"],
    totalEpisodes: json["totalEpisodes"],
    length: json["length"],
    rating: json["rating"] ?? 0,
    publishDate: json["publishDate"],
    bookNo: json["book_No"],
    imdbId: json["imdbID"] ?? '',
    clubMediumType: json["clubMediumType"] ?? '',
    type: json["type"] ?? '',
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    timeLine: json["timeLine"] ?? 0,
    preference: json["preference"] ?? '',
    age: json["age"] ?? 0,
    memberSize: json["memberSize"] ?? 0,
    talkPoint: List<DateTime>.from((json["talkPoint"] ?? []).map((x) => DateTime.parse(x))),
    adminId: json["adminId"] ?? '',
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "clubId": clubId,
    "clubLebel": clubLebel,
    "title": title,
    "poster": poster,
    "writer": writer,
    "totalSeasons": totalSeasons,
    "totalEpisodes": totalEpisodes,
    "length": length,
    "rating": rating,
    "publishDate": publishDate,
    "book_No": bookNo,
    "imdbID": imdbId,
    "clubMediumType": clubMediumType,
    "type": type,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "timeLine": timeLine,
    "preference": preference,
    "age": age,
    "memberSize": memberSize,
    "talkPoint": List<dynamic>.from(talkPoint.map((x) => x.toIso8601String())),
    "adminId": adminId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
