
import 'dart:convert';


List<MovieModel> movieModelFromJson(String str) => List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MovieModel {
    int id;
    String title;
    String year;
    String imdID;
    String type;
    String poster;
    
    MovieModel({
        required this.id,
        required this.title,
        required this.year,
        required this.imdID,
        required this.type,
        required this.poster,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        type: json["type"],
        imdID: json["description"],
        poster: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "type": type,
        "imdID": imdID,
        "poster": poster,
       
    };
}

class Rating {
    double rate;
    int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
