String reverse(String originalString) {
  // Replace the throw call and put your code here
  List<String> charList = originalString.split('');
  String reverseString = charList.reversed.join();
  return reverseString;
}
