import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/chart%20screen/core/models/chart_model.dart';
import 'package:dumbell_cartel/features/chart%20screen/core/provider/chart_provider.dart';
import 'package:dumbell_cartel/features/chart%20screen/widgets/date_navigation_section.dart';

class ChartsScreenComponent extends ConsumerWidget {
  const ChartsScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    final weekData = ref.watch(weeklyDataProvider);
    final weekOffset = ref.watch(weekOffsetProvider);
    return Scaffold(
      backgroundColor: color.background,

      appBar: AppBar(
        backgroundColor: color.background,
        title: Text(
          "Tracker",
          style: Fontstyles.roboto16pxSemiBoldGreen(
            context,
            ref,
          ).copyWith(fontSize: 22),
        ),
        centerTitle: false,
      ),

      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Navigation
            DateNavigationSection(),

            SizedBox(height: 10.0),

            // Chart
            Expanded(
              child: SfCartesianChart(
                backgroundColor: Colors.transparent,
                plotAreaBorderWidth: 0,
                legend: Legend(
                  isVisible: true,
                  textStyle: Fontstyles.roboto13px(context, ref),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),

                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: Fontstyles.roboto13Hintpx(context, ref),
                ),

                primaryYAxis: NumericAxis(
                  title: AxisTitle(),
                  axisLine: const AxisLine(width: 0),
                  labelStyle: Fontstyles.roboto13Hintpx(
                    context,
                    ref,
                  ).copyWith(color: color.teritiaryColor),
                  majorTickLines: const MajorTickLines(size: 0),
                ),

                axes: <ChartAxis>[
                  NumericAxis(
                    name: 'caloriesAxis',
                    opposedPosition: true,
                    title: AxisTitle(),
                    labelStyle: Fontstyles.roboto13Hintpx(
                      context,
                      ref,
                    ).copyWith(color: color.warningColor),
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                  ),
                ],

                series: <CartesianSeries<ChartModel, String>>[
                  // Steps - Bars
                  ColumnSeries<ChartModel, String>(
                    dataSource: weekData,
                    name: 'Steps',
                    color: color.teritiaryColor,
                    width: 0.6,
                    borderRadius: BorderRadius.circular(6),
                    xValueMapper: (data, _) => [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                    ][data.date.weekday - 1],
                    yValueMapper: (data, _) => data.steps,
                  ),

                  // Calories - Line
                  LineSeries<ChartModel, String>(
                    dataSource: weekData,
                    name: 'Calories',
                    color: color.warningColor,
                    width: 2,
                    yAxisName: 'caloriesAxis',
                    markerSettings: MarkerSettings(
                      isVisible: true,
                      color: color.warningColor,
                    ),
                    xValueMapper: (data, _) => [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                    ][data.date.weekday - 1],
                    yValueMapper: (data, _) => data.calories,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
