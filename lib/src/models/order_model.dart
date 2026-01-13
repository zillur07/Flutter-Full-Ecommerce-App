class OrderModel {
  final int id;
  final String orderNo;
  final String orderDate;
  final int totalItems;
  final double totalAmount;
  final String status;

  OrderModel({
    required this.id,
    required this.orderNo,
    required this.orderDate,
    required this.totalItems,
    required this.totalAmount,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderNo: json['order_no'],
      orderDate: json['order_date'],
      totalItems: json['total_items'],
      totalAmount: double.parse(json['total_amount']),
      status: json['status'],
    );
  }
}
