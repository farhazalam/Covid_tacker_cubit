import 'package:covid_tracker/Data/country_repository.dart';
import 'package:covid_tracker/Pages/Home/HomePage.dart';
import 'package:covid_tracker/cubit/country_cubit.dart';
import 'package:covid_tracker/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              home: BlocProvider(
                create: (context) =>
                    CountryCubit(CountryRepositoryImplementation()),
                child: Homepage(),
              ),
            );
          },
        );
      },
    );
  }
}
