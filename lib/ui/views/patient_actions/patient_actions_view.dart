import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'patient_actions_viewmodel.dart';

class PatientActionsView extends StackedView<PatientActionsViewModel> {
  final int id;
  const PatientActionsView({Key? key, required this.id}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientActionsViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${viewModel.patient.firstName} ${viewModel.patient.lastName}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    "#${viewModel.patient.id} - ${viewModel.patient.age} years old",
                    style: const TextStyle(
                      color: kSheetIDColour,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: kNonWarningMetricColour,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 8,
                                top: 8,
                                child: Icon(
                                  Icons.monitor_heart_outlined,
                                  color: kNonWarningMetricIconColour,
                                  size: 30,
                                ),
                              ),
                              Center(
                                child: Text(
                                  viewModel.patient.heartRate.toString(),
                                  style: const TextStyle(
                                    color: kNonWarningMetricIconColour,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Heart rate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: kWarningMetricColour,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 8,
                                top: 8,
                                child: Icon(
                                  Icons.air_outlined,
                                  color: kWarningMetricIconColour,
                                  size: 30,
                                ),
                              ),
                              Center(
                                child: Text(
                                  viewModel.patient.respiratoryRate.toString(),
                                  style: const TextStyle(
                                    color: kWarningMetricIconColour,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Respiratory rate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: viewModel.patient.spO2 >= 90
                                ? kNonWarningMetricColour
                                : kWarningMetricColour,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Icon(
                                  Icons.water_drop,
                                  color: viewModel.patient.spO2 >= 90
                                      ? kNonWarningMetricIconColour
                                      : kWarningMetricIconColour,
                                  size: 30,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${viewModel.patient.spO2.toString()}%",
                                  style: TextStyle(
                                    color: viewModel.patient.spO2 >= 90
                                        ? kNonWarningMetricIconColour
                                        : kWarningMetricIconColour,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "SpO2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: kWarningMetricColour,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 8,
                                top: 8,
                                child: Icon(
                                  Icons.thermostat,
                                  color: kWarningMetricIconColour,
                                  size: 30,
                                ),
                              ),
                              Center(
                                child: Text(
                                  viewModel.patient.temperature.toString(),
                                  style: const TextStyle(
                                    color: kWarningMetricIconColour,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Temperature",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: kPatientWarningsIncreaseTextColour,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "ePrescribe Prophylaxis",
                style: TextStyle(
                  color: kPatientWarningsIncreaseColour,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PatientActionsViewModel viewModelBuilder(
    BuildContext context,
  ) {
    PatientActionsViewModel patientActionsViewModel = PatientActionsViewModel();
    patientActionsViewModel.initialize(id: id);
    return patientActionsViewModel;
  }
}
