class BinarySearchTree {
  // Not a balanced tree
  late Node root;

  BinarySearchTree(String data) {
    root = Node(data);
  }

  Node get getRoot => root;

  Node insert(String key) {
    var node = Node(key);
    if (root == null) {
      return root = node;
    }
    Node? prev = null;
    Node? temp = root;
    while (temp != null) {
      if (int.parse(temp.data) > int.parse(key)) {
        prev = temp;
        temp = temp.left;
      } else {
        prev = temp;
        temp = temp.right;
      }
    }
    if (int.parse(prev!.data) > int.parse(key)) {
      prev.left = node;
    } else {
      prev.right = node;
    }
    return prev;
  }

  void sortedData() {
    Node? temp = root;
    var stack = <Node>[];
    while (temp != null || stack.length != 0) {
      if (temp != null) {
        stack.add(temp);
        temp = temp.left;
      } else {
        print(stack.last.data);
        temp = stack.last.right;
        stack.removeAt(stack.length - 1);
      }
    }
  }
}

class Node {
  String data;
  Node? left = null;
  Node? right = null;
  Node(this.data) {}
}
