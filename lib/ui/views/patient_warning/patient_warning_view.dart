import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'patient_warning_viewmodel.dart';

class PatientWarningView extends StackedView<PatientWarningViewModel> {
  final int id;

  const PatientWarningView({Key? key, required this.id}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientWarningViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PatientWarningViewModel viewModelBuilder(
    BuildContext context,
  ) {
    PatientWarningViewModel patientWarningViewModel = PatientWarningViewModel();
    patientWarningViewModel.initialize(id: id);
    return patientWarningViewModel;
  }
}
