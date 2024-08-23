// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../constant/imageCOnstant.dart';

void CustomAlert(
    BuildContext context, String title, String message, Function() function) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        // shape: const RoundedRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 32,
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: function,
                            child: Container(
                              // width: 228,
                              height: 45,
                              width: 100,
                              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: _decoration(),
                              child: Center(
                                child: Text(
                                  title == 'Block' ? 'Yes' : "DELETE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFE8E7E9),
                                    fontSize: 16,
                                    fontFamily: 'Nunito',
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              // width: 228,
                              height: 45,
                              width: 100,
                              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: _decoration(),
                              child: Center(
                                child: Text(
                                  title == 'Block' ? 'No' : "CANCEL",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFE8E7E9),
                                    fontSize: 16,
                                    fontFamily: 'Nunito',
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    },
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: const Duration(milliseconds: 500),
  );
}

logOutAlert(BuildContext context, Function() function, bool isDeleted) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(),
      title: Text(
        (isDeleted) ? "Delete Account " : "Logout",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: (isDeleted)
          ? Text("Are you sure you want to Delete Account?")
          : Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: function,
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          child: const Text("Yes"),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            child: const Text("No")),
      ],
    ),
  );
}

deleteAlert(BuildContext context, Function() function) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(),
      title: const Text(
        "Delete List?",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text("Are you sure you want to delete this list?"),
      actions: [
        TextButton(
          onPressed: function,
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          child: const Text("Yes"),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            child: const Text("No")),
      ],
    ),
  );
}

Decoration _decoration() {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage(ImageConstant.logo), fit: BoxFit.cover),
  );
}
