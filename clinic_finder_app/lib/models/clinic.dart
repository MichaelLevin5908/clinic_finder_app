class Clinic {
  final String name;
  final String specialty;
  final String address;
  final String contact;
  final String operatingHours;
  final List<String> services;

  Clinic({
    required this.name,
    required this.specialty,
    required this.address,
    required this.contact,
    required this.operatingHours,
    required this.services,
  });
}