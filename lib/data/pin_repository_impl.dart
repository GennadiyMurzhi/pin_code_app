import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pin_code_app/domain/pin_repository.dart';

class PinRepositoryImpl implements PinRepository{
  @override
  Future<void> writePin(String enteredPin) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    final pinBaseFile = File('$path/pin_base.json');

    print(!pinBaseFile.existsSync());

    if(!pinBaseFile.existsSync()) {
      await pinBaseFile.create();

      final Map<String, String>  pinBase = {
        "1" : enteredPin
      };

      pinBaseFile.writeAsString(jsonEncode(pinBase));
    } else {
      final Map<String, dynamic>  pinBase = json.decode(
          await pinBaseFile.readAsString());

      pinBase[(int.parse(pinBase.keys.last) + 1).toString()] = enteredPin;

      pinBaseFile.writeAsString(jsonEncode(pinBase));
    }

  }

  @override
  Future<bool> checkPin(String enteredPin) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    final pinBaseFile = File('$path/pin_base.json');

    if(pinBaseFile.existsSync()) {
      final Map<String, dynamic> pinBase =
          json.decode(await pinBaseFile.readAsString());

      return pinBase.containsValue(enteredPin);
    } else {
      return false;
    }
  }

}