import 'package:flutter/material.dart';

typedef CloseDialog = void Function();

CloseDialog showLoadingDialog({required BuildContext context}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: Colors.black54,
            ),
          ));
  return () => Navigator.of(context).pop();
}
