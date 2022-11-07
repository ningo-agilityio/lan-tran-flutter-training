class PrimeFactors {
  // Put your code here
  bool isPrime(int number) {
    for (var i = 2; i < number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  List<int> factors(int number) {
    List<int> primeFactors = [];
    if (number == 1) {
      return primeFactors;
    }
    int primeCheck = 2;

    while (number > 1) {
      if (isPrime(primeCheck) && number % primeCheck == 0) {
        primeFactors.add(primeCheck);
        number = number ~/ primeCheck;
      } else {
        primeCheck++;
      }
    }

    return primeFactors;
  }
}
