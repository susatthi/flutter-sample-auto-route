import 'package:roggle/roggle.dart';
import 'package:universal_platform/universal_platform.dart';

final logger = Roggle(
  printer: SinglePrettyPrinter(
    loggerName: '[APP]',
    // error 以上のときはスタックトレースを出力する
    stackTraceLevel: Level.error,
    // iOS はカラー非対応
    colors: !UniversalPlatform.isIOS,
    // ログが長くなるので非表示
    printCaller: false,
  ),
);
