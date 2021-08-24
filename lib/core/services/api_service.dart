import 'package:image_app/core/model/error_model.dart';
import 'package:image_app/core/model/image_model.dart';
import 'package:image_app/core/model/success_model.dart';
import 'package:image_app/utils/helpers.dart';
import 'package:image_app/utils/http/paths.dart';
import 'index.dart';

class ImageApiService {

late ImageModel _imageModel;
ImageModel get imageModel => _imageModel;

  getImages() async {
    try {
      final result = await http.get(Paths.fetchImages);
      if (result is ErrorModel) {
        showErrorToast('Server Error');
        print("ERROR");
        print(result.error);
        return ErrorModel(result.error);
      }

    _imageModel = ImageModel.fromJson(result.data);
    print("Goooood");
        return SuccessModel(result.data);
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
  }
}
