import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:clinic_finder/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clinicAPIServiceProvider = Provider<ClinicAPIService>((ref) {
  final service = ClinicAPIService();
  return service;
});

class ClinicAPIService {
  ClinicAPIService();

    Future<List<Clinic>> getClinics() async {
    try {
      final request = ModelQueries.list(Clinic.classType);
      final response = await Amplify.API.query(request: request).response;

      final trips = response.data?.items;
      if (trips == null) {
        safePrint('getTrips errors: ${response.errors}');
        return const [];
      }
      trips.sort(
        (a, b) =>
            a!.hospitalName.compareTo(b!.hospitalName), // Not sure about this
      );
      return trips
          .map((e) => e as Clinic)
          .toList();
    } on Exception catch (error) {
      safePrint('getClinics failed: $error');

      return const [];
    }
  }

    Future<List<Clinic>> getPastClinics() async {
    try {
      final request = ModelQueries.list(Clinic.classType);
      final response = await Amplify.API.query(request: request).response;

      final trips = response.data?.items;
      if (trips == null) {
        safePrint('getPastTrips errors: ${response.errors}');
        return const [];
      }
      trips.sort(
        (a, b) =>
            a!.hospitalName.compareTo(b!.hospitalName),
      );
      return trips
          .map((e) => e as Clinic)
          .toList();
    } on Exception catch (error) {
      safePrint('getPastClinics failed: $error');

      return const [];
    }
  }

    Future<void> addClinic(Clinic clinic) async {
    try {
      final request = ModelMutations.create(clinic);
      final response = await Amplify.API.mutate(request: request).response;

      final createdClinic = response.data;
      if (createdClinic == null) {
        safePrint('addClinic errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addClinic failed: $error');
    }
  }

    Future<void> deleteClinic(Clinic clinic) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.delete(clinic),
          )
          .response;
    } on Exception catch (error) {
      safePrint('deleteClinic failed: $error');
    }
  }

    Future<void> updateClinic(Clinic updatedClinic) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.update(updatedClinic),
          )
          .response;
    } on Exception catch (error) {
      safePrint('updatedClinic failed: $error');
    }
  }

    Future<Clinic> getClinic(String clinicId) async {
    try {
      final request = ModelQueries.get(
        Clinic.classType,
        ClinicModelIdentifier(id: clinicId),
      );
      final response = await Amplify.API.query(request: request).response;

      final clinic = response.data!;
      return clinic;
    } on Exception catch (error) {
      safePrint('getClinic failed: $error');
      rethrow;
    }
  }
}