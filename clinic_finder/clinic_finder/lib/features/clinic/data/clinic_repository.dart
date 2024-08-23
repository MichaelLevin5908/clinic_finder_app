import 'package:clinic_finder/features/clinic/service/clinic_api_service.dart';
import 'package:clinic_finder/models/Clinic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clinicRepositoryProvider = Provider<ClinicRepository>((ref) {
  final clinicAPIService = ref.read(clinicAPIServiceProvider);
  return ClinicRepository(clinicAPIService);
});

class ClinicRepository {
  ClinicRepository(this.clinicAPIService);

  final ClinicAPIService clinicAPIService;

  Future<List<Clinic>> getClinics() {
    return clinicAPIService.getClinics();
  }

  Future<List<Clinic>> getPastClinic() {
    return clinicAPIService.getPastClinics();
  }

  Future<void> add(Clinic clinic) async {
    return clinicAPIService.addClinic(clinic);
  }

  Future<void> update(Clinic updatedClinic) async {
    return clinicAPIService.updateClinic(updatedClinic);
  }

  Future<void> delete(Clinic updatedClinic) async {
    return clinicAPIService.deleteClinic(updatedClinic);
  }

  Future<Clinic> getClinic(String clinicId) async {
    return clinicAPIService.getClinic(clinicId);
  }
}