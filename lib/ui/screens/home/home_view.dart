import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_app/ui/screens/home/home_view_model.dart';
import 'package:image_app/utils/constants/colors.dart';
import 'package:image_app/utils/constants/sizeCalculator.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        // onModelReady: (v) async {
        //   await v.fetchImages();
        // },
        builder: (context, model, child) {
          return OrientationBuilder(builder: (context, orientation) {
            return Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBar(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'Flutter Test',
                      style: TextStyle(color: AppColors.black, fontSize: 20),
                    ),
                  ),
                ),
                body: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: GridView(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait? 3 : 6,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      ),
                      children: model.images
                          .map((feed) => GestureDetector(
                                onTap: () {
                                  print("image url is ${feed.imageUrl}");
                                  model.pushTo(context, feed.imageUrl);
                                },
                                child: ClipRRect(
                                  key: ValueKey(feed.id),
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: feed.imageUrl,
                                    fadeOutDuration:
                                        Duration(milliseconds: 200),
                                    fadeInDuration: Duration(milliseconds: 100),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                            child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.blue),
                                    )),
                                    height: height(0.2, context),
                                    width: width(0.3, context),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ))
                          .toList()),
                ));
          });
        });
  }
}
