import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:clinic_finder/features/clinic/UI/clinicslist/clinicslistpage.dart';
import 'package:clinic_finder/features/clinic/UI/clinicslist/clinicsmappage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ClinicsListPage(),
      redirect: (context, state) async {
        try {
          var session = await Amplify.Auth.fetchAuthSession();
          if (!session.isSignedIn) {

            return '/signin';
          }
        } catch (e) {
          return '/signin';
        }
        return null;
      },
    ),
    GoRoute(
      path: '/map',
      name: AppRoute.map.name,
      builder: (context, state) => const ClinicsMapPage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text('Redirecting to Sign-In...'),
          ),
        );
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);