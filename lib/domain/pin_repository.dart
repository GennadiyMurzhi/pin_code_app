abstract class PinRepository {
  Future<void> writePin(String enteredPin);
  Future<bool> checkPin(String enteredPin);
}