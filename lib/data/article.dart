class Article {
  final String headline;
  final String url;
  final List<String> comments;
  final String content;

  Article(this.headline, this.url, this.comments, this.content);


}

final articles = [
  new Article("Blender 2.80 has Arrived", "https://www.blender.org/", ["22dd1dsssff","333","dfdsadd"],
      "Blender is coming... Brace Yourselfs"),
  new Article("Google reveals fistful flwas in apple", "https://www.blender.org/", ["222s","333"],
      "Blender is coming... Brace Yourselfs"),
  new Article("Livestream glitch", "https://www.blender.org/", ["222","333"],
      "Blender is coming... Brace Yourselfs"),
  new Article("Ping Storues", "https://www.blender.org/", ["222","333"],
      "Blender is coming... Brace Yourselfs"),
  new Article("Build a Vue chat App", "https://www.blender.org/", ["222","333"],
      "Blender is coming... Brace Yourselfs"),
  new Article("Flutter is amazing AF", "https://www.blender.org/", ["222","333"],
      "Blender is coming... Brace Yourselfs")
];
