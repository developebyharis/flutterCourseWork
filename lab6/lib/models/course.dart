import 'package:flutter/material.dart';

class Course {
  final String title;
  final String instructor;
  final String category;
  final int hours;
  final double rating;
  final String description;
  final Color color;
  final IconData icon;
  final bool isNew;

  const Course({
    required this.title,
    required this.instructor,
    required this.category,
    required this.hours,
    required this.rating,
    required this.description,
    required this.color,
    required this.icon,
    this.isNew = false,
  });
}

final List<Course> kCourses = [
  const Course(
    title: 'Flutter Development',
    instructor: 'Sarah Miller',
    category: 'Mobile',
    hours: 24,
    rating: 4.8,
    isNew: true,
    description:
        'Learn to build mobile apps with Flutter. This course covers '
        'widgets, layouts, navigation and how to publish your app.',
    color: Colors.indigo,
    icon: Icons.phone_iphone,
  ),
  const Course(
    title: 'Dart Programming',
    instructor: 'James Carter',
    category: 'Language',
    hours: 18,
    rating: 4.6,
    description:
        'Learn the Dart language from the basics: variables, classes, '
        'collections and simple programs.',
    color: Colors.teal,
    icon: Icons.code,
  ),
  const Course(
    title: 'UI Design Basics',
    instructor: 'Emily Stone',
    category: 'Design',
    hours: 12,
    rating: 4.9,
    isNew: true,
    description:
        'Color, typography and layout rules for beginners. Make simple '
        'and clean interfaces.',
    color: Colors.orange,
    icon: Icons.palette,
  ),
  const Course(
    title: 'Web Development with React',
    instructor: 'Michael Chen',
    category: 'Web',
    hours: 22,
    rating: 4.5,
    description:
        'Build websites with React. Components, state and simple '
        'projects you can show in your portfolio.',
    color: Colors.blue,
    icon: Icons.language,
  ),
  const Course(
    title: 'Python for Beginners',
    instructor: 'Nina Patel',
    category: 'Programming',
    hours: 16,
    rating: 4.7,
    description:
        'Start programming with Python. Loops, functions and small '
        'projects for absolute beginners.',
    color: Colors.green,
    icon: Icons.terminal,
  ),
  const Course(
    title: 'SQL and Databases',
    instructor: 'Laura Kim',
    category: 'Backend',
    hours: 14,
    rating: 4.4,
    description:
        'Store and read data with SQL. Tables, SELECT, INSERT and '
        'simple database design.',
    color: Colors.brown,
    icon: Icons.storage,
  ),
];
