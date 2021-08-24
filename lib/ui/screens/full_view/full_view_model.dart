import 'package:image_app/utils/baseModel.dart';
import 'package:image_app/utils/locator.dart';
import 'package:image_app/utils/router/navigation_service.dart';

class FullViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  pop(){
    _navigationService.pop();
  }
}