import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/common/widgets/reusable_workout_list_tile.dart';
import 'package:dumbell_cartel/common/widgets/search_box.dart';
import 'package:dumbell_cartel/features/suggested%20workouts%20screen/widgets/pr_bottomsheet.dart';

class SuggestedWorkoutComponent extends ConsumerWidget {
  const SuggestedWorkoutComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.background,

        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: color.background,
          iconTheme: IconThemeData(color: color.iconColor),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chest Wokouts", style: Fontstyles.roboto25px(context, ref)),
              SizedBox(height: 10.0),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: color.textfieldBackground2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/images/chest_muscle.png"),
                ),
              ),

              SizedBox(height: 20.0),

              // Search section
              SearchBox(onChanged: (value){},),

              SizedBox(height: 20.0),

              // List of workouts
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    splashColor: color.textfieldBackground2,
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: color.transparent,
                        enableDrag: true,
                        isScrollControlled: true,
                        builder: (context) => PrBottomsheet(),
                      );
                    },
                    child: ReusableWorkoutListTile(
                      suffixWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "27.5 x 12",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Fontstyles.roboto17Bold(context, ref),
                          ),
                          Text(
                            "Logged on 3 Jul",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Fontstyles.roboto13Hintpx(context, ref),
                          ),
                        ],
                      ),
                      name: 'Incline press',
                      target: 'chest',
                      
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
