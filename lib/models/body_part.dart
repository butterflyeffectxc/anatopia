class SubBodyPart {
  final String nameEnglish;
  final String nameIndonesia;
  final String image;
  final String audio;
  final String description;

  SubBodyPart({
    required this.nameEnglish,
    required this.nameIndonesia,
    required this.image,
    required this.audio,
    required this.description,
  });
}

class BodyPart {
  final String nameEnglish;
  final String image;
  final String introImage;
  final List<SubBodyPart> details;

  BodyPart({
    required this.nameEnglish,
    required this.image,
    required this.introImage,
    required this.details,
  });
}