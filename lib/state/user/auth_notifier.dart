import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<dynamic> build() async {
    // The logic we previously had in our FutureProvider is now in the build method.
    return {'test': 'ahmed'};
  }

  Future<void> updateAuth() async {
    state = AsyncValue.loading(); // Set state to loading
    await Future.delayed(Duration(seconds: 2));
    state = AsyncValue.data({'test': 'updated'}); // Update state
  }
}
