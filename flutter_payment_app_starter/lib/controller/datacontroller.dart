import 'package:flutter_payment_app/models/datamodels.dart';
import 'package:flutter_payment_app/services/data_services.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
    @override
  void onInit() {
    _loadData();
    super.onInit();
  }
  RxList<DataModel> list = <DataModel>[].obs;
  var _loading = false.obs;
  final service = new DataServices();



  get loading {
    return _loading.value;
  }

  get newList {
   return list.where((e) => e.status==0?false:true).map((e) => e).toList();
  }

  _loadData() async {
    _loading.value = false;
    try {
      var info = service.getuser();
      list.addAll(await info);
    } catch (e) {
      print("error encountered");
      print(e);
    } finally {
      _loading.value = true;
    }

    // print(apple);
  }
}
