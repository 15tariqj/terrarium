import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:terrarium/models/patient.dart';
import 'package:terrarium/ui/common/app_colors.dart';
import 'package:terrarium/ui/common/ui_helpers.dart';
import 'package:terrarium/ui/views/patient_warning/patient_warning_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 175,
              height: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, ${viewModel.firstName}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: screenWidth(context) - 239,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 24, 80, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Patients",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    viewModel.totalPatients.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 40,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kViewAllButtonColour,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(16, 8, 16, 8),
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                          color: kViewAllTextColour,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kLilacDividerColour,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 105,
                                width: 8,
                              ),
                              SizedBox(width: 36),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Patient Warnings",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        viewModel.patientWarnings.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: kPatientWarningsIncreaseColour,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 6, 20, 6),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.arrow_upward,
                                                  color:
                                                      kPatientWarningsIncreaseTextColour,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  viewModel
                                                      .changeInPatientWarnings
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color:
                                                        kPatientWarningsIncreaseTextColour,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18,
                                                  ),
                                                )
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kLilacDividerColour,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 105,
                                width: 8,
                              ),
                              SizedBox(width: 36),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Actions Needed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        viewModel.actionsNeeded.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: kViewAllButtonColour,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          child: Text(
                                            "View All",
                                            style: TextStyle(
                                              color: kViewAllTextColour,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Patient Warnings",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 500,
                        width: 550,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (Patient patient
                                  in viewModel.patientsWithWarnings)
                                PatientWarningView(id: patient.id),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) {
    HomeViewModel homeViewModel = HomeViewModel();
    homeViewModel.initialize();
    return homeViewModel;
  }
}
