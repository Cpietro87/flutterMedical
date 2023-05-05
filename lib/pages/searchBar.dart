import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchValue = '';
  final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German'];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Scaffold(
        appBar: EasySearchBar(
          title: const Text('Example'),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () => Navigator.pop(context)
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () => Navigator.pop(context)
              )
            ]
          )
        ),
        body: Center(
          child: Text('Value: $searchValue')
        )
      )
    );
  }
}
