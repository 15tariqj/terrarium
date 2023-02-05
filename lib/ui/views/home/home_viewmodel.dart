import 'package:stacked/stacked.dart';
import 'package:terrarium/app/app.locator.dart';
import 'package:terrarium/services/patient_service.dart';

import '../../../models/patient.dart';

class HomeViewModel extends ReactiveViewModel {
  final PatientService patientService = locator<PatientService>();

  String firstName = "John";
  int totalPatients = 89;
  int patientWarnings = 3;
  int changeInPatientWarnings = 2;
  int actionsNeeded = 5;
  late List<Patient> patientsWithWarnings;
  int currentPatientID = 123456;

  initialize() {
    patientsWithWarnings = patientService.patientsWithWarnings;
  }
}
