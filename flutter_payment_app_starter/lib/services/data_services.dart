import 'dart:convert';
import 'package:flutter_payment_app/models/datamodels.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class DataServices {
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<DataModel>> getuser() async {
    var apiUrl = '/billinfo';

    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        // print(jsonDecode(await response.body));
        List<dynamic> list = await json.decode(response.body);
        return list.map((e) => new DataModel.fromjson(e)).toList();
      } else {
        print("something went wrong");
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      print("some error occured");
      return <DataModel>[];
    }

    // var info = rootBundle.loadString("json/data.json");

    // List<dynamic> list = json.decode(await info);
    // // print(list);

    // return Future.delayed(
    //     Duration(seconds: 1), () => list.map((e) => e).toList());
  }
}
