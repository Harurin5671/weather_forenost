import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:interview_flutter/screens/screens.dart';
import 'package:interview_flutter/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherForemost',
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppBar(
              backgroundColor: Colors.black,
              leading: Image.asset('assets/images/weatherIcon.png'),
              title: const Text(
                'WeatherForemost',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: const TabBarCustom(),
        ),
      ),
    );
  }
}
