import 'package:flutter/material.dart';

class EditPortfolioScreen extends StatefulWidget {
  @override
  _EditPortfolioScreenState createState() => _EditPortfolioScreenState();
}

class _EditPortfolioScreenState extends State<EditPortfolioScreen> {
  final List<String> _portfolioItems = ["Project A", "Project B"];

  void _addPortfolioItem() {
    setState(() {
      _portfolioItems.add("New Project");
    });
  }

  void _editPortfolioItem(int index) {
    setState(() {
      _portfolioItems[index] = "Edited Project";
    });
  }

  void _removePortfolioItem(int index) {
    setState(() {
      _portfolioItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Portfolio")),
      body: ListView.builder(
        itemCount: _portfolioItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_portfolioItems[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editPortfolioItem(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removePortfolioItem(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPortfolioItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
