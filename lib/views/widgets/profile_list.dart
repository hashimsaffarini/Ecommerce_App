import 'package:flutter/material.dart';

class ProfileListTile {
  final IconData icon;
  final String title;
  final Function()? onTap;
  const ProfileListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

List<ProfileListTile> profileList = const [
  ProfileListTile(
    icon: Icons.person_outline,
    title: 'Profile',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.notifications_none_outlined,
    title: 'Notifications',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.credit_card_outlined,
    title: 'Payment',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.location_on_outlined,
    title: 'Address',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.settings_outlined,
    title: 'Settings',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.help_outline,
    title: 'Help',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.logout,
    title: 'Logout',
    onTap: null,
  ),
];
