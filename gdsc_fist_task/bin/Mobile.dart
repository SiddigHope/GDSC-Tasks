import 'dart:ffi';

class Mobile {
  String _brand = "";
  String _model = "";
  double _mrp = 0.0;
  double _discount = 0.0;

// using the default constructor, no need to create one

  get brand => this._brand;

  set brand(value) => this._brand = value;

  get model => this._model;

  set model(value) => this._model = value;

  get mrp => this._mrp;

  set mrp(value) => this._mrp = value;

  get discount => this._discount;

  set discount(value) => this._discount = value;

  double getActualPrice() {
    var discount = (this.mrp * this.discount) / 100;
    var price = this.mrp - discount;
    return price;
  }

  void printDetails() {
    double after_discount = this.getActualPrice();
    print("mobile brand is : ${this.brand} \n"
        "mobile model is : ${this.model} \n"
        "mobile price is : ${this.mrp} \n"
        "mobile discount value : ${this.discount} \n"
        "mobile price after discount : ${after_discount} \n");
  }
}
