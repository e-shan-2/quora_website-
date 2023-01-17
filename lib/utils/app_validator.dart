import 'package:social_app/utils/app_strings.dart';

// class AppValidator {
//   //Email Validator
//   static String? validateEmail(String? email) {
//     if (email!.isEmpty) {
//       return AppStrings.required;
//     } else if (!RegExp(AppValidationRegexp.emailRegExp)
//         .hasMatch(email.trim())) {
//       return AppStrings.invalidEmail;
//     }
//     return null;
//   }

//   //Name Validator
//   static String? validateName(String? name) {
//     final RegExp nameRegExp = RegExp(AppValidationRegexp.nameRegExp);
//     if (name!.isEmpty) {
//       return AppStrings.required;
//     } else if (name[0] == ' ') {
//       return AppStrings.noSpace;
//     } else if (!nameRegExp.hasMatch(name)) {
//       return AppStrings.invalidName;
//     }
//     return null;
//   }

//   //Password Validator
//   static String? validatePassword(String? password) {
//     if (password!.isEmpty) {
//       return AppStrings.required;
//     } else if (!RegExp(r'.{6,}').hasMatch(password)) {
//       return AppStrings.lengthOfPassword;
//     } else if (!AppValidationRegexp.upperCaseAlphabets.hasMatch(password)) {
//       return AppStrings.uppercasePassword;
//     } else if (!AppValidationRegexp.lowerCaseAlphabets.hasMatch(password)) {
//       return AppStrings.lowercasePassword;
//     } else if (!AppValidationRegexp.noDigits.hasMatch(password)) {
//       return AppStrings.onedigitPassword;
//     } else if (!AppValidationRegexp.punctuation.hasMatch(password)) {
//       return AppStrings.specialCharacterPassword;
//     }
//     return null;
//   }

//   static String? validateGroupName(String? userName) {
//     if (userName == null || userName.isEmpty) {
//       return AppStrings.groupNameCannotEmpty;
//     } else if (userName.length < 2) {
//       return AppStrings.groupNameLength;
//     } else {
//       return null;
//     }
//   }
// }
