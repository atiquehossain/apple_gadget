import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/ApiConstants.dart';

class GetOpenTradesController extends GetxController {
  var getOpenTradesInfo = <dynamic>[].obs;
  final _client = GetConnect();
  var base_url = ApiConstants.baseUrl;
  var isPasswordVisible = true.obs;
  var endpoint = "GetOpenTrades";
  var error = ''.obs;

  final getStorage = GetStorage();

  int? loginAsInt;
  String? requiresAuthToken;

  var totalProfit = RxDouble(0.0);

  @override
  void onInit() {
    super.onInit();
    requiresAuthToken = getStorage.read('requiresAuthToken');
    fetchgetOpenTradesInformation();
  }

  Future<void> fetchgetOpenTradesInformation() async {
    final requestBody = '{"login": 2088888, "token": "${requiresAuthToken}"}';

    try {
      final response = await _client.post(base_url + endpoint, requestBody);

      print("Response StatusCode: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        getOpenTradesInfo.value = response.body;
        calculateTotalProfit(); // Calculate total profit after updating data
        print("Response Body: ${response.body}");
      } else {
        throw Exception("Failed to load getOpenTrades information");
      }
    } catch (e) {
      // Log any exceptions
      error.value = 'Failed to connect to the server';
      print("Exception: $e");
    }
  }

  void calculateTotalProfit() {
    totalProfit.value = 0.0;

    for (var trade in getOpenTradesInfo) {
      totalProfit.value += double.parse(trade['profit'].toString());
    }
  }
}
