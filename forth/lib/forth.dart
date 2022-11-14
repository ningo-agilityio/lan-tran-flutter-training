class Forth {
  // Put your code here
  late List<int> stack;

  Forth() {
    this.stack = [];
  }

  void evaluate(String input) {
    input = input.toLowerCase();
    var inputs = input.split(" ");

    for (String i in inputs) {
      if (int.tryParse(i) != null) {
        this.stack.add(int.parse(i));
        continue;
      }
      if ("+-*/".contains(i)) {
        if (this.stack.length < 2) throw Exception("Stack empty");
        if (i == "/" && this.stack[this.stack.length - 1] == 0)
          throw Exception("Division by zero");
        var value = 0;
        switch (i) {
          case "+":
            value = this.stack[this.stack.length - 2] +
                this.stack[this.stack.length - 1];
            break;
          case "-":
            value = this.stack[this.stack.length - 2] -
                this.stack[this.stack.length - 1];
            break;
          case "*":
            value = this.stack[this.stack.length - 2] *
                this.stack[this.stack.length - 1];
            break;
          case "/":
            value = this.stack[this.stack.length - 2] ~/
                this.stack[this.stack.length - 1];
            break;
        }
        this.stack[0] = value;
        this.stack.removeLast();
        continue;
      }
      if (i == "dup") {
        if (this.stack.length == 0) throw Exception("Stack empty");
        this.stack.add(this.stack[this.stack.length - 1]);
        continue;
      }
      if (i == "drop") {
        if (this.stack.length == 0) throw Exception("Stack empty");
        this.stack.removeLast();
        continue;
      }
      if (i == "swap") {
        if (this.stack.length < 2) throw Exception("Stack empty");
        var temp = this.stack[this.stack.length - 2];
        this.stack[this.stack.length - 2] = this.stack[this.stack.length - 1];
        this.stack[this.stack.length - 1] = temp;
        continue;
      }
      if (i == "over") {
        if (this.stack.length < 2) throw Exception("Stack empty");
        this.stack.add(this.stack[this.stack.length - 2]);
        continue;
      }
    }
  }
}
