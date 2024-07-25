class ApiResponse {
  final bool success;
  final dynamic response;
  final int status_code;
  final String message;

  ApiResponse({
    required this.success,
    required this.response,
    required this.status_code,
    this.message = '',
  });
}
/*// Successful response
var successResponse = ApiResponse(ok: true, response: 'Data fetched successfully');
// Failed response
var failureResponse = ApiResponse(ok: false, response: null, message: 'Failed to fetch data');
*/