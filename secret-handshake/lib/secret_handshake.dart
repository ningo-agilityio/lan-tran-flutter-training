class SecretHandshake {
  // Put your code here
  List<String> commands(int decimal) {
    if (decimal == 0) {
      return [];
    }
    String binary = decimal.toRadixString(2);
    List<String> secretHandshake = [
      'wink',
      'double blink',
      'close your eyes',
      'jump',
      'Reverse the order of the operations in the secret handshake.'
    ];

    List<String> binaryString = binary.split('');
    while (binaryString.length < 5) {
      binaryString.insert(0, '0');
    }
    List<String> commands = [];
    for (int i = 1; i < binaryString.length; i++) {
      if (binaryString[i] == '1') {
        commands.insert(0, secretHandshake[4 - i]);
      }
    }
    List<String> commandsList = List.from(commands);
    while (decimal > 16) {
      commandsList = List.from(commandsList.reversed);
      decimal -= 16;
      if (decimal == 0) {
        return [];
      }
    }
    return commandsList;
  }
}
