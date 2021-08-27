import 'package:flutter/material.dart';
import 'package:image_app/core/model/image_model.dart';
import 'package:image_app/core/services/api_service.dart';
import 'package:image_app/ui/screens/full_view/full_view.dart';
import 'package:image_app/utils/baseModel.dart';
import 'package:image_app/utils/locator.dart';
import 'package:image_app/utils/router/navigation_service.dart';

class HomeViewModel extends BaseModel {
  final ImageApiService _imageApiService = locator<ImageApiService>();
  final NavigationService _navigationService = locator<NavigationService>();

  
  //List<Data> _images ;
  List<Data> get images => _imageApiService.imageModel.data;

  // fetchImages() async {
  //   try{
  //   final result = await _imageApiService.getImages();
  //   if (result is ErrorModel) {
  //       print("SERVER ERROR");
  //       print(result.error);
  //       return ErrorModel(result.error);
  //     }
  //   print("Fetch Sucessfull");
  //   return SuccessModel(result.data);
  // }catch(e){
  //   print(e.toString());
  //     return ErrorModel('$e');
  // }
  // }

  pushTo(BuildContext context, String imageUrl){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> FullView(imageUrl: imageUrl,)));
   notifyListeners();
  }

}
