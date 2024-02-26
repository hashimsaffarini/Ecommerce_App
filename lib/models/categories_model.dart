// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoriesModel {
  final String id;
  final String category;
  final String title;
  final String imgUrl;

  CategoriesModel({
    required this.id,
    required this.category,
    required this.title,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'title': title,
      'imgUrl': imgUrl,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CategoriesModel(
      id: documentId,
      category: map['category'] as String,
      title: map['title'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }
}

List<List<CategoriesModel>> dummyCategories = [
  [
    CategoriesModel(
      id: 'hygMnHYwb00uCNgLM80V',
      category: 'Smart Devices',
      title: 'phone',
      imgUrl: 'assets/images/phone.png',
    ),
    CategoriesModel(
      id: 'q4Ijotxt6scg8XRLtQoz',
      category: 'Smart Devices',
      title: 'laptop',
      imgUrl: 'assets/images/laptop.png',
    ),
    CategoriesModel(
      id: 'F9EJPNUsoMCP4pcDVDxE',
      category: 'Smart Devices',
      title: 'watch',
      imgUrl: 'assets/images/watch.png',
    ),
    CategoriesModel(
      id: 'eiXDqAMC3Ah8Jc2lcE2k',
      category: 'Smart Devices',
      title: 'head',
      imgUrl: 'assets/images/airpods.png',
    ),
    CategoriesModel(
      id: 'uUCHoRNpwm09kYUyzmmp',
      category: 'Smart Devices',
      title: 'ipad',
      imgUrl: 'assets/images/ipad.png',
    ),
  ],
  [
    CategoriesModel(
      id: '141Naagf8iSCfQyLKGp3',
      category: 'Clothes',
      title: 'Men',
      imgUrl: 'assets/images/men.png',
    ),
    CategoriesModel(
      id: 'HppX4aHOWcVT5epYjS44',
      category: 'Clothes',
      title: 'Women',
      imgUrl: 'assets/images/woman.png',
    ),
    CategoriesModel(
      id: 'UvVBie8Z1TdeBIUKxEHY',
      category: 'Clothes',
      title: 'Kids',
      imgUrl: 'assets/images/boy.png',
    ),
    CategoriesModel(
      id: 'f0gP1OecSzZxCJbtuDHs',
      category: 'Clothes',
      title: 'Shortes',
      imgUrl: 'assets/images/short.png',
    ),
  ],
];
