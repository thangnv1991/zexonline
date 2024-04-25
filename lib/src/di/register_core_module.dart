part of 'di_graph_setup.dart';

Future<void> _registerCoreModule() async {
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey:'AIzaSyASYpwjAofWOhikidn6_Zx1oScjDazX47s',
      appId:'1:798819860794:android:b9b088db41732460a19003',messagingSenderId:'798819860794',projectId:'zexmanga'));

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
