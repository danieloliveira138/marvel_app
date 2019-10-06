import 'package:marvel_app/models/item.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:marvel_app/models/urls.dart';

class Results {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;
  Item comics;
  Item series;
  Item stories;
  Item events;
  List<Urls> urls;

  Results(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
        json['comics'] != null ? new Item.fromJson(json['comics']) : null;
     series =
         json['series'] != null ? new Item.fromJson(json['series']) : null;
     stories =
         json['stories'] != null ? new Item.fromJson(json['stories']) : null;
     events =
         json['events'] != null ? new Item.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = new List<Urls>();
      json['urls'].forEach((v) {
        urls.add(new Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
     if (this.series != null) {
       data['series'] = this.series.toJson();
     }
     if (this.stories != null) {
       data['stories'] = this.stories.toJson();
     }
     if (this.events != null) {
       data['events'] = this.events.toJson();
     }
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    return data;
  }

}