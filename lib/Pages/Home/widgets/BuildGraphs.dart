import 'package:covid_tracker/Model/Country.dart';
import 'package:covid_tracker/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BuildGraphs {
  static Widget buildConfirmedGraph(Country country, int n) {
    return Container(
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.widthMultiplier * 20,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
              show: false, drawHorizontalLine: false, drawVerticalLine: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              curveSmoothness: 10,
              spots: List.generate(
                30,
                (index) => FlSpot(
                  index.toDouble(),
                  double.parse(
                    country
                        .casesTimeSeries[country.casesTimeSeries.length - (n--)]
                        .dailyconfirmed,
                  ),
                ),
              ),
              colors: [Colors.red],
              dotData: FlDotData(show: false),
            )
          ],
        ),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }

  static Widget buildRecoveredGraph(Country country, int n) {
    return Container(
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.widthMultiplier * 20,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          clipData: FlClipData.none(),
          extraLinesData: ExtraLinesData(extraLinesOnTop: false),
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
              show: false, drawHorizontalLine: false, drawVerticalLine: false),
          axisTitleData: FlAxisTitleData(show: false),
          rangeAnnotations: RangeAnnotations(),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              curveSmoothness: 10,
              spots: List.generate(
                30,
                (index) => FlSpot(
                  index.toDouble(),
                  double.parse(
                    country
                        .casesTimeSeries[country.casesTimeSeries.length - (n--)]
                        .dailyrecovered,
                  ),
                ),
              ),
              dotData: FlDotData(show: false),
              colors: [Colors.green],
            )
          ],
        ),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }

  static Widget buildActiveGraph(Country country, int n) {
    return Container(
        height: SizeConfig.heightMultiplier * 7,
        width: SizeConfig.widthMultiplier * 20,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            clipData: FlClipData.none(),
            extraLinesData: ExtraLinesData(extraLinesOnTop: false),
            lineTouchData: LineTouchData(enabled: false),
            gridData: FlGridData(
                show: false,
                drawHorizontalLine: false,
                drawVerticalLine: false),
            axisTitleData: FlAxisTitleData(show: false),
            rangeAnnotations: RangeAnnotations(),
            titlesData: FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                curveSmoothness: 10,
                spots: List.generate(
                  30,
                  (index) => FlSpot(
                    index.toDouble(),
                    double.parse(
                      country
                          .casesTimeSeries[
                              country.casesTimeSeries.length - (n--)]
                          .dailyrecovered,
                    ),
                  ),
                ),
                dotData: FlDotData(show: false),
                colors: [Colors.blue],
              )
            ],
          ),
          swapAnimationDuration: Duration(seconds: 1),
        ));
  }

  static Widget buildDeathsGraph(Country country, int n) {
    return Container(
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.widthMultiplier * 20,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          clipData: FlClipData.none(),
          extraLinesData: ExtraLinesData(extraLinesOnTop: false),
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
              show: false, drawHorizontalLine: false, drawVerticalLine: false),
          axisTitleData: FlAxisTitleData(show: false),
          rangeAnnotations: RangeAnnotations(),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              curveSmoothness: 10,
              spots: List.generate(
                30,
                (index) => FlSpot(
                  index.toDouble(),
                  double.parse(
                    country
                        .casesTimeSeries[country.casesTimeSeries.length - (n--)]
                        .dailydeceased,
                  ),
                ),
              ),
              dotData: FlDotData(show: false),
              colors: [Colors.grey[700]],
            )
          ],
        ),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }
}
