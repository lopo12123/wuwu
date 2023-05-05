import 'package:logger/logger.dart';

/// 仅在debug模式下打印
abstract class SafePrint {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 2,
      printTime: true,
    ),
  );

  static void debug(Object? o) {
    _logger.d(o);
  }

  static void info(Object? o) {
    _logger.i(o);
  }

  static void warn(Object? o) {
    _logger.w(o);
  }

  static void error(Object? o) {
    _logger.e(o);
  }
}
