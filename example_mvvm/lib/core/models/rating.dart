class Rating{
  double? rate;
  int? count;

  Rating({required this.rate,required this.count});

  //fromjson -> named constructor
  Rating.fromJson(Map<String,dynamic>json){
    rate = json['rate'].toDouble();
    count = json['count'];
  }

  //tojson -> method  take object and return json
  Map<String,dynamic>toJson(){
    return {
      "rate" : rate,
      "count" : count,
    };
  }
}