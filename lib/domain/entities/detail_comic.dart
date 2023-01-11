import 'package:equatable/equatable.dart';

class DetailComic extends Equatable{
    const DetailComic({
        required this.title,
        required this.thumbnail,
        required this.genre,
        required this.synopsis,
        required this.chapters,
    });

    final String title;
    final String thumbnail;
    final List<String> genre;
    final String synopsis;
    final List<Chapters> chapters;

    @override
    List<Object> get props => [
        title,
        thumbnail,
        genre,
        synopsis,
        chapters,
    ];
}

class Chapters extends Equatable{
    const Chapters({
        required this.chapter,
        required this.param,
        required this.release,
        required this.detailUrl,
    });

    final String chapter;
    final String param;
    final String release;
    final String detailUrl;

    @override
    List<Object> get props => [
        chapter,
        param,
        release,
        detailUrl,
    ];
}
