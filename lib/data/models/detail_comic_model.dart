import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';

class DetailComicModel extends Equatable {
  const DetailComicModel({
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.synopsis,
    this.chapters,
  });

  final String title;
  final String thumbnail;
  final List<String> genre;
  final String synopsis;
  final List<ChapterModel>? chapters;

  factory DetailComicModel.fromJson(Map<String, dynamic> json) =>
      DetailComicModel(
        title: json["title"],
        thumbnail: json["thumbnail"],
        genre: List<String>.from(json["genre"]!.map((x) => x)),
        synopsis: json["synopsis"],
        chapters: List<ChapterModel>.from(
            json["chapters"]!.map((x) => ChapterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail": thumbnail,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "synopsis": synopsis,
        "chapters": List<dynamic>.from(chapters!.map((x) => x.toJson())),
      };

  DetailComic toEntity() {
    return DetailComic(
        title: title,
        thumbnail: thumbnail,
        genre: genre,
        synopsis: synopsis,
        chapters: chapters!
            .map(
              (chapter) => Chapters(
                chapter: chapter.chapter,
                param: chapter.param,
                release: chapter.release,
                detailUrl: chapter.detailUrl,
              ),
            )
            .toList());
  }

  @override
  List<Object?> get props => [
        title,
        thumbnail,
        genre,
        synopsis,
        chapters,
      ];
}

class ChapterModel {
  ChapterModel({
    required this.chapter,
    required this.param,
    required this.release,
    required this.detailUrl,
  });

  final String chapter;
  final String param;
  final String release;
  final String detailUrl;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        chapter: json["chapter"],
        param: json["param"],
        release: json["release"],
        detailUrl: json["detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "param": param,
        "release": release,
        "detail_url": detailUrl,
      };

  Chapters toEntity() {
    return Chapters(
      chapter: chapter,
      param: param,
      release: release,
      detailUrl: detailUrl,
    );
  }

  @override
  List<Object?> get props => [
        chapter,
        param,
        release,
        detailUrl,
      ];
}
