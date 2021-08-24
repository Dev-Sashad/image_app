
class ImageModel {
  List<Data> data;

  ImageModel({this.data});

  ImageModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List)
      this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Data {
  int id;
  String imageUrl;

  Data({this.id, this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["image_url"] is String)
      this.imageUrl = json["image_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["image_url"] = this.imageUrl;
    return data;
  }
}