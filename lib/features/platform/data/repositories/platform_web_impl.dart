import 'package:core_module/features/platform/domain/repositories/platform_interface.dart';
import 'dart:html' as html;
import 'package:flutter_web_plugins/url_strategy.dart';

class PlatformCoreWebRepository implements PlatformCoreInterface{
  @override
  void startNativeMethods() {
    setUrlStrategy(null);
    html.window.onBeforeUnload.listen((event) {
      if (event is html.BeforeUnloadEvent) {
        event.returnValue = '¿Deseas salir de TrainUp?';
      }
    });
  }

}
