import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;

class ClinicsListPage extends StatelessWidget {
  const ClinicsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Clinics Planner',
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(constants.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Clinics List'),
      ),
    );
  }
}