class BasketProduct {
  int count = 1;
  String imgUri;
  int price;
  String title;

  BasketProduct(this.title, this.price, this.imgUri){}

  void decreaseCount() {
    count--;
  }
  void increaseCount() {
    count++;
  }
}