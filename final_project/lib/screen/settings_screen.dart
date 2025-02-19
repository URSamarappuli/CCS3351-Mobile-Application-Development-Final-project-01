// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  double _fontSize = 18.0;
  String _selectedFont = "Poppins";

  final List<String> fonts = [
    "Poppins",
    "Lobster",
    "Pacifico",
    "Roboto",
    "Merriweather"
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Load saved settings from SharedPreferences
  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
      _fontSize = prefs.getDouble('fontSize') ?? 18.0;
      _selectedFont = fonts.contains(prefs.getString('font'))
          ? prefs.getString('font')!
          : "Poppins";
    });
  }

  // Save settings
  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
    await prefs.setBool('notifications', _notificationsEnabled);
    await prefs.setDouble('fontSize', _fontSize);
    await prefs.setString('font', _selectedFont);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Dark Mode Toggle
              SwitchListTile(
                title: const Text("Dark Mode"),
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                    _saveSettings();
                  });
                },
              ),

              // 🔹 Notifications Toggle
              SwitchListTile(
                title: const Text("Enable Notifications"),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                    _saveSettings();
                  });
                },
              ),

              // 🔹 Font Size Slider
              Text("Font Size: ${_fontSize.toStringAsFixed(1)}"),
              Slider(
                min: 12,
                max: 30,
                value: _fontSize,
                onChanged: (value) {
                  setState(() {
                    _fontSize = value;
                    _saveSettings();
                  });
                },
              ),

              // 🔹 Font Style Dropdown
              const Text("Select Font:"),
              DropdownButton<String>(
                value: _selectedFont,
                onChanged: (newFont) {
                  if (newFont != null) {
                    setState(() {
                      _selectedFont = newFont;
                      _saveSettings();
                    });
                  }
                },
                items: fonts.map((font) {
                  return DropdownMenuItem(
                    value: font,
                    child: Text(font, style: GoogleFonts.getFont(font)),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
