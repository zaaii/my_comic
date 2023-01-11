import 'package:equatable/equatable.dart';

class Comic extends Equatable {
    Comic({
        required this.title,
        required this.description,
        required this.latestChapter,
        required this.thumbnail,
        required this.param,
        required this.detailUrl,
    });

    String title;
    String description;
    String latestChapter;
    String thumbnail;
    String param;
    String detailUrl;

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
