import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_app/ui/screens/full_view/full_view_model.dart';
import 'package:image_app/utils/constants/colors.dart';
import 'package:image_app/utils/constants/sizeCalculator.dart';
import 'package:stacked/stacked.dart';

class FullView extends StatefulWidget {
  final String imageUrl;
  FullView({ this.imageUrl});

  @override
  _FullViewState createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
   double ht;
   double wt;
   double margin;

  @override
  Widget build(BuildContext context) {
  
    return ViewModelBuilder<FullViewModel>.reactive(
        viewModelBuilder: () => FullViewModel(),
        builder: (context, model, child) =>
            OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                ht = height(0.7, context);
                wt = width(1, context);
                margin = 0.07;
              } else
                ht = height(0.7, context);
              wt = height(0.5, context);
              margin = 0.0;

              return Scaffold(
                backgroundColor: AppColors.black,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.black,
                  leading: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        model.pop();
                      },
                    ),
                  ),
                ),
                body: Container(
                  margin: EdgeInsets.only(top: height(margin, context)),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      height: ht,
                      width: wt,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }));
  }
}
