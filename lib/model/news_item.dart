class NewsItem {
  String? id;
  String? title;
  String? detail;
  int? date;

  NewsItem({
    this.id,
    this.title,
    this.detail,
    this.date,}
  );

  NewsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['date'] = this.date;
    return data;
  }
}
