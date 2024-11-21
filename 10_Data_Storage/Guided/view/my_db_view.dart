import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class MyDbView extends StatefulWidget {
  @override
  _MyDbViewState createState() => _MyDbViewState();
}

class _MyDbViewState extends State<MyDbView> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _dataList = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // Fetch data from the database
  Future<void> _refreshData() async {
    final data = await _dbHelper.queryAllRows();
    setState(() {
      _dataList = data;
    });
  }

  // Add new data
  Future<void> _addData(String title, String description) async {
    await _dbHelper.insert({
      'title': title,
      'description': description,
    });
    _refreshData();
  }

  // Update existing data
  Future<void> _updateData(int id, String title, String description) async {
    await _dbHelper.update({
      'id': id,
      'title': title,
      'description': description,
    });
    _refreshData();
  }

  // Delete data
  Future<void> _deleteData(int id) async {
    await _dbHelper.delete(id);
    _refreshData();
  }

  void _showForm({Map<String, dynamic>? existingData}) {
    if (existingData != null) {
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    } else {
      _titleController.clear();
      _descriptionController.clear();
    }

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (existingData == null) {
                    _addData(
                      _titleController.text,
                      _descriptionController.text,
                    );
                  } else {
                    _updateData(
                      existingData['id'],
                      _titleController.text,
                      _descriptionController.text,
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: Text(existingData == null ? 'Add Data' : 'Update Data'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My DB View'),
      ),
      body: _dataList.isEmpty
          ? const Center(child: Text('No data available.'))
          : ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                final item = _dataList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(item['title']),
                    subtitle: Text(item['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showForm(existingData: item),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteData(item['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(),
      ),
    );
  }
}
