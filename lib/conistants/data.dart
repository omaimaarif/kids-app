class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: "Hi, I'm Pippa!",
    image: 'lib/assets/woolly-panda-1.png',
    discription:
    " I'm here to help you breeze through the activities\n we'll explore together",
  ),
  UnbordingContent(
    title: "And I'm Polar",
    image: 'lib/assets/woolly-at-the-sea.png',
    discription: "and this is my friend with me",
  ),
  UnbordingContent(
    title: 'Welcome to our midst! ',
    image: 'lib/assets/woolly-pearl.png',
    discription:
    "Let's get started, and you'll discover my mission here",
  ),
];