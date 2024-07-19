class JokeModel
{
  String? error;

  String? category;

  String? setup;

  String? delivery;

  JokeModel({
    required this.error,
    required this.category,
    required this.setup,
    required this.delivery,
  });

  JokeModel.fromJson(Map<String, dynamic> json)
  {
    error = json['error'];

    category = json['category'];

    setup = json['setup'];

    delivery = json['delivery'];
  }
}