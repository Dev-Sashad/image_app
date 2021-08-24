import 'package:flutter/material.dart';
import 'package:image_app/ui/screens/splashscreens/splahscreen_viewmodel.dart';
import 'package:image_app/utils/constants/colors.dart';
import 'package:image_app/utils/constants/sizeCalculator.dart';
import 'package:stacked/stacked.dart';

class SplashscreenView extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.navigationPage(),
      builder: (context, model, child) =>  Container(
      height: height(1, context),
      width: width(1, context),
          color: AppColors.white,
          child: Center(child: Image.asset('assets/images/logo.png', width: width(0.4, context), height: height(0.3, context),),)
      ),
    );
  }
}
