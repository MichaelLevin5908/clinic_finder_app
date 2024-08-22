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

    Future<List<Hospital>> getClinics() async {
    try {
      final request = ModelQueries.list(Hospital.classType);
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
          .map((e) => e as Hospital)
          .toList();
    } on Exception catch (error) {
      safePrint('getClinics failed: $error');

      return const [];
    }
  }

    Future<List<Hospital>> getPastClinics() async {
    try {
      final request = ModelQueries.list(Hospital.classType);
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
          .map((e) => e as Hospital)
          .toList();
    } on Exception catch (error) {
      safePrint('getPastClinics failed: $error');

      return const [];
    }
  }

    Future<void> addClinic(Hospital hospital) async {
    try {
      final request = ModelMutations.create(hospital);
      final response = await Amplify.API.mutate(request: request).response;

      final createdHospital = response.data;
      if (createdHospital == null) {
        safePrint('addClinic errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addClinic failed: $error');
    }
  }

    Future<void> deleteClinic(Hospital hospital) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.delete(hospital),
          )
          .response;
    } on Exception catch (error) {
      safePrint('deleteClinic failed: $error');
    }
  }

    Future<void> updateClinic(Hospital updatedHospital) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.update(updatedHospital),
          )
          .response;
    } on Exception catch (error) {
      safePrint('updatedHospital failed: $error');
    }
  }

    Future<Hospital> getClinic(String hospitalId) async {
    try {
      final request = ModelQueries.get(
        Hospital.classType,
        HospitalModelIdentifier(id: hospitalId),
      );
      final response = await Amplify.API.query(request: request).response;

      final hospital = response.data!;
      return hospital;
    } on Exception catch (error) {
      safePrint('getClinic failed: $error');
      rethrow;
    }
  }
}
