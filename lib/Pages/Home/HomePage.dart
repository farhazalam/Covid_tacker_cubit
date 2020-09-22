import 'package:covid_tracker/Model/Country.dart';
import 'package:covid_tracker/Pages/Home/widgets/BuildGraphs.dart';
import 'package:covid_tracker/cubit/country_cubit.dart';
import 'package:covid_tracker/utils/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void didChangeDependencies() {
    context.bloc<CountryCubit>().getCountryData();
    super.didChangeDependencies();
  }

  Widget _buildLastUpdatedTime(String s) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        s,
      ),
    );
  }

  Widget _buildConfirmedTab(Country country) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Confirmed',
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '+' + country.statewise[0].deltaconfirmed,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.7,
              fontWeight: FontWeight.w500,
              color: Colors.red),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          country.statewise[0].confirmed,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.9,
              fontWeight: FontWeight.w500,
              color: Colors.red),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        BuildGraphs.buildConfirmedGraph(country, 30)
      ],
    );
  }

  Widget _buildActiveTab(Country country) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Active',
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          ' ',
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.7,
              fontWeight: FontWeight.w500,
              color: Colors.red),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          country.statewise[0].active,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.9,
              fontWeight: FontWeight.w500,
              color: Colors.blue),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        BuildGraphs.buildActiveGraph(country, 30)
      ],
    );
  }

  Widget _buildRecoveredTab(Country country) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Recovered',
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '+' + country.statewise[0].deltarecovered,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.7,
              fontWeight: FontWeight.w500,
              color: Colors.green),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          country.statewise[0].recovered,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.9,
              fontWeight: FontWeight.w500,
              color: Colors.green),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        BuildGraphs.buildRecoveredGraph(country, 30)
      ],
    );
  }

  Widget _buildDeathTab(Country country) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Deceased',
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '+' + country.statewise[0].deltadeaths,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.7,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          country.statewise[0].deaths,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.9,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        BuildGraphs.buildDeathsGraph(country, 30)
      ],
    );
  }

  Widget _buildHeading(Country country) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildConfirmedTab(country),
            flex: 1,
          ),
          Expanded(
            child: _buildActiveTab(country),
            flex: 1,
          ),
          Expanded(
            child: _buildRecoveredTab(country),
            flex: 1,
          ),
          Expanded(
            child: _buildDeathTab(country),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(Country country) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 4),
          Text(
            'Covid\'19 Tracker',
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 4,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 3),
          _buildLastUpdatedTime(country.statewise[0].lastupdatedtime),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          _buildHeading(country),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial) {
            return Container();
          } else if (state is CountryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return _buildBody(state.country);
          } else {
            return Container(
                child: Row(
              children: [
                Text('Connection Error'),
                FlatButton(
                    onPressed: () {
                      context.bloc<CountryCubit>().getCountryData();
                    },
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ))
              ],
            ));
          }
        },
      ),
    );
  }
}
