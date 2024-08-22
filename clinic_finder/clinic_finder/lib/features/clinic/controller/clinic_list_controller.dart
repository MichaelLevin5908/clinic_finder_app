import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:clinic_finder/features/clinic/data/clinic_repository.dart';
import 'package:clinic_finder/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clinic_list_controller.g.dart';

@riverpod
class ClinicListController extends _$ClinicListController {
    Future<List<Hospital>> _fetchClinics() async {
    final clinicsRepository = ref.read(clinicRepositoryProvider);
    final clinics = await clinicsRepository.getClinics();
    return clinics;
  }

  @override
  FutureOr<List<Hospital>> build() async {
    return _fetchClinics();
  }

  Future<void> addClinic({
    required String hospital,
    required String location,
  }) async {
    final trip = Hospital(
      hospitalName: hospital,
      location: location,
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final clinicRepository = ref.read(clinicRepositoryProvider);
      await clinicRepository.add(trip);
      return _fetchClinics();
    });
  }

  Future<void> removeClinic(Hospital hospital) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final clinicRepository = ref.read(clinicRepositoryProvider);
      await clinicRepository.delete(hospital);

      return _fetchClinics();
    });
  }

}
