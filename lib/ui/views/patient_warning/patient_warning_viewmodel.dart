import 'package:stacked/stacked.dart';
import 'package:terrarium/app/app.locator.dart';
import 'package:terrarium/services/patient_service.dart';

import '../../../models/patient.dart';

class PatientWarningViewModel extends BaseViewModel {
  final PatientService patientService = locator<PatientService>();

  late Patient patient;

  initialize({required int id}) {
    patient = patientService.getPatientWithWarningFromID(id)!;
  }
}
