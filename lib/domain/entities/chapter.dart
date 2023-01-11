import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
    Chapter({
        required this.data,
    });

    List<String> data;

    @override
    List<Object> get props => [
        data,
    ];
}
