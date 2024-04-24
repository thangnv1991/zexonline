part of 'di_graph_setup.dart';

Future<void> _registerCoreModule() async {
  await Firebase.initializeApp();

  // Hive (Key, value)
  await Get.putAsync<AppShared>(() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(UserAdapter());
    final Box box = await Hive.openBox(AppShared.keyBox);
    return AppShared(box);
  });

  // Firebase Auth
  // Get.put(FirebaseAuth.instance);

  // Navigate
  Get.put(NavigatorManager());
}
