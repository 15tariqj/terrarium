import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:terrarium/ui/common/riveanimation.dart';
import 'package:terrarium/ui/common/ui_helpers.dart';
import 'package:rive/rive.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Color(0xff433161),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 800,
                width: 800,
                child: canaryAnimation())
            // const Text(
            //   'Canary',
            //   style: TextStyle(
            //     fontSize: 40,
            //     fontWeight: FontWeight.w900,
            //   ),
            // ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: const [
            //     Text(
            //       'Loading ...',
            //       style: TextStyle(
            //         fontSize: 16,
            //       ),
            //     ),
            //     horizontalSpaceSmall,
            //     SizedBox(
            //       width: 16,
            //       height: 16,
            //       child: CircularProgressIndicator(
            //         color: Colors.black,
            //         strokeWidth: 6,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();


  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
