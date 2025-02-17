import 'package:talabat_clone/data_layer/address_model/address_entity.dart';

class AddressService {
  Future<List<Map<String, dynamic>>> getAddressesApi() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      {
        "id": 1,
        "location": "صيدليه د/رشا",
        "full_address": "المقطم - بلوك 11- تقسيم الزهور - الدور الثانى - بجوار الصيدليه الحمرا",
        "isPrimary": true,
      },
      {
        "id": 2,
        "location": "مينى ماركتت الزهور",
        "full_address": "المقطم - بلوك 11- تقسيم الزهور - الدور الثانى - بجوار الصيدليه الحمرا",
        "isPrimary": false,
      },
    ];
  }
}
