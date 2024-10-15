import 'package:boss/locales/en_US/en_US_translation.dart';
import 'package:get/get.dart';

abstract class AppLocales {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
  };
}

// class AppTranslation extends Translations {
// //   static Map<String, Map<String, String>>
// //    translations =
// // {
// //     'pt_BR' : ptBR,
// //     'en_US' : enUs,
// //     'es_mx' : esMx
// // };

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'pt_BR': ptBR,
//         'en_US': enUs,
//         'es_mx': esMx,
//       };

//   // @override
//   // Map<String, Map<String, String>> get keys => {
//   //       'en_US': {
//   //         'GetX': 'GetX',
//   //         'oi': 'Hello',
//   //       },
//   //       'es_MX': {
//   //         'GetX': 'obtener',
//   //         'oi': 'Holla',
//   //       }
//   //     };
// }