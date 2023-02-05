import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class canaryAnimation extends StatefulWidget {
  const canaryAnimation({Key? key}) : super(key: key);

  @override
  State<canaryAnimation> createState() => _canaryAnimationState();
}

class _canaryAnimationState extends State<canaryAnimation> {
  SMITrigger? _hover;
  void _onInit(Artboard art) {
    var ctrl = StateMachineController.fromArtboard(art, 'State Machine 1')
        as StateMachineController;
    ctrl.isActive = true;
    art.addController(ctrl);
    setState(() {
      StateMachineController _controller = ctrl;
      _hover = _controller.findInput<bool>('hover') as SMITrigger;
    });

    Future.delayed(Duration(milliseconds: 7000), (){
      _hover?.fire();
    });
  }



  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      "assets/canary_animation.riv",
      onInit: _onInit,
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
    );
  }
}
