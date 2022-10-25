void main(List<String> args) {

  var months = <String>[]; // create an empty string list

  // add 12 months name to list 'months'
  months.add("January");
  months.add("February");
  months.add("March");
  months.add("April");
  months.add("May");
  months.add("June");
  months.add("July");
  months.add("August");
  months.add("September");
  months.add("October");
  months.add("November");
  months.add("December");

  // immutable
  const months1 = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  final months2 = List.unmodifiable(months);

  // collection for
  var upperMonths =[for (var month in months) month.toUpperCase(),];

  print(months);
  print(months1);
  print(months2);
  print(upperMonths);
  
  // Maps
  final informations = {
    'name': 'Lan Tran',
    'profession': 'student',
    'country': 'Vietnam',
    'city': 'Danang',
  }; // create a map

  print(informations);

  informations['country'] = "Canada"; // update 'country'
  informations['city'] = "Toronto"; // update 'city'

  // Iterate over the map and print all values
  informations.forEach((key, value) => print(value));

  final scores = [89, 77, 46, 93, 82, 67, 32, 88];

  scores.sort();
  print("Highest: ${scores.last}, Lowest: ${scores.first}");

  final gradeB = scores
    .where((score) => score > 80 && score < 90);
  print(gradeB);
}
