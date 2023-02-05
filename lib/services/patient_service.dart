import 'package:stacked/stacked.dart';
import 'package:terrarium/models/patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    ),
    Patient(
      firstName: "Mary",
      lastName: "Jane",
      id: 123458,
      age: 57,
      heartRate: 71,
      respiratoryRate: 30,
      spO2: 90,
      temperature: 38,
    )
  ];

  Patient? getPatientWithWarningFromID(int id) {
    return patientsWithWarnings.firstWhere((element) => element.id == id);
  }

  Future<void> initialise() async {
    /// Heartrate set using Terra API
    /*final String url =
        "https://api.tryterra.co/v2/activity?user_id=f58f2c05-f7b3-4fc5-bb21-a5f37e035930&start_date=2022-02-01&end_date=2022-02-07&to_webhook=false&with_samples=true";

    final Map<String, String> headers = {
      "accept": "application/json",
      "dev-id": "ichack-terrarium-dev-jV9ZdYXJUP",
      "x-api-key":
          "d586b1d59db65f1450a9e8bce816ced58b6c33abe81db1ce2f6134f7c866ed95"
    };*/

    ///Imperial WiFi
    const String url = "http://146.169.215.141:8000/query/patients-at-risk/";
    final Map<String, String> headers = {
      "accept": "application/json",
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    Map<String, String> body = json.decode(response.body);
    for (String key in body.keys) {
      Map<String, dynamic> healthData = json.decode(body[key]!);
      patientsWithWarnings.add(
        Patient(
          firstName: "Lung",
          lastName: "Frankenstein",
          id: 123459,
          age: 82,
          heartRate: healthData["avg_hr_bpm"],
          respiratoryRate: healthData["respiratory_rate"],
          spO2: healthData["avg_saturation_percentage"],
          temperature: healthData["temperature"],
        ),
      );
    }
  }
}
