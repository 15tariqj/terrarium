import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:terrarium/app/animationTransition.dart';
import 'package:terrarium/ui/common/app_colors.dart';

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
    return SlideAnimation(

      startInterval: 0.7,
      endInterval: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          width: 500,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideAnimation(
                      startInterval: 0.62,
                      endInterval: 0.9,
                      duration: 3000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${viewModel.patient.firstName} ${viewModel.patient.lastName}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "#${viewModel.patient.id} - ${viewModel.patient.age} years old",
                            style: const TextStyle(
                              color: kPatientNumColour,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideAnimation(
                          startInterval: 0.6,
                          endInterval: 0.8,
                          duration: 3000,
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
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
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        viewModel.patient.heartRate.toString(),
                                        style: const TextStyle(
                                          color: kNonWarningMetricIconColour,
                                          fontSize: 24,
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
                                  color: kPatientNumColour,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        SlideAnimation(
                          startInterval: 0.65,
                          endInterval: 0.9,
                          duration: 3000,
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
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
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        viewModel.patient.respiratoryRate
                                            .toString(),
                                        style: const TextStyle(
                                          color: kWarningMetricIconColour,
                                          fontSize: 24,
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
                                  color: kPatientNumColour,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        SlideAnimation(
                          startInterval: 0.7,
                          endInterval: 0.9,
                          duration: 3000,
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
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
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "${viewModel.patient.spO2.toString()}%",
                                        style: TextStyle(
                                          color: viewModel.patient.spO2 >= 90
                                              ? kNonWarningMetricIconColour
                                              : kWarningMetricIconColour,
                                          fontSize: 24,
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
                                  color: kPatientNumColour,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        SlideAnimation(
                          startInterval: 0.75,
                          endInterval: 0.9,
                          duration: 3000,
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
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
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        viewModel.patient.temperature.toString(),
                                        style: const TextStyle(
                                          color: kWarningMetricIconColour,
                                          fontSize: 24,
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
                                  color: kPatientNumColour,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SlideAnimation(
                  startInterval: 0.8,
                  endInterval: 1,
                  duration: 3200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 215,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kViewAllButtonColour,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            "Call",
                            style: TextStyle(
                              color: kViewAllTextColour,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 215,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kPatientWarningsIncreaseColour,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            "View more actions",
                            style: TextStyle(
                              color: kPatientWarningsIncreaseTextColour,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
