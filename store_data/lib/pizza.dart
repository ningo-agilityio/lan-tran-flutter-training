class Pizza {
  static const keyId = 'id';
  static const keyName = 'pizzaName';
  static const keyDescription = 'description';
  static const keyPrice = 'price';
  static const keyImage = 'imageUrl';

  int id = 0;
  String pizzaName = '';
  String description = '';
  double price = 0.0;
  String imageUrl = '';

  Pizza();

  // static Pizza? fromJsonOrNull(Map<String, dynamic> json) {
  //   Pizza pizza = Pizza();
  //   pizza.id =
  //       ((json['id'] != null) ? int.tryParse(json['id'].toString()) : 0)!;
  //   pizza.pizzaName =
  //       (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';
  //   pizza.description =
  //       (json['description'] != null) ? json['description'].toString() : '';
  //   pizza.price = (json['price'] != null &&
  //           double.tryParse(json['price'].toString()) != null)
  //       ? json['price']
  //       : 0.0;
  //   pizza.imageUrl =
  //       (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';
  //   if (pizza.id == 0 || pizza.pizzaName.trim() == '') {
  //     return null;
  //   }
  //   return pizza;
  // }

  static Pizza? fromJsonOrNull(Map<String, dynamic> json) {
    Pizza pizza = Pizza();
    pizza.id =
        ((json[keyId] != null) ? int.tryParse(json[keyId].toString()) : 0)!;
    pizza.pizzaName = (json[keyName] != null) ? json[keyName].toString() : '';
    pizza.description =
        (json[keyDescription] != null) ? json[keyDescription].toString() : '';
    pizza.price = (json[keyPrice] != null &&
            double.tryParse(json[keyPrice].toString()) != null)
        ? json[keyPrice]
        : 0.0;
    pizza.imageUrl = (json[keyImage] != null) ? json[keyImage].toString() : '';
    if (pizza.id == 0 || pizza.pizzaName.trim() == '') {
      return null;
    }
    return pizza;
  }

  // Pizza.fromJson(Map<String, dynamic> json) {
  //   this.id = ((json['id'] != null) ? int.tryParse(json['id'].toString()) : 0)!;
  //   this.pizzaName =
  //       (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';
  //   this.description =
  //       (json['description'] != null) ? json['description'].toString() : '';
  //   this.price = (json['price'] != null &&
  //           double.tryParse(json['price'].toString()) != null)
  //       ? json['price']
  //       : 0.0;
  //   this.imageUrl =
  //       (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';
  // }

  Pizza.fromJson(Map<String, dynamic> json) {
    this.id =
        ((json[keyId] != null) ? int.tryParse(json['id'].toString()) : 0)!;
    this.pizzaName = (json[keyName] != null) ? json[keyName].toString() : '';
    this.description =
        (json[keyDescription] != null) ? json[keyDescription].toString() : '';
    this.price = (json[keyPrice] != null &&
            double.tryParse(json[keyPrice].toString()) != null)
        ? json[keyPrice]
        : 0.0;
    this.imageUrl = (json[keyImage] != null) ? json[keyImage].toString() : '';
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'pizzaName': pizzaName,
  //     'description': description,
  //     'price': price,
  //     'imageUrl': imageUrl,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
