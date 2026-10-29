import 'package:assab/core/network/api_endpoints.dart';
import 'package:assab/features/custody/data/custody_receipt_action.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'receipt action posts only to the existing confirm-receipt endpoint',
    () async {
      final dio = Dio();
      RequestOptions? captured;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            captured = options;
            handler.resolve(
              Response<void>(requestOptions: options, statusCode: 200),
            );
          },
        ),
      );

      await CustodyReceiptAction(dio).confirm('request-123');

      expect(captured?.method, 'POST');
      expect(
        captured?.uri.toString(),
        '${ApiEndpoint.baseUrl}custody/requests/request-123/confirm-receipt',
      );
      expect(captured?.data, isNull);
    },
  );
}
