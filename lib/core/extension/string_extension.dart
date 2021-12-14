// burda dil için texti translate cevirmek iiçn her zaman .tr() dememek için yazıyoruz
import 'package:easy_localization/easy_localization.dart';

extension StringLocalizationExtension on String{
  
  String get locale=>this.tr();
}
