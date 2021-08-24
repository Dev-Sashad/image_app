
import 'package:image_app/core/services/api_service.dart';
import 'package:image_app/utils/baseModel.dart';
import 'package:image_app/utils/locator.dart';
import 'package:image_app/utils/router/navigation_service.dart';
import 'package:image_app/utils/router/routeNames.dart';

class SplashScreenViewModel extends BaseModel {
   final ImageApiService _imageApiService = locator<ImageApiService>();
  final NavigationService _navigationService = locator<NavigationService>();
  


  navigationPage() async {
   await _imageApiService.getImages().whenComplete(()=>_navigationService.navigateReplacementTo(HomeViewRoute));
  }

  


}