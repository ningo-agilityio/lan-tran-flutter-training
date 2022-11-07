class SpaceAge {
  // Put your code here
  double age({required String planet, required int seconds}) {
    double spaceAge = 0;
    switch (planet) {
      case 'Earth':
        spaceAge = (seconds / 31557600);
        break;
      case 'Mercury':
        spaceAge = (seconds / (31557600 * 0.2408467));
        break;
      case 'Venus':
        spaceAge = (seconds / (31557600 * 0.61519726));
        break;
      case 'Mars':
        spaceAge = (seconds / (31557600 * 1.8808158));
        break;
      case 'Jupiter':
        spaceAge = (seconds / (31557600 * 11.862615));
        break;
      case 'Saturn':
        spaceAge = (seconds / (31557600 * 29.447498));
        break;
      case 'Uranus':
        spaceAge = (seconds / (31557600 * 84.016846));
        break;
      case 'Neptune':
        spaceAge = (seconds / (31557600 * 164.79132));
        break;
    }
    var doubleAge = double.parse(spaceAge.toStringAsFixed(2));
    return doubleAge;
  }
}
