// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, must_be_immutable, use_super_parameters

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

class DoctorAppointment {
  final String doctorName;
  final String appointmentDate;

  DoctorAppointment({required this.doctorName, required this.appointmentDate});
}

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

class p_asearch extends StatefulWidget {
  List<DoctorAppointment> appointments = [];

  p_asearch({
    Key? key,
    required this.appointments,
  }) : super(key: key);

  @override
  State<p_asearch> createState() => _p_asearchState();
}

class _p_asearchState extends State<p_asearch> {
  bool isAppointmentAccepted = false;

  String searchValue = '';
  String? selectedLocation;

  String? selectedSpecialty;
  List<Doctor> filteredDoctors = [];

  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Ahmed',
      rating: 4.5,
      location: 'Cairo',
      specialty: 'General Doctor',
      imagePath: 'assets/images/doctor2.jpg',
    ),
    Doctor(
      name: 'Dr.Heba',
      rating: 4.2,
      location: 'Alexandria',
      specialty: 'obstetrics and gynecology',
      imagePath: 'assets/images/doctor1.jpg',
    ),
    Doctor(
      name: 'Dr. Amir',
      rating: 4.8,
      location: 'Aswan',
      specialty: 'Neurologists',
      imagePath: 'assets/images/doctor3.jpg',
    ),
    Doctor(
      name: 'Dr.manar',
      rating: 4.8,
      location: 'Elshorouk',
      specialty: 'onram',
      imagePath: 'assets/images/doctor4.jpg',
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
        actions: [
          SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: logo,
              ))
        ],
        backgroundColor: Colors.white54,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: defultColor),
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
                      hintText: 'Search for the doctor\'s name',
                      hintStyle: TextStyle(color: defultColor),
                      prefixIcon: Icon(Icons.search, color: defultColor),
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
                  color: defultColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FilterDialog(
                          locations: const [
                            'Cairo',
                            'Alexandria',
                            'Aswan',
                            'Elshorouk',
                          ],
                          specialties: const [
                            'General Doctor',
                            'obstetrics and gynecology',
                            'Neurologists',
                            'onram',
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
    String? selectedprice;

    String? selectedSpecialty;
    String? searchText;

    return AlertDialog(
      title: const Text('Determine the desired doctor'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
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
          child: const Text('Search'),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  doctor.imagePath,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
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
                      const SizedBox(width: 25),
                      const Text('Price:100\$'),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 85),
                        child: SizedBox(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              // عرض مربع حوار لإدخال البيانات
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Enter Price and Location'),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Location',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // تنفيذ عند الضغط على زر الحفظ
                                          // يمكنك القيام بالإجراءات المناسبة هنا
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              defultColor, // تعيين لون الخلفية إلى اللون الأخضر
                                        ),
                                        child: const Text('Send',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ),
                            child: const Text(
                              'reservation',
                              style: TextStyle(
                                  color: defultColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
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
