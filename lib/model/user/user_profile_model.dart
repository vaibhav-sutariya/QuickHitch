import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

class UserProfileModel {
  final String message;
  final Data data;
  final String? token;

  UserProfileModel(
      {required this.message, required this.data, required this.token});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );
}

class Data {
  final User user;
  final Stats stats;
  final Rides rides;
  final Ratings ratings;

  Data(
      {required this.user,
      required this.stats,
      required this.rides,
      required this.ratings});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        stats: Stats.fromJson(json["stats"]),
        rides: Rides.fromJson(json["rides"]),
        ratings: Ratings.fromJson(json["ratings"]),
      );
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String dob;
  final String bio;
  final String gender;
  final String pets;
  final String smoking;
  final String dialog;
  final String music;
  final String role;
  final String picture;
  final String timeZone;
  final int rating;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
    required this.bio,
    required this.pets,
    required this.smoking,
    required this.dialog,
    required this.music,
    required this.gender,
    required this.role,
    required this.picture,
    required this.timeZone,
    required this.rating,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
        bio: json["bio"],
        pets: json["pets"],
        smoking: json["smoking"],
        dialog: json["dialog"],
        music: json["music"],
        gender: json["gender"],
        role: json["role"],
        picture: json["picture"],
        timeZone: json["timeZone"],
        rating: json["rating"],
      );
}

class Stats {
  final int kmsDriven;
  final int peopleDriven;
  final int ridesTaken;

  Stats(
      {required this.kmsDriven,
      required this.peopleDriven,
      required this.ridesTaken});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        kmsDriven: json["kmsDriven"],
        peopleDriven: json["peopleDriven"],
        ridesTaken: json["ridesTaken"],
      );
}

class Rides {
  final List<dynamic> upcomingRides;
  final List<dynamic> completedRides;

  Rides({required this.upcomingRides, required this.completedRides});

  factory Rides.fromJson(Map<String, dynamic> json) => Rides(
        upcomingRides: List<dynamic>.from(json["upcomingRides"].map((x) => x)),
        completedRides:
            List<dynamic>.from(json["completedRides"].map((x) => x)),
      );
}

class Ratings {
  final int overallRating;
  final AvgRatings? avgRatings; // Nullable to prevent errors

  Ratings({required this.overallRating, this.avgRatings});

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        overallRating: json["overallRating"],
        avgRatings: json["avgRatings"] != null
            ? AvgRatings.fromJson(json["avgRatings"])
            : null, // Handle null case
      );
}

class AvgRatings {
  final double? timeliness;
  final double? communication;
  final double? safety;

  AvgRatings({this.timeliness, this.communication, this.safety});

  factory AvgRatings.fromJson(Map<String, dynamic> json) => AvgRatings(
        timeliness: json["timeliness"]?.toDouble(),
        communication: json["communication"]?.toDouble(),
        safety: json["safety"]?.toDouble(),
      );
}
