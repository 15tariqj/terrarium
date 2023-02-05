import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/patient.dart';
import '../../../services/patient_service.dart';

class PatientActionsViewModel extends BaseViewModel {
  final PatientService patientService = locator<PatientService>();

  late Patient patient;

  initialize({required int id}) {
    patient = patientService.getPatientWithWarningFromID(id)!;
  }
}
