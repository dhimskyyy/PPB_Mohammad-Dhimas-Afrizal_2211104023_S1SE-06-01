import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentForm extends StatefulWidget {
  final Function(Student) onSubmit;

  const StudentForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _addressController = TextEditingController();
  final _hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _nimController,
            decoration: InputDecoration(
              labelText: 'NIM',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.numbers),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter NIM';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an address';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _hobbyController,
            decoration: InputDecoration(
              labelText: 'Hobi',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.interests),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a hobby';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final student = Student(
                  name: _nameController.text,
                  nim: _nimController.text,
                  address: _addressController.text,
                  hobby: _hobbyController.text,
                );
                widget.onSubmit(student);
              }
            },
            child: Text('Simpan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _addressController.dispose();
    _hobbyController.dispose();
    super.dispose();
  }
}