import 'package:stacked/stacked.dart';
import 'package:terrarium/models/patient.dart';

class PatientService with ListenableServiceMixin {
  List<Patient> patientsWithWarnings = [
    Patient(
      firstName: "Charles",
      lastName: "Dickens",
      id: 123456,
      age: 65,
      heartRate: 71,
      respiratoryRate: 32,
      spO2: 89,
      temperature: 38,
    ),
    Patient(
      firstName: "Jane",
      lastName: "Austen",
      id: 123457,
      age: 72,
      heartRate: 98,
      respiratoryRate: 34,
      spO2: 91,
      temperature: 38,
    )
  ];

  Patient? getPatientWithWarningFromID(int id) {
    return patientsWithWarnings.firstWhere((element) => element.id == id);
  }
}
