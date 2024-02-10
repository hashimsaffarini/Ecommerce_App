class CategoriesModel {
  final String category;
  final String title;
  final String imgUrl;

  CategoriesModel({
    required this.category,
    required this.title,
    required this.imgUrl,
  });
}

List<List<CategoriesModel>> dummyCategories = [
  [
    CategoriesModel(
      category: 'Smart Devices',
      title: 'phone',
      imgUrl: 'assets/images/iphone.png',
    ),
    CategoriesModel(
      category: 'Smart Devices',
      title: 'laptop',
      imgUrl: 'assets/images/laptop.png',
    ),
    CategoriesModel(
      category: 'Smart Devices',
      title: 'watch',
      imgUrl: 'assets/images/watch.png',
    ),
    CategoriesModel(
      category: 'Smart Devices',
      title: 'head',
      imgUrl: 'assets/images/airpods.png',
    ),
    CategoriesModel(
      category: 'Smart Devices',
      title: 'ipad',
      imgUrl: 'assets/images/ipad.png',
    ),
  ],
  [
    CategoriesModel(
      category: 'Clothes',
      title: 'Men',
      imgUrl: 'assets/images/men.png',
    ),
    CategoriesModel(
      category: 'Clothes',
      title: 'Women',
      imgUrl: 'assets/images/woman.png',
    ),
    CategoriesModel(
      category: 'Clothes',
      title: 'Kids',
      imgUrl: 'assets/images/boy.png',
    ),
    CategoriesModel(
      category: 'Clothes',
      title: 'Shortes',
      imgUrl: 'assets/images/short.png',
    ),
  ],
];
