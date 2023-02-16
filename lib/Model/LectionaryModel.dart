// To parse this JSON data, do
//
//     final lectionary = lectionaryFromJson(jsonString);

import 'dart:convert';

Lectionary lectionaryFromJson(String str) => Lectionary.fromJson(json.decode(str));

String lectionaryToJson(Lectionary data) => json.encode(data.toJson());

class Lectionary {
    Lectionary({
        required this.response,
        required this.lastUpdatedDate,
        required this.lastupdate,
        required this.lectionary,
        required this.specialLectionary,
    });

    String response;
    String lastUpdatedDate;
    String lastupdate;
    List<LectionaryElement> lectionary;
    List<SpecialLectionary> specialLectionary;

    factory Lectionary.fromJson(Map<String, dynamic> json) => Lectionary(
        response: json["response"],
        lastUpdatedDate: json["last_updated_date"],
        lastupdate: json["lastupdate"],
        lectionary: List<LectionaryElement>.from(json["lectionary"].map((x) => LectionaryElement.fromJson(x))),
        specialLectionary: List<SpecialLectionary>.from(json["special_lectionary"].map((x) => SpecialLectionary.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "last_updated_date": lastUpdatedDate,
        "lastupdate": lastupdate,
        "lectionary": List<dynamic>.from(lectionary.map((x) => x.toJson())),
        "special_lectionary": List<dynamic>.from(specialLectionary.map((x) => x.toJson())),
    };
}

class LectionaryElement {
    LectionaryElement({
        required this.title,
        required this.reading,
    });

    String title;
    List<LectionaryReading> reading;

    factory LectionaryElement.fromJson(Map<String, dynamic> json) => LectionaryElement(
        title: json["title"],
        reading: List<LectionaryReading>.from(json["reading"].map((x) => LectionaryReading.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "reading": List<dynamic>.from(reading.map((x) => x.toJson())),
    };
}

class LectionaryReading {
    LectionaryReading({
        required this.date,
        required this.title,
        required this.lesson,
        required this.epistleGospel,
        required this.eveningReading,
    });

    String date;
    String title;
    List<String> lesson;
    List<String> epistleGospel;
    List<String> eveningReading;

    factory LectionaryReading.fromJson(Map<String, dynamic> json) => LectionaryReading(
        date: json["date"],
        title: json["title"],
        lesson: List<String>.from(json["lesson"].map((x) => x)),
        epistleGospel: List<String>.from(json["epistle_gospel"].map((x) => x)),
        eveningReading: List<String>.from(json["evening_reading"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "title": title,
        "lesson": List<dynamic>.from(lesson.map((x) => x)),
        "epistle_gospel": List<dynamic>.from(epistleGospel.map((x) => x)),
        "evening_reading": List<dynamic>.from(eveningReading.map((x) => x)),
    };
}

class SpecialLectionary {
    SpecialLectionary({
        required this.title,
        required this.reading,
    });

    String title;
    List<SpecialLectionaryReading> reading;

    factory SpecialLectionary.fromJson(Map<String, dynamic> json) => SpecialLectionary(
        title: json["title"],
        reading: List<SpecialLectionaryReading>.from(json["reading"].map((x) => SpecialLectionaryReading.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "reading": List<dynamic>.from(reading.map((x) => x.toJson())),
    };
}

class SpecialLectionaryReading {
    SpecialLectionaryReading({
        required this.word,
    });

    String word;

    factory SpecialLectionaryReading.fromJson(Map<String, dynamic> json) => SpecialLectionaryReading(
        word: json["word"],
    );

    Map<String, dynamic> toJson() => {
        "word": word,
    };
}
