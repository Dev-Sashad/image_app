import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_app/ui/screens/home/home_view_model.dart';
import 'package:image_app/utils/constants/colors.dart';
import 'package:image_app/utils/constants/sizeCalculator.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {

  int count;
  static final _cacheManager =
      CacheManager(Config('customCacheKey', stalePeriod: Duration(days: 4)));
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (v) async {
         DefaultCacheManager().emptyCache();
        },
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
                  child: GridView.builder(
                      controller: _scrollController,
                      //physics: ClampingScrollPhysics(),
                      itemCount: model.images.length,
                      cacheExtent: 999,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 3 : 6,
                        //childAspectRatio: 1.0,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: () {
                              print("image url is ${model.images[i].imageUrl}");
                              model.pushTo(context, model.images[i].imageUrl);
                            },
                            child: ClipRRect(
                              // key: ValueKey(model.images[i].id),
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                cacheManager: _cacheManager,
                                key: ValueKey(model.images[i].id),
                                imageUrl: model.images[i].imageUrl,
                                fadeOutDuration: Duration(milliseconds: 200),
                                fadeInDuration: Duration(milliseconds: 100),
                                //maxHeightDiskCache: 75,
                                memCacheHeight: 200,
                                memCacheWidth: 200,
                                placeholder: (context, url) => Container(
                                  color: Colors.black12,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.blue),
                                  )),
                                ),
                                height: height(0.2, context),
                                width: width(0.3, context),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                ));
          });
        });
  }
}
