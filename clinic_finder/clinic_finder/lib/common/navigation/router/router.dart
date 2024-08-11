import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:clinic_finder/features/clinic/UI/clinicslist/clinicslistpage.dart';
import 'package:clinic_finder/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.signin.name,
      builder: (context, state) => const SignInPage1(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);