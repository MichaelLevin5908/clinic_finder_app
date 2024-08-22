import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:clinic_finder/features/clinic/UI/clinicslist/clinicslistpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clinic_finder/clinicsfind.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name, // Default route pointing to ClinicApp (sign-in screen)
      builder: (context, state) => const ClinicApp(),
    ),
    GoRoute(
      path: '/clinics',
      name: AppRoute.clinicscreen.name,
      builder: (context, state) => const ClinicsListPage(), // Clinics List page
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
