class NewsModel {
  final String title;
  final String newsSource;
  final String category;
  final String imageUrl;

  NewsModel(this.title, this.newsSource, this.category, this.imageUrl);
}

List<NewsModel> newsItems = [
  NewsModel(
      'In iaculis nunc sed augue lacus viverra vitae congue eu. Euismod elementum nisi quis eleifend',
      'Bloomberg',
      'Business',
      'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit'),
  NewsModel(
      'Id interdum velit laoreet id donec ultrices tincidunt. Nullam non nisi',
      'Follow the money',
      'Politics',
      'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit'),
  NewsModel('Elementum facilisis leo vel fringilla est', 'Reuters', 'Trending',
      'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit')
];
