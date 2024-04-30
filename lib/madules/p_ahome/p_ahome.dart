// ignore_for_file: unused_local_variable, camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

class Doctor {
  final String name;
  final double rating;
  final String location;
  final String specialty;
  final String imagePath;

  Doctor({
    required this.name,
    required this.rating,
    required this.location,
    required this.specialty,
    required this.imagePath,
  });
}

class p_ahome extends StatefulWidget {
  const p_ahome({super.key});

  @override
  State<p_ahome> createState() => _p_ahomeState();
}

class _p_ahomeState extends State<p_ahome> {
  String searchValue = '';
  String? selectedLocation;
  String? selectedSpecialty;
  List<Doctor> filteredDoctors = [];

  final List<Doctor> doctors = [
    Doctor(
      name: 'دكتور أحمد',
      rating: 4.5,
      location: 'القاهرة',
      specialty: 'طبيب عام',
      imagePath: 'assets/images/doctor1.jpg',
    ),
    Doctor(
      name: 'دكتور محمد',
      rating: 4.2,
      location: 'الإسكندرية',
      specialty: 'جراحة عامة',
      imagePath: 'assets/images/doctor1.jpg',
    ),
    Doctor(
      name: 'دكتور أمير',
      rating: 4.8,
      location: 'الإسكندرية',
      specialty: 'أطفال',
      imagePath: 'assets/images/doctor1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    filteredDoctors = searchValue.isEmpty
        ? doctors.where((doctor) {
            if (selectedLocation != null &&
                doctor.location != selectedLocation) {
              return false;
            }
            if (selectedSpecialty != null &&
                doctor.specialty != selectedSpecialty) {
              return false;
            }
            return true;
          }).toList()
        : doctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(searchValue.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الأطباء'),
        actions: [
          IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.pop(context);
              },
              color: defultColor),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'ابحث عن اسم الطبيب',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchValue = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_alt),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FilterDialog(
                          locations: const ['القاهرة', 'الإسكندرية'],
                          specialties: const [
                            'طبيب عام',
                            'جراحة عامة',
                            'أطفال'
                          ],
                          onFilterChanged: (location, specialty) {
                            setState(() {
                              selectedLocation = location;
                              selectedSpecialty = specialty;
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(filteredDoctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  final List<String> locations;
  final List<String> specialties;
  final Function(String?, String?) onFilterChanged;

  const FilterDialog({
    super.key,
    required this.locations,
    required this.specialties,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedLocation;
    String? selectedSpecialty;
    String? searchText;

    return AlertDialog(
      title: const Text('Determine'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search for the doctor\'s name',
              ),
              onChanged: (value) {
                searchText = value;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedLocation,
              onChanged: (String? newValue) {
                selectedLocation = newValue;
              },
              items: locations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedSpecialty,
              onChanged: (String? newValue) {
                selectedSpecialty = newValue;
              },
              items: specialties.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onFilterChanged(selectedLocation, selectedSpecialty);
          },
          child: const Text('search'),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(doctor.imagePath),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 4),
                      Text(doctor.location),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        doctor.rating.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Specialization: ${doctor.specialty}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
