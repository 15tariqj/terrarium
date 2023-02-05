import 'package:stacked/stacked.dart';
import 'package:terrarium/app/app.locator.dart';
import 'package:terrarium/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:terrarium/services/patient_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _patientService = locator<PatientService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // TODO: UNCOMMENT WHEN YOU WANT DATA FROM REQUESTS
    //await _patientService.initialise();
    await Future.delayed(const Duration(seconds: 10));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
