
import 'package:equatable/equatable.dart';

class HomeAddState extends Equatable {
  const HomeAddState({this.urlImages});
  final List<String> urlImages;

  HomeAddState copyWith(List<String> urlImages) {
    return HomeAddState(
      urlImages: urlImages ?? this.urlImages
    );
  }

  HomeAddState appendImages(List<String> urlImages) {
    List<String> images = List<String>.from(this.urlImages);
    images.addAll(urlImages);
    return HomeAddState(urlImages: images);
  }

  @override
  List<Object> get props => [urlImages];

}