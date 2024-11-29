import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContextMenuListView(),
    );
  }
}

class ContextMenuListView extends StatefulWidget {
  @override
  _ContextMenuListViewState createState() => _ContextMenuListViewState();
}

class _ContextMenuListViewState extends State<ContextMenuListView> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  void _onMenuSelected(BuildContext context, String value, int index) {
    switch (value) {
      case 'edit':
        _editItem(context, index);
        break;
      case 'view':
        _viewItem(context, index);
        break;
      case 'delete':
        _deleteItem(index);
        break;
    }
  }

  void _editItem(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Editing ${items[index]}')),
    );
  }

  void _viewItem(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Viewing ${items[index]}')),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted item')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Context Menu ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (value) => _onMenuSelected(context, value, index),
              itemBuilder: (context) => [
                PopupMenuItem(value: 'view', child: Text('View')),
                PopupMenuItem(value: 'edit', child: Text('Edit')),
                PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
          );
        },
      ),
    );
  }
}
