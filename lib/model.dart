

class MusicModel {
  List<Data>? data;

  MusicModel({this.data});

  MusicModel.fromJson(List<dynamic> json) {
    data = json.map((item) => Data.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}


class Data {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Data({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Data.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}

  