import 'package:hanh_project/model/network/environmental_attribute.dart';

enum AppFlavor {
  dev,
  stg,
  prod,
}

class Flavor {
  static AppFlavor? appFlavor;

  static EnvironmentalAttribute get environment {
    switch (appFlavor) {
      case AppFlavor.dev:
        return EnvironmentalAttribute.dev();
      case AppFlavor.stg:
        return EnvironmentalAttribute.stg();
      case AppFlavor.prod:
        return EnvironmentalAttribute.prod();
      default:
        return EnvironmentalAttribute.dev();
    }
  }
}
