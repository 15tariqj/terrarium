import 'package:stacked/stacked_annotations.dart';
import 'package:terrarium/ui/views/home/home_view.dart';
import 'package:terrarium/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:terrarium/services/patient_service.dart';
import 'package:terrarium/ui/views/patient_warning/patient_warning_view.dart';
import 'package:terrarium/ui/views/patient_actions/patient_actions_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: PatientWarningView),
  MaterialRoute(page: PatientActionsView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: PatientService),
// @stacked-service
])
class App {}
