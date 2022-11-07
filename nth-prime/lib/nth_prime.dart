class NthPrime {
  // Put your code here
  int prime(int number) {
    if (number == 0) {
      throw new ArgumentError('There is no zeroth prime');
    }
    List<int> prime = [];
    int checkNumber = 2;
    while (prime.length < number) {
      if (isPrime(checkNumber)) {
        prime.add(checkNumber);
      }
      checkNumber++;
    }
    return prime.last;
  }

  bool isPrime(int number) {
    for (var i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}
