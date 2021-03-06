class Bill {
  final String id;
  final String name;
  final String description;
  final double balance;
  final int dueDate;
  final int notifyBefore;

  static final columns = ["id", "name", "description", "balance", "dueDate", "notifyBefore"];
  Bill(this.id, this.name, this.description, this.balance, this.dueDate, this.notifyBefore);
  factory Bill.fromMap(Map<String, dynamic> json) {
    return Bill(
      json['id'].toString(),
      json['name'],
      json['description'],
      json['balance'],
      json['dueDate'],
      json['notifyBefore'],
    );
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "balance": balance,
    "dueDate": dueDate,
    "notifyBefore": notifyBefore
  };

}

