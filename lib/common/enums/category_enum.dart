import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  general,
  business,
  sports,
  technology,
  entertainment,
  health,
  science;

  String get getImage {
    switch (this) {
      case CategoryEnum.general:
        return Assets.images.general.path;
      case CategoryEnum.business:
        return Assets.images.busniess.path;
      case CategoryEnum.sports:
        return Assets.images.sport.path;
      case CategoryEnum.technology:
        return Assets.images.technology.path;
      case CategoryEnum.entertainment:
        return Assets.images.entertainment.path;
      case CategoryEnum.health:
        return Assets.images.helth.path;
      case CategoryEnum.science:
        return Assets.images.science.path;
    }
  }
}
