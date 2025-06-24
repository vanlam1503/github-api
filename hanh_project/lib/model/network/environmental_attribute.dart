import 'package:hanh_project/constants/api_constants.dart';

class EnvironmentalAttribute {
  EnvironmentalAttribute.dev() : apiUrl = ApiConstants.devApiUrl;
  EnvironmentalAttribute.stg() : apiUrl = ApiConstants.stgApiUrl;
  EnvironmentalAttribute.prod() : apiUrl = ApiConstants.prodApiUrl;

  final String apiUrl;
}
