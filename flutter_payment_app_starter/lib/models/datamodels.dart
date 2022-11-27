class DataModel {
  String brand_name;
  String brand_logo;
  int status;
  String due_info;
  String due;
  int id;
  DataModel(
      {
        required this.id,
        required this.brand_logo,
      required this.brand_name,
      required this.due,
      required this.due_info,
      required this.status});
  factory DataModel.fromjson(Map<String, dynamic> json) => DataModel(
      brand_logo:
          json["brand_logo"] == null ? "images/lines.png" : json["brand_logo"],
      brand_name: json["brand_name"],
      due: json["due"].toString(),
      due_info: json["due_info"],
      status: json["status"], id: json['brand_id']);
}
