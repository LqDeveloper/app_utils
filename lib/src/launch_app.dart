import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'logger_utils.dart';

class LaunchApp {
  static launch(void body()) {
    runZonedGuarded(() {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails details) {
        handleError('Flutter 导致的错误', details.exception, details.stack);
        if (kReleaseMode) {
          exit(0);
        }
      };
      body();
    }, (error, stack) {
      handleError('未被 Flutter 捕获的错误', error, stack);
    });
  }

  static void handleError(String message, Object error, StackTrace? stack) {
    LoggerUtils.e(message, error, stack);
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        color: Colors.green,
        child: Text(
          'message:$message exception:${details.exception} stack:${details.stack}',
          style: TextStyle(color: Colors.red),
        ),
      );
    };
  }
}
