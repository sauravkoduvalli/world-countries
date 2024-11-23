import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/country_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/country_list.dart';
import '../widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    CountryProvider().fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextEditController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // header part (location, action icons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Location Name",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      ThemeProvider themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      if (themeProvider.themeMode == ThemeMode.light) {
                        themeProvider.setThemeMode(ThemeMode.dark);
                      } else {
                        themeProvider.setThemeMode(ThemeMode.light);
                      }
                    },
                    icon: context.watch<ThemeProvider>().themeMode ==
                            ThemeMode.dark
                        ? const Icon(Icons.light_mode_outlined)
                        : const Icon(Icons.dark_mode_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // searchbar
              SearchTextField(
                controller: searchTextEditController,
                onChanged: (value) {},
              ),
              // carousel slider
              const SizedBox(height: 8.0),
              // Countries List
              const CountryList(),
            ],
          ),
        ),
      ),
    );
  }
}

const countryList = [
  {
    'name': 'India',
    'code': '+91',
  }
];
