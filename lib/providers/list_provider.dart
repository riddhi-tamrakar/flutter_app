import 'package:assignmentapp/core/globals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/utils/show_toast_message.dart';
import '../core/utils/strings.dart';
import '../network/ApiClient.dart';
import '../network/DataModels/data_model.dart';
import '../network/dioProvider.dart';

class ListProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  DataModel? dataModel;
  List<DescriptionData> searchdataModel = [];

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getChatUsersList() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      isLoading = true;

      final dio = dioProvider();
      final client = ApiClient(dio, baseUrl: BASE_URL);

      client
          .getData()
          .then((value) => {
                if (value != null)
                  {
                    dataModel = value,
                    isLoading = false,
                    notifyListeners(),
                  }
                else
                  {
                    isLoading = false,
                    showToastMessage(unknownError),
                  }
              })
          .catchError((Object obj) {
        isLoading = false;

        switch (obj.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (obj as DioError).response;
            String message = res!.data?.message;

            showToastMessage(message);
            break;
          default:
            showToastMessage(unknownError);
        }
      });
    } else {
      showToastMessage(noInternet);
    }
  }

  searchByATitle(DataModel data, String titlle) async {
    if (titlle == "") {
      searchdataModel = [];
    } else {
      for (int i = 0; i < data.rows!.length; i++) {
        DescriptionData details = data.rows![i];
        if (details.title != null) {
          if (details.title!.toLowerCase().contains(titlle.toLowerCase())) {
            searchdataModel.add(details);
          }
        }
      }

      notifyListeners();
    }
  }
}
