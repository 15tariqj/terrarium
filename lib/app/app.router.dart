// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:terrarium/ui/views/home/home_view.dart' as _i3;
import 'package:terrarium/ui/views/patient_warning/patient_warning_view.dart'
    as _i4;
import 'package:terrarium/ui/views/startup/startup_view.dart' as _i2;

class Routes {
  static const startupView = '/startup-view';

  static const homeView = '/home-view';

  static const patientWarningView = '/patient-warning-view';

  static const all = <String>{
    startupView,
    homeView,
    patientWarningView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.patientWarningView,
      page: _i4.PatientWarningView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.HomeView(key: args.key),
        settings: data,
      );
    },
    _i4.PatientWarningView: (data) {
      final args = data.getArgs<PatientWarningViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.PatientWarningView(key: args.key, id: args.id),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i5.Key? key;
}

class PatientWarningViewArguments {
  const PatientWarningViewArguments({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final int id;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientWarningView({
    _i5.Key? key,
    required int id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.patientWarningView,
        arguments: PatientWarningViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientWarningView({
    _i5.Key? key,
    required int id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.patientWarningView,
        arguments: PatientWarningViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
