import 'package:dumbell_cartel/features/chart%20screen/core/models/chart_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final weekOffsetProvider = StateProvider<int>((ref) => 0);

final weeklyDataProvider =
    StateNotifierProvider<WeeklyDataNotifier, List<ChartModel>>(
      (ref) => WeeklyDataNotifier(ref.watch(weekOffsetProvider)),
    );

class WeeklyDataNotifier extends StateNotifier<List<ChartModel>> {
  int weekOffset;

  WeeklyDataNotifier(this.weekOffset) : super([]) {
    loadWeekData();
  }

  // TODO: Replace with dynamic data
  void loadWeekData() {
    state = _getStaticWeekData();
  }

  List<ChartModel> _getStaticWeekData() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));

    return List.generate(7, (i) {
      final date = monday.add(Duration(days: i));
      final steps = [4000, 5200, 6800, 4500, 7300, 8100, 6000][i];
      final calories = [180, 210, 240, 200, 260, 290, 230][i];
      return ChartModel(date: date, steps: steps, calories: calories);
    });
  }
}
