import 'package:assab/core/network/api_endpoints.dart';
import 'package:dio/dio.dart';

/// Uses the authenticated mobile client and the existing branch-manager endpoint.
class CustodyReceiptAction {
  const CustodyReceiptAction(this._dio);

  final Dio _dio;

  Future<void> confirm(String requestId) async {
    await _dio.post(
      '${ApiEndpoint.baseUrl}custody/requests/${Uri.encodeComponent(requestId)}/confirm-receipt',
    );
  }
}
