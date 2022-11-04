DateTime add(final DateTime birthDate) {
  // Replace the throw call and put your code here
  DateTime expectedDate = birthDate.add(Duration(seconds: 1000000000));
  return expectedDate;
}
