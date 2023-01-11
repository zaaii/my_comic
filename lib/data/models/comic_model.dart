import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/comic.dart';

class ComicModel extends Equatable {
  ComicModel({
    required this.title,
    required this.description,
    required this.latestChapter,
    required this.thumbnail,
    required this.param,
    required this.detailUrl
  });

    String title;
    String description;
    String latestChapter;
    String thumbnail;
    String param;
    String detailUrl;

    factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        title: json["title"],
        description: json["description"],
        latestChapter: json["latest_chapter"] ?? "",
        thumbnail: json["thumbnail"],
        param: json["param"],
        detailUrl: json["detail_url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "latest_chapter": latestChapter,
        "thumbnail": thumbnail,
        "param": param,
        "detail_url": detailUrl,
    };

    Comic toEntity() {
        return Comic(
            title: title,
            description: description,
            latestChapter: latestChapter,
            thumbnail: thumbnail,
            param: param,
            detailUrl: detailUrl,
        );
    }

    @override
    List<Object> get props => [
        title,
        description,
        latestChapter,
        thumbnail,
        param,
        detailUrl,
    ];
}