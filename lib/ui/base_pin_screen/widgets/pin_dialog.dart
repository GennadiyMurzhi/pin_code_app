import 'package:flutter/material.dart';

class PinDialog extends StatelessWidget{
  final String message;

  const PinDialog(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final insetPadding = MediaQuery.of(context).size.width / 100 * 17.36;
    final textTopPadding = MediaQuery.of(context).size.width / 100 * 5.68;
    final horizontalTextPadding = MediaQuery.of(context).size.width / 100 * 8.68;
    final optionHeight = MediaQuery.of(context).size.width / 100 * 10.5;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: insetPadding),
      //contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: ListBody(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(horizontalTextPadding, textTopPadding,
                horizontalTextPadding, textTopPadding),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, optionHeight/2, 0, optionHeight/2),
              child: const Center(
                child: Text(
                    'OK',
                    style: TextStyle(color: Colors.blue, fontSize: 14)
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

}