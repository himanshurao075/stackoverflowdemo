import 'dart:convert';

// ArticalsDataModel articalsDataModelFromJson(String str) =>
//     ArticalsDataModel.fromJson(json.decode(str));

String articalsDataModelToJson(ArticalsDataModel data) =>
    json.encode(data.toJson());

class ArticalsDataModel {
  List<Item> items;
  bool hasMore;
  int quotaMax;
  int quotaRemaining;

  ArticalsDataModel({
    required this.items,
    required this.hasMore,
    required this.quotaMax,
    required this.quotaRemaining,
  });

  factory ArticalsDataModel.fromJson(Map<String, dynamic> json) =>
      ArticalsDataModel(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        hasMore: json["has_more"] ?? false,
        quotaMax: json["quota_max"] ?? 0,
        quotaRemaining: json["quota_remaining"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "has_more": hasMore,
        "quota_max": quotaMax,
        "quota_remaining": quotaRemaining,
      };
}

class Item {
  List<String> tags;
  Owner? owner;
  int viewCount;
  int score;
  int lastActivityDate;
  int creationDate;
  int lastEditDate;
  int articleId;
  String articleType;
  String link;
  String title;

  Item({
    required this.tags,
    required this.owner,
    required this.viewCount,
    required this.score,
    required this.lastActivityDate,
    required this.creationDate,
    required this.lastEditDate,
    required this.articleId,
    required this.articleType,
    required this.link,
    required this.title,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        viewCount: json["view_count"] ?? 0,
        score: json["score"] ?? 0,
        lastActivityDate: json["last_activity_date"] ?? 0,
        creationDate: json["creation_date"] ?? 0,
        lastEditDate: json["last_edit_date"] ?? 0,
        articleId: json["article_id"] ?? 0,
        articleType: json["article_type"] ?? '',
        link: json["link"] ?? '',
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "owner": owner!.toJson(),
        "view_count": viewCount,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "last_edit_date": lastEditDate,
        "article_id": articleId,
        "article_type": articleType,
        "link": link,
        "title": title,
      };
}

class Owner {
  int accountId;
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;

  Owner({
    required this.accountId,
    required this.reputation,
    required this.userId,
    required this.userType,
    required this.profileImage,
    required this.displayName,
    required this.link,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        accountId: json["account_id"] ?? 0,
        reputation: json["reputation"] ?? .0,
        userId: json["user_id"] ?? 0,
        userType: json["user_type"] ?? '',
        profileImage: json["profile_image"] ?? '',
        displayName: json["display_name"] ?? '',
        link: json["link"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "reputation": reputation,
        "user_id": userId,
        "user_type": userType,
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
      };
}
