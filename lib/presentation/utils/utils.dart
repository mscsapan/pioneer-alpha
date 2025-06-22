// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text.dart';
import 'constraints.dart';

class Utils {
  static final _selectedDate = DateTime.now();

  static final _initialTime = TimeOfDay.now();


  static String convertToSlug(String input) {
    return input.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z\d]+'), '-');
  }

  static Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;

  static List<TextInputFormatter> inputFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}$'))
  ];

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }



  // static Future<String?> pickSingleImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     return image.path;
  //   }
  //   return null;
  // }
  //
  // static Future<List<String?>> pickMultipleImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final List<String> imageList = [];
  //   final List<XFile?> images = await picker.pickMultiImage();
  //   if (images.isNotEmpty) {
  //     for (var i in images) {
  //       imageList.add(i!.path.toString());
  //     }
  //     debugPrint('picked images: ${imageList.length}');
  //     return imageList;
  //   }
  //   return [];
  // }
  //
  // static Future<String?> pickSingleFile([bool isResume = false]) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: isResume == true
  //         ? ['mp4', 'mpeg4', 'flv', 'wmv', 'avi']
  //         : ['jpg', 'jpeg', 'png', 'gif'],
  //   );
  //   if (result != null &&
  //       result.files.single.path != null &&
  //       result.files.single.path!.isNotEmpty) {
  //     File file = File(result.files.single.path!);
  //     debugPrint('file-path ${file.path}');
  //     return file.path;
  //   } else {
  //     debugPrint('file path not found');
  //     return '';
  //   }
  // }

  // static Future<List<String>> pickMultipleFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['mp4', 'jpg', 'jpeg', 'zip', 'pdf', 'png'],
  //       allowMultiple: true);
  //   final List<String> fileList = [];
  //   if (result != null && result.files.isNotEmpty) {
  //     for (var file in result.files) {
  //       if (file.path != null && file.path!.isNotEmpty) {
  //         fileList.add(file.path!);
  //       }
  //     }
  //   }
  //   debugPrint('pickMultipleFile $fileList');
  //   return fileList;
  // }

  static String timeWithData(String data, [bool timeAndDate = true]) {
    if (timeAndDate) {
      DateTime dateTime = DateTime.parse(data);
      String formattedDate = DateFormat('MM-dd-yyyy HH:mm').format(dateTime);
      return formattedDate;
    } else {
      DateTime dateTime = DateTime.parse(data);
      String formattedDate = DateFormat('MMM d, yyyy').format(dateTime);
      return formattedDate;
    }
  }

  static String formatDate(var date) {
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }

    // return DateFormat.MMMEd().format(_dateTime.toLocal());
    return DateFormat.yMMMMd().format(dateTime.toLocal());
  }

  static String timeAgo(var date) {
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.now();
    } else {
      dateTime = date;
    }

    // return DateFormat.MMMEd().format(_dateTime.toLocal());
    return DateFormat.jm().format(dateTime);
  }

  static String priceSeparator(int value, {String locale = 'en_US', String symbol = '', int radix = 0}) {
    try {
      final formatter = NumberFormat.currency(
        locale: locale,
        symbol: symbol,
        decimalDigits: radix,
      );
      return formatter.format(value);
    } catch (e) {
      return value.toStringAsFixed(radix);
    }
  }



  static String convertToAgo(String? time) {
    Duration diff = DateTime.now().difference(DateTime.parse(time!));
    try {
      if (diff.inDays >= 1) {
        return '${diff.inDays} days ago';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hours ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minutes ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} seconds ago';
      } else {
        return 'Just Now';
      }
    } catch (e) {
      return '';
    }
  }

  static Widget verticalSpace(double size) {
    return SizedBox(height: size.h);
  }

  static Widget horizontalSpace(double size) {
    return SizedBox(width: size.w);
  }

  static double hSize(double size) {
    return size.w;
  }

  static double vSize(double size) {
    return size.h;
  }

  static EdgeInsets symmetric({double h = 20.0, v = 0.0}) {
    return EdgeInsets.symmetric(
        horizontal: Utils.hPadding(size: h), vertical: Utils.vPadding(size: v));
  }

  static double radius(double radius) {
    return radius.sp;
  }

  static BorderRadius borderRadius({double r = 10.0}) {
    return BorderRadius.circular(Utils.radius(r));
  }

  static EdgeInsets all({double value = 0.0}) {
    return EdgeInsets.all(value.dm);
  }

  static EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
        left: left.w, top: top.h, right: right.w, bottom: bottom.h);
  }

  static double vPadding({double size = 20.0}) {
    return size.h;
  }

  static double hPadding({double size = 20.0}) {
    return size.w;
  }

  static double toDouble(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static double toInt(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2050),
      );

  static Future<TimeOfDay?> selectTime(BuildContext context) =>
      showTimePicker(context: context, initialTime: _initialTime);

  static void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static loadingDialog(
    BuildContext context, {
    bool barrierDismissible = false,
  }) {
    //closeDialog(context);
    showCustomDialog(
      context,
      child: Container(
        height: Utils.vSize(120.0),
        padding: Utils.all(value: 20.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: primaryColor),
              Utils.horizontalSpace(15.0),
              const CustomText(text: 'Please wait a moment')
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static bool _isDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  static void closeDialog(BuildContext context) {
    if (_isDialogShowing(context)) {
      Navigator.of(context).pop(true);
    }
  }

  static Future showCustomDialog(
    BuildContext context, {
    Widget? child,
    bool barrierDismissible = false,
    Color bgColor = whiteColor,
    EdgeInsets? padding,
    double? radius,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        final p = padding ?? Utils.symmetric();
        final r = radius ?? 6.0;
        return Dialog(
          backgroundColor: bgColor,
          insetPadding: p,
          shape: RoundedRectangleBorder(
            borderRadius: Utils.borderRadius(r: Utils.radius(r)),
          ),
          child: child,
        );
      },
    );
  }

  static void errorSnackBar(BuildContext context, String errorMsg,[int duration = 1500]) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: duration),
          content: CustomText(text:errorMsg,color: redColor),
        ),
      );
  }

  static void showSnackBar(BuildContext context, String msg,
      [Color textColor = whiteColor, int time = 1000]) {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: time),
      content: CustomText(text:msg,color: textColor),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void serviceUnAvailable(BuildContext context, String msg,
      [Color textColor = Colors.white]) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 500),
        content: Text(msg, style: TextStyle(color: textColor)));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}
