import 'package:flutter/material.dart';
import '../models/clinic.dart';
import 'clinic_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Clinic> allClinics = [];
  List<Clinic> displayedClinics = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadClinics();
  }

  void loadClinics() async {
    try {
      // Simulate a network call or data fetching
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        allClinics = [
          Clinic(
            name: 'Clinic One',
            specialty: 'Cardiology',
            address: '123 Main St',
            contact: '123-456-7890',
            operatingHours: 'Mon-Fri, 9AM-5PM',
            services: ['Cardiac Consultation', 'ECG', 'Stress Test'],
          ),
          Clinic(
            name: 'Clinic Two',
            specialty: 'Dermatology',
            address: '456 Elm St',
            contact: '098-765-4321',
            operatingHours: 'Tue-Sat, 10AM-4PM',
            services: ['Skin Check', 'Biopsy', 'Mole Removal'],
          ),
        ];
        displayedClinics = List.from(allClinics);
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load clinics. Please try again later.';
      });
    }
  }

  void filterClinics(String query) {
    List<Clinic> filtered = allClinics.where((clinic) {
      return clinic.name.toLowerCase().contains(query.toLowerCase()) ||
             clinic.specialty.toLowerCase().contains(query.toLowerCase()) ||
             clinic.address.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      displayedClinics = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic Finder', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!, style: const TextStyle(color: Colors.red)))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search for clinics',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (text) {
                          filterClinics(text);
                        },
                      ),
                    ),
                    Expanded(
                      child: displayedClinics.isEmpty
                          ? Center(
                              child: Text('No clinics found. Try a different search term.', style: Theme.of(context).textTheme.bodyMedium),
                            )
                          : ListView.builder(
                              itemCount: displayedClinics.length,
                              itemBuilder: (context, index) {
                                Clinic clinic = displayedClinics[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                  elevation: 2,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ClinicDetailScreen(clinic: clinic),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.local_hospital, color: Theme.of(context).primaryColor),
                                      title: Text(clinic.name, style: Theme.of(context).textTheme.bodyLarge),
                                      subtitle: Text('${clinic.specialty}, ${clinic.address}', style: Theme.of(context).textTheme.bodyMedium),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
    );
  }
}