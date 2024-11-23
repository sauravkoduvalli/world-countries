import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_countries/providers/country_provider.dart';
import 'package:world_countries/providers/theme_provider.dart';
import 'package:world_countries/widgets/search_text_field.dart';

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
    final countryProvider = Provider.of<CountryProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Location Name",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
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
              const SizedBox(
                height: 12.0,
              ),
              // searchbar
              SearchTextField(
                controller: searchTextEditController,
                onChanged: (value) {
                  print(value);
                },
              ),
              // Countries List
              countryProvider.isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : countryProvider.errorMessage != null
                      ? Center(
                          child: Text(
                          countryProvider.errorMessage ?? "error",
                          style: const TextStyle(color: Colors.black),
                        ))
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: countryProvider.countries.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            log(countryProvider.countries[index].capital![0]
                                .toString());
                            return const CircularProgressIndicator.adaptive();
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
