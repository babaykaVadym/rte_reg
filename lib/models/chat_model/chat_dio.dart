import 'package:dio/dio.dart';
import 'package:rte_cubit/services/consts.dart';

class chatDio {
  Future<void> uploadFileAsFormData(String path, messeg, id) async {
    try {
      final dio = Dio();
      print(path);
      dio.options.headers = requestHeaders;

      final file =
          await MultipartFile.fromFile(path, filename: 'test_file.jpg');

      final formData = FormData.fromMap({
        'file': file,
        'id': id,
        'message': messeg.toString(),
        'type': "user",
        'temporaryMsgId': "temp_3"
      }); // 'file' - this is an api key, can be different

      final response = await dio.post(
        // or dio.post
        "https://a.rte.im/chatify/sendMessage",
        data: formData,
      );

      print(response.statusCode);
      print(response.data);
    } catch (err) {
      print('uploading error: $err');
    }
  }
}
