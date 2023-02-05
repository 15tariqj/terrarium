class Patient {
  late String firstName;
  late String lastName;
  late int id;
  late int age;
  late int heartRate;
  late int respiratoryRate;
  late int spO2;
  late int temperature;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.age,
    required this.heartRate,
    required this.respiratoryRate,
    required this.spO2,
    required this.temperature,
  });
}
