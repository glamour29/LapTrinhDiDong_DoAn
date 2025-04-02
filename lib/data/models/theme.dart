class Theme {
  final int id;
  final String asset;

  Theme({required this.id, required this.asset});

 static List<Theme> get list => [
        Theme(id: 0, asset: 'assets/themes/0.jpg'),
        ///Theme(id: 1, asset: 'assets/themes/1.jpg'),
        Theme(id: 2, asset: 'assets/themes/2.jpg'),
        ///Theme(id: 3, asset: 'assets/themes/3.jpg'),
      ];
}
