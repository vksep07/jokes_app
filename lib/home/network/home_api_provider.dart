



import 'package:jokes_app/utils/common/network/endpoints.dart';
import 'package:jokes_app/utils/common/network/model/response_api.dart';
import 'package:jokes_app/utils/common/network/service/api_service.dart';
import 'package:jokes_app/utils/common/network/service/http_service.dart';
import 'package:jokes_app/utils/common/network/service/status.dart';

class HomeApiProvider {
  Future<ResponseApi> jokesApi() async {
    return await apiService.getRequest(
      headers: httpService.getHeader(),
      url: Endpoints.jokesApiUrl,
      apiType: ApiStatus.JOKES_API,
    );
  }
}
