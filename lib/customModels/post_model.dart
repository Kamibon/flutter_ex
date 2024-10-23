class Post {
    final int id;
    final String title;
    final double price;
    final String description;
    final String image;
    final Object category;
    

  const Post({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    required this.image,
    required this.category
   


  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
       
        'id': int id,
        'price': double price,
        'description': String description,
        'title': String title,
        'image': String image,
        'category': Object category
        
      } =>
        Post(
          id:id,
         price: price,
         description: description,
         title: title,
        image: image,
        category: category
        

        ),
      _ => throw const FormatException('Failed to load post.'),
    };
  }
}