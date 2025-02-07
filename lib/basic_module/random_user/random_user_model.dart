// To parse this JSON data, do
//
//     final randomUserModel = randomUserModelFromJson(jsonString);

import 'dart:convert';

RandomUserModel randomUserModelFromJson(String str) => RandomUserModel.fromJson(json.decode(str));

String randomUserModelToJson(RandomUserModel data) => json.encode(data.toJson());

class RandomUserModel {
    List<Result> results;
    Info info;

    RandomUserModel({
        required this.results,
        required this.info,
    });

    factory RandomUserModel.fromJson(Map<String, dynamic> json) => RandomUserModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
    };
}

class Info {
    String seed;
    int results;
    int page;
    String version;

    Info({
        required this.seed,
        required this.results,
        required this.page,
        required this.version,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class Result {
    String gender;
    Name name;
    Location location;
    String email;
    Login login;
    Dob dob;
    Dob registered;
    String phone;
    String cell;
    Id id;
    Picture picture;
    String nat;

    Result({
        required this.gender,
        required this.name,
        required this.location,
        required this.email,
        required this.login,
        required this.dob,
        required this.registered,
        required this.phone,
        required this.cell,
        required this.id,
        required this.picture,
        required this.nat,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
    );

    Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "registered": registered.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id.toJson(),
        "picture": picture.toJson(),
        "nat": nat,
    };
}

class Dob {
    String date;
    int age;

    Dob({
        required this.date,
        required this.age,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "age": age,
    };
}

class Id {
    String name;
    String? value;

    Id({
        required this.name,
        required this.value,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        // value: json["value"] ?? "no value",
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class Location {
    Street street;
    String city;
    String state;
    String country;
    String postcode;
    Coordinates coordinates;
    Timezone timezone;

    Location({
        required this.street,
        required this.city,
        required this.state,
        required this.country,
        required this.postcode,
        required this.coordinates,
        required this.timezone,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"].toString(),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
    };
}

class Coordinates {
    String latitude;
    String longitude;

    Coordinates({
        required this.latitude,
        required this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Street {
    int number;
    String name;

    Street({
        required this.number,
        required this.name,
    });

    factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
    };
}

class Timezone {
    String offset;
    String description;

    Timezone({
        required this.offset,
        required this.description,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
    };
}

class Login {
    String uuid;
    String username;
    String password;
    String salt;
    String md5;
    String sha1;
    String sha256;

    Login({
        required this.uuid,
        required this.username,
        required this.password,
        required this.salt,
        required this.md5,
        required this.sha1,
        required this.sha256,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
    };
}

class Name {
    String title;
    String first;
    String last;

    Name({
        required this.title,
        required this.first,
        required this.last,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    String large;
    String medium;
    String thumbnail;

    Picture({
        required this.large,
        required this.medium,
        required this.thumbnail,
    });

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
