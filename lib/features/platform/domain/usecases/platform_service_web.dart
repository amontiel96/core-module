import 'package:core_module/features/platform/data/repositories/platform_web_impl.dart';

class PlatformCoreService
{
  final PlatformCoreWebRepository _repository = PlatformCoreWebRepository();
  void initMethods(){
    _repository.startNativeMethods();
  }
}
