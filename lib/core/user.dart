class User {

  late final String id;
  late final String firstName;
  late final String? lastName;
  late final DateTime? dateOfBirth;

  User({
    required this.id,
    required this.firstName,
    required this.dateOfBirth,
    this.lastName
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = DateTime.parse(json['dateOfBirth']);
  }

  dynamic toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': (dateOfBirth ?? DateTime.now()).toIso8601String()
    };
  }
}