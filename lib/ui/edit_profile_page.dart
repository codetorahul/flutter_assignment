import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/app_bar.dart';
import 'package:flutter_projects/ui/common_ui.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: EditProfileToolbar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
        child: Column(
          children: [
            Column(
              children: [
                customTextField(label: "First Name", controller: null),
                customTextField(label: "Last Name", controller: null),
                customTextField(label: "Email ID", controller: null),
              ],
            ),
            commonButton(function: () => {}, label: "Save")
          ],
        ),
      ),
    );
  }

  Widget customTextField({label, isSecureField = false, controller, value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.black),
          ),
          const SizedBox(height: 5),
          TextFormField(
            obscureText: isSecureField,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  )),
              hintText: label,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter $label";
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
