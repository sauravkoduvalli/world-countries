import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_countries/providers/theme_provider.dart';
import 'package:world_countries/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextEditController = TextEditingController();
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
              SizedBox(height: 12.0,),
              // searchbar
              SearchTextField(
                controller: searchTextEditController,
                onChanged: (value) {
                  print(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
