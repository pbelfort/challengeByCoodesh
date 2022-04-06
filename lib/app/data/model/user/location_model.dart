import 'package:pharma/app/data/model/user/cordinate_model.dart';
import 'package:pharma/app/data/model/user/street_model.dart';
import 'package:pharma/app/data/model/user/timezone_model.dart';

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;

  Coordinates? coordinates;
  Timezone? timezone;

  Location(
      {this.street,
      this.city,
      this.state,
      this.country,
      this.coordinates,
      this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street =
        json['street'] != null ? new Street.fromJson(json['street']) : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];

    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.street != null) {
      data['street'] = this.street!.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;

    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone!.toJson();
    }
    return data;
  }
}
