import 'package:talabat_clone/data_layer/address_model/address_entity.dart';
import 'package:talabat_clone/data_layer/address_model/address_service.dart';

class AddressRepository {
  AddressRepository({
    required this.addressService,
  });

  final AddressService addressService;

  Future<List<AddressEntity>> getAddresses() async {
    try {
      List<Map<String, dynamic>> result = await addressService.getAddressesApi();
      List<AddressEntity> addresses = result
          .map((map) => AddressEntity(
                id: map['id'],
                location: map['location'],
                full_address: map['full_address'],
                isPrimary: map['isPrimary'],
              ))
          .toList();
      return addresses;
    } catch (error) {
      throw Exception("can't call api");
    }
  }
}
