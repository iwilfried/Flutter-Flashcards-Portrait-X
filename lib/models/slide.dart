import 'tags.dart';

class Slide {
  String firstSide;
  String secondSide;
  String learnMore;
  List<Tags> tags;

  Slide(
      {required this.firstSide,
      required this.secondSide,
      required this.learnMore,
      required this.tags});

  Map<String, dynamic> toJson() => {
        "firstSide": firstSide,
        "secondSide": secondSide,
        "learnMore": learnMore,
        "tags": tags.toString(),
      };

  Slide.fromJson(Map<String, dynamic> json)
      : firstSide = json["First Side"],
        secondSide = json['Second Side'],
        learnMore = json['Learn more'],
        tags = json['tags'] == null
            ? []
            : List<Tags>.from(json['tags'].map((e) => Tags.fromJson(e)));
}
