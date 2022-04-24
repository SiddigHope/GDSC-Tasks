import 'Mobile.dart';

void main(List<String> arguments) {
  // the app provides details about smartphones details for buyers

  Mobile samsungA72 = Mobile();
  Mobile samsungNote20 = Mobile();
  Mobile iphone12 = Mobile();
  Mobile huaweiNova = Mobile();

  samsungA72.brand = "Samsung";
  samsungA72.model = "Samsung A72";
  samsungA72.mrp = 10000.0;
  samsungA72.discount = 10.5;

  samsungNote20.brand = "Samsung";
  samsungNote20.model = "Samsung Note 20 extra";
  samsungNote20.mrp = 30000.0;
  samsungNote20.discount = 20.5;

  iphone12.brand = "Apple";
  iphone12.model = "Iphone 12 Pro";
  iphone12.mrp = 15000.0;
  iphone12.discount = 20.0;

  huaweiNova.brand = "Huawei";
  huaweiNova.model = "Huawei Nova 7i";
  huaweiNova.mrp = 8000.0;
  huaweiNova.discount = 5.9;

  huaweiNova.printDetails();
}
