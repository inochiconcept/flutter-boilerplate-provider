import 'dart:convert';

class UserData {
  int id;
  String name;
  int age;
  UserData({
    required this.id,
    required this.name,
    required this.age,
  });

  UserData copyWith({
    int? id,
    String? name,
    int? age,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() => 'UserData(id: $id, name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.id == id &&
        other.name == name &&
        other.age == age;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ age.hashCode;
}
