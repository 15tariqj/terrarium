import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:terrarium/app/animationTransition.dart';
import 'package:terrarium/models/patient.dart';
import 'package:terrarium/ui/common/app_colors.dart';
import 'package:terrarium/ui/common/ui_helpers.dart';
import 'package:terrarium/ui/views/patient_warning/patient_warning_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  int currentScrollIndex = 0;

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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(
                    height: 60,
                  ),
                  SlideAnimation(
                    startInterval: 0.3,
                    endInterval: 0.7,
                    child: Container(
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
                            SlideAnimation(
                              startInterval: 0.3,
                              endInterval: 0.6,
                              duration: 2000,
                              xOffset: -0.2,
                              yOffset: 0,
                              child: Column(
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
                                SlideAnimation(
                                  startInterval: 0.5,
                                  endInterval: 0.8,
                                  duration: 2000,
                                  xOffset: -0.2,
                                  yOffset: 0,
                                  child: Column(
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
                                SlideAnimation(
                                  startInterval: 0.6,
                                  endInterval: 1,
                                  duration: 2000,
                                  xOffset: -0.2,
                                  yOffset: 0,
                                  child: Column(
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth(context) - 239,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Patient Warnings",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                              ),
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    currentScrollIndex -= 1;
                                    if (currentScrollIndex < 0) {
                                      currentScrollIndex = 0;
                                    }
                                    itemScrollController.scrollTo(
                                      index: currentScrollIndex,
                                      duration: Duration(
                                        milliseconds: 750,
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Container(
                                      child: Icon(
                                        Icons.chevron_left,
                                        size: 42,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    currentScrollIndex += 1;
                                    if (currentScrollIndex ==
                                        viewModel.patientsWithWarnings.length -
                                            1) {
                                      currentScrollIndex = 0;
                                    }
                                    itemScrollController.scrollTo(
                                      index: currentScrollIndex,
                                      duration: Duration(
                                        milliseconds: 750,
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      child: Icon(
                                        Icons.chevron_right,
                                        size: 42,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 450,
                        width: screenWidth(context) - 239,
                        child: ScrollablePositionedList.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.patientsWithWarnings.length,
                          itemBuilder: (BuildContext context, int index) =>
                              PatientWarningView(
                                  id: viewModel.patientsWithWarnings[index].id),
                          itemScrollController: itemScrollController,
                          itemPositionsListener: itemPositionsListener,
                        ),
                      )
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
