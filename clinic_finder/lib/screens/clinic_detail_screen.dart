import 'package:flutter/material.dart';
import '../models/clinic.dart';

class ClinicDetailScreen extends StatelessWidget {
  final Clinic clinic;

  const ClinicDetailScreen({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clinic.name, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                clinic.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                clinic.specialty,
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red, semanticLabel: 'Address'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      clinic.address,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.blue, semanticLabel: 'Contact'),
                  const SizedBox(width: 8),
                  Text(
                    clinic.contact,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.green, semanticLabel: 'Operating Hours'),
                  const SizedBox(width: 8),
                  Text(
                    clinic.operatingHours,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Services Offered:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ...clinic.services.map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(Icons.check, color: Colors.green, semanticLabel: 'Service'),
                        const SizedBox(width: 8),
                        Text(service, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



