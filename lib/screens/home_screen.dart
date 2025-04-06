import 'package:flutter/material.dart';

import '../providers/country_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "data",
        style: TextStyle(
          color: Theme.of(context).textTheme.headlineMedium?.backgroundColor,
        ),
      )),
      body: const Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
