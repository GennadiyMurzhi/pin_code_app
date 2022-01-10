import 'package:pin_code_app/domain/pin_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinRepositoryImpl implements PinRepository{
  final SharedPreferences sharedPreferences;

  PinRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> writePin(String enteredPin) {
    try{
      int lastKey = int.parse(sharedPreferences.getKeys().last);

      return sharedPreferences.setString('${++lastKey}', enteredPin);
    } on StateError {
      return sharedPreferences.setString('1', enteredPin);
    }

  }

  @override
  Future<bool> checkPin(String enteredPin) async {
    for(final key in sharedPreferences.getKeys()){
      final pinFromBase = sharedPreferences.get(key);

      if(pinFromBase == enteredPin){
        return true;
      }
    }

    return false;
  }

}