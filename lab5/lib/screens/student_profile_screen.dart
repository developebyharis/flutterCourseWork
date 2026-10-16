import 'package:flutter/material.dart';

import '../widgets/info_row.dart';
import '../widgets/profile_header.dart';
import '../widgets/section_card.dart';
import '../widgets/stat_tile.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
        ],
      ),

      // SingleChildScrollView makes the whole page scrollable,
      // so nothing can overflow vertically on a small phone.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Header ----
              const ProfileHeader(
                name: 'Muhammad Haris Khan',
                email: 'haris.khan@university.edu.pk',
                rollNumber: 'Roll No: 1440  |  Section C',
              ),
              const SizedBox(height: 16),

              // ---- Stats row (Row + Expanded) ----
              Row(
                children: [
                  const Expanded(
                    child: StatTile(
                      icon: Icons.grade,
                      label: 'CGPA',
                      value: '3.72',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: StatTile(
                      icon: Icons.menu_book,
                      label: 'Credits',
                      value: '96',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: StatTile(
                      icon: Icons.calendar_month,
                      label: 'Semester',
                      value: '5',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ---- Personal information ----
              SectionCard(
                title: 'Personal Information',
                icon: Icons.badge_outlined,
                rows: const [
                  InfoRow(
                    icon: Icons.cake_outlined,
                    label: 'Date of Birth',
                    value: '12 March 2004',
                  ),
                  InfoRow(
                    icon: Icons.wc_outlined,
                    label: 'Gender',
                    value: 'Male',
                  ),
                  InfoRow(
                    icon: Icons.home_outlined,
                    label: 'Address',
                    value: 'House 12, University Road, Islamabad, Pakistan',
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ---- Academic information ----
              SectionCard(
                title: 'Academic Information',
                icon: Icons.school_outlined,
                rows: const [
                  InfoRow(
                    icon: Icons.computer_outlined,
                    label: 'Program',
                    value: 'BS Computer Science (5th Semester)',
                  ),
                  InfoRow(
                    icon: Icons.account_balance_outlined,
                    label: 'Department',
                    value: 'Computer Science and Information Technology',
                  ),
                  InfoRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Enrollment Year',
                    value: '2023',
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ---- Contact information ----
              SectionCard(
                title: 'Contact Information',
                icon: Icons.contact_mail_outlined,
                rows: const [
                  InfoRow(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: '+92 300 1234567',
                  ),
                  InfoRow(
                    icon: Icons.emergency_outlined,
                    label: 'Emergency Contact',
                    value: 'Father - 0300 7654321',
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ---- Buttons (two different button types) ----
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Save'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile saved!')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('Contact'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening mail app...')),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
