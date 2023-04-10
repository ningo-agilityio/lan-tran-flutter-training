// import 'package:flutter/material.dart';
// import 'package:salon_appointment/widgets/date_picker.dart';
// import 'package:salon_appointment/widgets/dropdown.dart';
// import 'package:salon_appointment/widgets/input.dart';
// import 'package:salon_appointment/widgets/time_picker.dart';

// import '../theme/theme.dart';
// import 'common/buttons.dart';

// class ModalBottomSheet extends StatelessWidget {
//   ModalBottomSheet({super.key});

//   final nameController = TextEditingController();
//   final descpController = TextEditingController();

//   final nameFocusNode = FocusNode();
//   final descpFocusNode = FocusNode();

//   final inputColor = themeData.colorScheme.onSecondaryContainer;

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.8,
//       minChildSize: 0.4,
//       maxChildSize: 0.9,
//       builder: (context, controller) => SingleChildScrollView(
//         controller: controller,
//         child: Container(
//           height: _viewHeight(context),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: themeData.colorScheme.background,
//             borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),
//           ),
//           child: Center(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Add an appointment',
//                       style: themeData.textTheme.titleLarge,
//                     ),
//                     SAButton.icon(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: const Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Input(
//                   controller: nameController,
//                   text: 'Customer Name',
//                   focusNode: nameFocusNode,
//                   onEditCompleted: () {
//                     FocusScope.of(context).nextFocus();
//                   },
//                   color: inputColor,
//                 ),
//                 const SizedBox(height: 12),
//                 DatePicker(dateTime: DateTime.now()),
//                 const SizedBox(height: 12),
//                 TimePicker(startTime: TimeOfDay.now()),
//                 const SizedBox(height: 12),
//                 const DropDown(items: ['Back', 'Neck & Shoulders']),
//                 const SizedBox(height: 12),
//                 Input(
//                   controller: descpController,
//                   text: 'Description',
//                   focusNode: descpFocusNode,
//                   onEditCompleted: () {
//                     FocusScope.of(context).unfocus();
//                   },
//                   color: inputColor,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void show(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ModalBottomSheet(),
//     );
//   }

//   static double _viewHeight(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
//     return (keyboardHeight > 0)
//         ? screenHeight * 0.9 - keyboardHeight
//         : screenHeight * 0.9;
//   }
// }
