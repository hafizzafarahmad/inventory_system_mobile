class SendBarangParams {
  final String itemName;
  final int idCategory;
  final int idSize;
  final int idColor;
  final int idVendor;
  final String uom;
  final String purchasePrice;
  final String price;
  final String quantity;
  final String desc;
  final String? image;

  SendBarangParams(
      {required this.itemName, required this.idCategory, required this.idSize, required this.idColor, required this.idVendor,
        required this.uom, required this.purchasePrice, required this.price, required this.quantity, required this.desc, this.image});
}