import 'package:flutter/material.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/carousal_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/grid_widget.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              //  Container(
              //
              //    decoration: BoxDecoration(
              //      borderRadius: BorderRadius.circular(5),
              //    ),
              //    padding: EdgeInsets.all(10),
              //    child: Icon(Icons.add),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocal.loc.hello_world,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CarouselWithSmoothIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Explore Offers',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward)

            ],
          ),

          GridWidget(),
        ],
      ),
    );
  }
}
