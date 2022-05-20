class SubjectCategory {
  final String title;
  final bool checked;

  SubjectCategory({required this.title, required this.checked});
}

List<SubjectCategory> subjects = [
  SubjectCategory(title: 'For You', checked: true),
  SubjectCategory(title: 'Trending', checked: false),
  SubjectCategory(title: 'Latest', checked: true),
  SubjectCategory(title: 'Global', checked: false),
  SubjectCategory(title: 'Popular', checked: false),
  SubjectCategory(title: 'Business', checked: false),
  SubjectCategory(title: 'Technology', checked: true),
  SubjectCategory(title: 'Technology', checked: true),
  SubjectCategory(title: 'Technology', checked: true)
];
