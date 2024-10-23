import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../extension/double.dart';
import '../../../widgets/index.dart';
import '../view.dart';
import 'card_with_title.dart';

class Rule extends StatelessWidget {
  const Rule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWithTitle(
      height: 250.r,
      padding: EdgeInsets.only(
        left: 32.r,
        right: 32.r,
        top: 72.r,
        bottom: 0.r,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      title: Assets.images.userProfileBackgroundimage.image(
        width: 300.r,
        height: 48.r,
        color: Colors.green,
        fit: BoxFit.cover,
      ),
      titleOffset: Offset(0, -24.r),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Every valid player = P100/No limit"),
          Text("Milestone extra rewards"),
          // Stepper(
          //   type: StepperType.horizontal,
          //   currentStep: 0,
          //   steps: <Step>[
          //     Step(
          //       title: const Text('Step 1 title'),
          //       content: Container(
          //         height: 100.r,
          //         alignment: Alignment.centerLeft,
          //         child: const Text('Content for Step 1'),
          //       ),
          //     ),
          //     const Step(
          //       title: Text('Step 2 title'),
          //       content: Text('Content for Step 2'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
