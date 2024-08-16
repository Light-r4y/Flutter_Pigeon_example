import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/Aaa_api.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/AaaPluginApi.swift',
  javaOut: 'android/src/main/java/com/fff/aaa/AaaPluginApi.java',
  javaOptions: JavaOptions(package: 'com.fff.aaa'),
))
@HostApi()
abstract class AaaApi {
  @async
  String bbb(String name);
}

@FlutterApi()
abstract class AaaFlutterApi {
  void ccc();
}
