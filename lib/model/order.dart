
import 'package:pos_cahier/model/customer.dart';

class Order {

    int id;
    String orderNo;
    int tableId;
    String orderDate;
    int restoId;
    int total;
    int status;
    String isPaid;
    String isPaidDesc;
    String isComplete;
    String isCompleteDesc;
    int customerId;
    Customer customer;
    String notes;
    int disc;
    String voucherCode;
    int subTotal;
    int tax;
    int serviceCharge;
    int grandTotal;

    Order(this.id, this.orderNo, this.tableId, this.orderDate, this.restoId, this.total, this.status,
        this.isPaid, this.isPaidDesc, this.isComplete, this.isCompleteDesc, this.customerId, this.notes,
        this.disc, this.voucherCode, this.subTotal, this.tax, this.serviceCharge, this.grandTotal);

    @override
    List<Object> get props => [id, orderNo, tableId, orderDate, restoId, total, status, isPaid];

    Order.fromJson(Map jsonMap)
        : id = jsonMap['id'],
        orderNo = jsonMap['orderNo'],
        tableId = jsonMap['tableId'],
        orderDate = jsonMap['orderDate'],
        restoId = jsonMap['restoId'],
        total = jsonMap['total'],
        status = jsonMap['status'],
        isPaid = jsonMap['isPaid'],
        isPaidDesc = jsonMap['isPaidDesc'],
        isComplete = jsonMap['isComplete'],
        isCompleteDesc = jsonMap['isCompleteDesc'],
        customerId = jsonMap['customerId'],
        customer = Customer.fromJson(jsonMap['customer']),
        notes= jsonMap['notes'],
        disc = jsonMap['disc'],
        voucherCode= jsonMap['voucherCode'],
        subTotal= jsonMap['subTotal'],
        tax = jsonMap['tax'],
        serviceCharge = jsonMap['serviceCharge'],
        grandTotal = jsonMap['grandTotal'];

}