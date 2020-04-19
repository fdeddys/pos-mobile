

class Customer {

    int id;
    String name;
    String email;
    String phoneNumb;
    String fb;
    int status;
    int manualCustomer;
    int manualRestoId;
    String tableCode;
    String address;

    Customer(this.id, this.name, this.email, this.phoneNumb, this.fb, this.status, this.manualCustomer, this.manualRestoId, this.tableCode, this.address);

    @override
    List<Object> get props => [id, name, email, phoneNumb, fb, status, manualCustomer, manualRestoId, tableCode, address];

    Customer.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    name = jsonMap['name'],
    email = jsonMap['email'],
    phoneNumb = jsonMap['phoneNumb'],
    fb = jsonMap['fb'],
    status = jsonMap['status'],
    manualCustomer = jsonMap['manual_customer'],
    manualRestoId = jsonMap['manual_resto_id'],
    tableCode = jsonMap['table_code'],
    address = jsonMap['address'];
   
}