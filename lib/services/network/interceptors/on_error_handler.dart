import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:posdelivery/app/ui/components/ui_notification.dart';
import 'package:posdelivery/models/status_codes.dart';

class OnErrorHandler extends Interceptor {
  String statusMessage = '';
  int statusCode = StatusCodes.status404NotFound;
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    UINotification.hideLoading();
    if (err.type == DioErrorType.response) {
      statusCode = err.response?.statusCode;
      statusMessage = err.response?.statusMessage;

      switch (statusCode) {
        case StatusCodes.status401Unauthorized:
          //UINotification.showNotification(title: 'error_401'.tr);
          super.onError(err, handler);
          break;
        case StatusCodes.status404NotFound:
          UINotification.showNotification(title: 'error_404'.tr);
          super.onError(err, handler);
          break;
        case StatusCodes.status400BadRequest:
          super.onError(err, handler);
          break;

        case StatusCodes.status500InternalServerError:
          break;

        default:
          super.onError(err, handler);
          break;
      }
    } else {
      super.onError(err, handler);
    }
  }
}
