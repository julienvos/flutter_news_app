class CommentModel {
  final String userName;
  final String Date;
  final String imageUrl;
  final String commentText;

  CommentModel(
      {required this.userName,
      required this.Date,
      required this.imageUrl,
      required this.commentText});
}

List<CommentModel> commentList = [
  CommentModel(
      userName: "Frits",
      Date: "20 May at 20:30",
      imageUrl:
          'https://images.unsplash.com/photo-1605949405965-d49ada3f9189?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTQzNDU0Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
      commentText:
          'Vestibulum lectus mauris ultrices eros. Nunc scelerisque viverra mauris in aliquam sem fringilla. Molestie at elementum eu facilisis sed odio morbi quis.'),
  CommentModel(
      userName: 'Harry',
      Date: '30 April at 12:30',
      imageUrl:
          'https://images.unsplash.com/photo-1622615875737-0d959726e947?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTIzNzE0MA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
      commentText:
          'Pretium viverra suspendisse potenti nullam ac tortor vitae. At quis risus sed vulputate odio. Est pellentesque elit ullamcorper dignissim. Adipiscing elit ut aliquam purus sit amet luctus venenatis lectus.'),
  CommentModel(
      userName: 'Jackie',
      Date: '20 June at 10:30',
      imageUrl:
          'https://images.unsplash.com/photo-1606143412458-acc5f86de897?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTIzNzIzNA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
      commentText:
          'Vestibulum lectus mauris ultrices eros. Nunc scelerisque viverra mauris in aliquam sem fringilla. Molestie at elementum eu facilisis sed odio morbi quis')
];
