import 'package:flutter/cupertino.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext context;
  void setContext(BuildContext context) => this.context = context;
  void init();
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;
}
