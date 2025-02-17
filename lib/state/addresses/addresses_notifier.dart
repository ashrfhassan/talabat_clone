import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talabat_clone/data_layer/address_model/address_entity.dart';
import 'package:talabat_clone/data_layer/address_model/address_repository.dart';
import 'package:talabat_clone/data_layer/address_model/address_service.dart';

part 'addresses_notifier.g.dart';

@riverpod
class AddressesNotifier extends _$AddressesNotifier {
  final addressRepo = AddressRepository(addressService: AddressService());

  @override
  Future<List<AddressEntity>> build() async {
    // The logic we previously had in our FutureProvider is now in the build method.
    return [];
  }

  Future<void> loadAddresses() async {
    try {
      List<AddressEntity> addresses = await addressRepo.getAddresses();
      state = AsyncValue.data(addresses); // Update state
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace); // Handle errors properly
    }
  }
}
