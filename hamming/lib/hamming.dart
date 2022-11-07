class Hamming {
  String get mustEqual => 'strands must be of equal length';
  // Put your code here
  int distance(String strand1, String strand2) {
    if (strand1 == '' && strand2 == '') {
      return 0;
    }

    int distance = 0;
    List<String> strandList1 = strand1.split('');
    List<String> strandList2 = strand2.split('');
    bool equal = strand1.length == strand2.length;

    if (equal) {
      for (var i = 0; i < strandList1.length; i++) {
        if (strandList1[i] != strandList2[i]) {
          distance += 1;
        }
      }
      return distance;
    } else {
      throw new ArgumentError(mustEqual);
    }
  }
}
