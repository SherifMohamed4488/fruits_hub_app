class BottomNavigationBarEntity{
  BottomNavigationBarEntity({required this.activeImage ,
    required this.inActiveImage , required this.name });
  String activeImage , inActiveImage , name ;
}


List<BottomNavigationBarEntity>get  bottomNavigationBarItems => [




  BottomNavigationBarEntity(activeImage: "assets/images/active _home_icon.svg", inActiveImage: "assets/images/in_active_home.svg", name: "الرئيسية"),
  BottomNavigationBarEntity(activeImage: "assets/images/active_products_icon.svg", inActiveImage: "assets/images/in_active_products_icon.svg", name: "المنتجات"),
  BottomNavigationBarEntity(activeImage: "assets/images/active_cart_icon.svg", inActiveImage: "assets/images/in_active_cart_icon.svg", name: "سلة التسوق"),
  BottomNavigationBarEntity(activeImage: "assets/images/active_user_icon.svg", inActiveImage: "assets/images/in_active_user.svg", name: "حسابي"),

];


