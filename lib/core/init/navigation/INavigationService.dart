// ignore_for_file: file_names

abstract class INavigationService{
 
 Future<void> navigatorToPage({String? path,Object? data});
 Future<void> navigatorToPageClear({String? path,Object? data});

}