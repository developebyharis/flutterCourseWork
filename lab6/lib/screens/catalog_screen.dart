import 'package:flutter/material.dart';

import '../models/course.dart';
import '../widgets/course_card.dart';
import 'registration_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();   //hold mutable state
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool showGrid = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Catalog by haris 😁'),
        actions: [
          IconButton(
            icon: Icon(showGrid ? Icons.list : Icons.grid_view),
            tooltip: showGrid ? 'List view' : 'Grid view',   // not imp but i added to tell its usecase
            onPressed: () {
              setState(() {
                showGrid = !showGrid; // toggle to make grid view true
              });
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),  // simple drawer 
      body: showGrid ? _buildGrid(width) : _buildList(),    // simple to update ui based on grid or list state 
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: kCourses.length,
      itemBuilder: (context, index) {    // item build instead of using simple child i use it becuase its a 
        // function that create each item a widget and use index to indentifies each
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CourseCard(course: kCourses[index]),
        );
      },
    );
  }

  Widget _buildGrid(double width) {
    // Responsive more columns on wider screens.
    int columns = 2;
    if (width >= 600) columns = 3;
    if (width >= 900) columns = 4;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  // arrange items in a grid with a fixed number of columns
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.25,
      ),
      itemCount: kCourses.length,  // simple length count
      itemBuilder: (context, index) {
        return CourseCard(course: kCourses[index]);
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, color: Colors.white, size: 40),
                SizedBox(height: 8),
                Text(
                  'Course Catalog',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Catalog'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
         
          ListTile(
            leading: const Icon(Icons.sort),
            title: const Text('Sort courses'),
            onTap: () {
              Navigator.pop(context);
              _showSortSheet();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog();
            },
          ),
        ],
      ),
    );
  }

  // Modal bottom sheet.
  void _showSortSheet() {
    showModalBottomSheet(
      context: context,   // conext of the screen it belong to 
      builder: (context) {    // 
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text(
                  'Sort by',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Highest rated'),
                onTap: () {
                  setState(() {
                    kCourses.sort((a, b) => b.rating.compareTo(a.rating));
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Shortest first'),
                onTap: () {
                  setState(() {
                    kCourses.sort((a, b) => a.hours.compareTo(b.hours));    // it uses simple .sort to filter out by comparing the hours (longest and shortest)
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Alert dialog.
  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('About'),
          content: const Text(
            'Course Catalog demo app.\nBuilt with Flutter by Muhammad Haris Khan, 1440.',
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
