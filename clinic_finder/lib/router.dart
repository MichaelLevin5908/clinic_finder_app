import 'package:clinic_finder_app/screens/sign_in.dart';
import 'package:clinic_finder_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/clinic.dart';
import 'package:clinic_finder_app/screens/clinic_detail_screen.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'signIn',
      builder: (context, state) => const SignInPage1(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/clinic/:id',
      name: 'clinicDetail',
      builder: (context, state) {
        final clinic = state.extra as Clinic;
        return ClinicDetailScreen(clinic: clinic);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);