
class Result {
  Result({
    this.dbId,
    this.gender,
    this.id,
    this.name,
    this.profilePath,
  });
  int dbId ;
  int gender;
  int id;
  String name;
  String profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gender: json["gender"],
    id: json["id"],
    name: json["name"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "id": id,
    "name": name,
    "profile_path": profilePath,
  };

}
