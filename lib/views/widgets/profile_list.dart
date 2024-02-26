import 'package:flutter/material.dart';

class ProfileListTile {
  final IconData icon;
  final String title;

  ProfileListTile({
    required this.icon,
    required this.title,
  });
}

List<ProfileListTile> profileList = [
  ProfileListTile(
    icon: Icons.person_outline,
    title: 'Profile',
  ),
  ProfileListTile(
    icon: Icons.notifications_none_outlined,
    title: 'Notifications',
  ),
  ProfileListTile(
    icon: Icons.credit_card_outlined,
    title: 'Payment',
  ),
  ProfileListTile(
    icon: Icons.location_on_outlined,
    title: 'Address',
  ),
  ProfileListTile(
    icon: Icons.settings_outlined,
    title: 'Settings',
  ),
  ProfileListTile(
    icon: Icons.help_outline,
    title: 'Help',
  ),
  ProfileListTile(
    icon: Icons.logout,
    title: 'Logout',
  ),
];
