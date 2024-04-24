part of 'di_graph_setup.dart';

Future<void> _initializeEnvironment() async {
  await AppApiConfig().init();
}
