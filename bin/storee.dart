import 'dart:io';

void main() {
  List<Product> products = [];

  while (true) {
    printMenu();
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        addProduct(products);
        break;
      case 2:
        showProducts(products);
        break;
      case 3:
        deleteProduct(products);
        break;
      case 4:
        editProduct(products);
        break;
      case 5:
        showLowStockProducts(products);
        break;
      case 6:
        print('برنامه با موفقیت متوقف شد.');
        exit(0);
        break;
      default:
        print('گزینه نامعتبر.');
    }
  }
}

class Product {
  String name;
  int price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$name - قیمت: $price تومان - تعداد: $quantity';
  }
}

void addProduct(List<Product> products) {
  print('نام محصول را وارد کنید (0 - انصراف):');
  String name = stdin.readLineSync()!;
  if (name == '0') return;
  print('قیمت محصول را وارد کنید (0 - انصراف):');
  int price = int.parse(stdin.readLineSync()!);
  if (price == 0) return;
  print('تعداد محصول را وارد کنید (0 - انصراف):');
  int quantity = int.parse(stdin.readLineSync()!);
  if (quantity == 0) return;
  products.add(Product(name, price, quantity));
  print('محصول با موفقیت ثبت شد.');
}

void showProducts(List<Product> products) {
  for (int i = 0; i < products.length; i++) {
    print('${i + 1} - ${products[i]}');
  }
}

void deleteProduct(List<Product> products) {
  showProducts(products);
  print('شماره محصول مورد نظر برای حذف را وارد کنید (0 - انصراف):');
  int index = int.parse(stdin.readLineSync()!);
  if (index == 0) return;
  products.removeAt(index - 1);
  print('محصول با موفقیت حذف شد.');
}

void editProduct(List<Product> products) {
  showProducts(products);
  print('شماره محصول مورد نظر برای ویرایش را وارد کنید (0 - انصراف):');
  int index = int.parse(stdin.readLineSync()!);
  if (index == 0) return;
  Product product = products[index - 1];
  print('نام جدید محصول را وارد کنید (0 - انصراف):');
  String name = stdin.readLineSync()!;
  if (name != '0') product.name = name;
  print('قیمت جدید محصول را وارد کنید (0 - انصراف):');
  int price = int.parse(stdin.readLineSync()!);
  if (price != 0) product.price = price;
  print('تعداد جدید محصول را وارد کنید (0 - انصراف):');
  int quantity = int.parse(stdin.readLineSync()!);
  if (quantity != 0) product.quantity = quantity;
  print('محصول با موفقیت ویرایش شد.');
}

void showLowStockProducts(List<Product> products) {
  for (Product product in products) {
    if (product.quantity < 5) {
      print('${product.name} - قیمت: ${product.price} تومان - تعداد: ${product.quantity}');
    }
  }
}

void printMenu() {
  print('--- منوی برنامه ---');
  print('1. ثبت محصول');
  print('2. نمایش فهرست محصولات');
  print('3. حذف محصول');
  print('4. ویرایش محصول');
  print('5. نمایش محصولات رو به اتمام');
  print('6. خروج');
}
