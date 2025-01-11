class FoodModel {
  int id = 0;
  String title = "no title";
  String img = "no image";
  double price = 0;
  double rate = 0;
  String shop = "no shop";

  FoodModel(
      {this.id = 0,
      this.title = "no title",
      this.img = "no image",
      this.price = 0,
      this.rate = 0,
      this.shop = "no shop"});
}

List<FoodModel> foodModelList = [
  FoodModel(
    id: 1,
    title: "ឆាឡូកឡាក់សាច់គោ",
    img: "https://cambodiatravel.com/images/2020/10/Beef-Lok-Lak-cambodia.jpg",
    price: 4,
    rate: 4.2,
    shop: "ហាងព្រែកលាប",
  ),
  FoodModel(
    id: 1,
    title: "នំបញ្ចុកសម្លរខ្មែរ",
    img:
        "https://ct-blog-assets.camboticket.com/wp-content/uploads/2023/06/08164008/62361700_1042275959296150_7188721955724328960_n-1.jpg",
    price: 3.5,
    rate: 3.7,
    shop: "ហាងខ្មែរ",
  ),
  FoodModel(
    id: 1,
    title:
        "មាន់ដុតកូកា",
    img: "https://t4.ftcdn.net/jpg/09/19/33/35/360_F_919333503_LmwsNq8v4IisCBpaGIuBMDvGyhqcoNMw.jpg",
    price: 7.5,
    rate: 4.7,
    shop: "ហាងមាន់ស្រែ",
  ),
];
