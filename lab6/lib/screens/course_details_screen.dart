import 'package:flutter/material.dart';

import '../models/course.dart';
import 'registration_screen.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: course.color,
              child: Column(
                children: [
                  Icon(course.icon, color: Colors.white, size: 60),
                  const SizedBox(height: 10),
                  Text(
                    course.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (course.isNew)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Info row.
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                Text('Instructor: ${course.instructor}'),
                Text('Duration: ${course.hours} hours'),
                Text('Rating: ${course.rating}'),
                Text('Category: ${course.category}'),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              'About this course',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              course.description,
              style: const TextStyle(height: 1.5),
            ),
            const SizedBox(height: 24),

            // Navigate to registration, passing the Course object.
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text('Register for this course'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen(course: course),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
