import 'package:clinic_finder/features/clinic/service/clinic_api_service.dart';
import 'package:clinic_finder/models/Hospital.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clinicRepositoryProvider = Provider<ClinicRepository>((ref) {
  final clinicAPIService = ref.read(clinicAPIServiceProvider);
  return ClinicRepository(clinicAPIService);
});

class ClinicRepository {
  ClinicRepository(this.clinicAPIService);

  final ClinicAPIService clinicAPIService;

  Future<List<Hospital>> getClinics() {
    return clinicAPIService.getClinics();
  }

  Future<List<Hospital>> getPastClinic() {
    return clinicAPIService.getPastClinics();
  }

  Future<void> add(Hospital hospital) async {
    return clinicAPIService.addClinic(hospital);
  }

  Future<void> update(Hospital updatedHospital) async {
    return clinicAPIService.updateClinic(updatedHospital);
  }

  Future<void> delete(Hospital updatedHospital) async {
    return clinicAPIService.deleteClinic(updatedHospital);
  }

  Future<Hospital> getClinic(String clinicId) async {
    return clinicAPIService.getClinic(clinicId);
  }
}