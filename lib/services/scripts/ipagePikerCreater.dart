import 'package:image_picker/image_picker.dart';

class ImageCreates {
  final ImagePicker _picker = ImagePicker();
  PikerLodgick({bool isVideo, ImageSource source, context}) async {
    if (isVideo) {
    } else {
      try {
        final pickedFile = await _picker.getImage(
          source: source,
          imageQuality: 60,
        );
        return pickedFile;
      } catch (e) {}
    }
  }
}
