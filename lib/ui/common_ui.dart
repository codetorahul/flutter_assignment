import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonButton({
  required Function function,
  required String label,
  double borderRadiusAll = 10.0,
}) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      ),
      onPressed: () {
        function.call();
      },
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
