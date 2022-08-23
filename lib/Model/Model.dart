class NewsModel {
  String? Image;
  String? date;
  String? title;

  NewsModel({this.Image, this.date, this.title});

  factory NewsModel.fromJson(Map<String,dynamic>?json){
    return NewsModel(
      title:json!['articles'][0]['title'] ,
      date: json['articles'][0]['publishedAt'],
      Image: json['articles'][0]['urlToImage"'],
    );
  }
}
