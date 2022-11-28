class Pizza {
  int id = 0;
  String pizzaName = '';
  String description = '';
  double price = 0.0;
  String imageUrl = '';

  Pizza();

  static Pizza? fromJsonOrNull(Map<String, dynamic> json) {
    Pizza pizza = Pizza();
    pizza.id =
        ((json['id'] != null) ? int.tryParse(json['id'].toString()) : 0)!;
    pizza.pizzaName =
        (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';
    pizza.description =
        (json['description'] != null) ? json['description'].toString() : '';
    pizza.price = (json['price'] != null &&
            double.tryParse(json['price'].toString()) != null)
        ? json['price']
        : 0.0;
    pizza.imageUrl =
        (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';
    if (pizza.id == 0 || pizza.pizzaName.trim() == '') {
      return null;
    }
    return pizza;
  }

  Pizza.fromJson(Map<String, dynamic> json) {
    this.id = ((json['id'] != null) ? int.tryParse(json['id'].toString()) : 0)!;
    this.pizzaName =
        (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';
    this.description =
        (json['description'] != null) ? json['description'].toString() : '';
    this.price = (json['price'] != null &&
            double.tryParse(json['price'].toString()) != null)
        ? json['price']
        : 0.0;
    this.imageUrl =
        (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
