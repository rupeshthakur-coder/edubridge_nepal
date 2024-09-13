import 'package:flutter/material.dart';

class SettingsPage<SettingsPageState> extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Variables to store current setting states
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  bool emailUpdatesEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0, // No shadow for a clean look
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Settings
            _buildListTile(
              icon: Icons.person,
              title: 'Profile Settings',
              subtitle: 'Update your profile information',
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    '/profile'); // Replace '/home' with the actual home route
              },
            ),
            const SizedBox(height: 20), // Increased spacing
            // Dark Mode Toggle
            _buildSwitchTile(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Notifications Toggle
            _buildSwitchTile(
              icon: Icons.notifications,
              title: 'Enable Notifications',
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Email Updates Toggle
            _buildSwitchTile(
              icon: Icons.email,
              title: 'Receive Email Updates',
              value: emailUpdatesEnabled,
              onChanged: (value) {
                setState(() {
                  emailUpdatesEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Privacy Policy
            _buildListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening Privacy Policy...')),
                );
              },
            ),
            const SizedBox(height: 20),

            _buildListTile(
              icon: Icons.gavel,
              title: 'Terms & Conditions',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Opening Terms & Conditions...')),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Reusable ListTile for standard settings items
  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required Function onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(fontSize: 14))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () => onTap(),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, size: 30, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      value: value,
      onChanged: (newValue) => onChanged(newValue),
    );
  }
}
