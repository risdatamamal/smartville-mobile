import 'package:flutter/material.dart';

import '../network/remote_data_source.dart';
import '../model/news_response.dart';

class NewsProvider extends ChangeNotifier {
  Future<List<Datum>> listNews() async {
    return await RemoteDataSource.newsList();
  }
}
