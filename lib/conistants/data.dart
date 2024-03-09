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
    image: 'lib/assets/for_activity/robot (1).png',
    discription:
    " Let's scroll across to meet my friends",
  ),
  UnbordingContent(
    title: "And I'm Polar",
    image: 'lib/assets/woolly-at-the-sea.png',
    discription: "let's start our adventure together",
  ),
  // UnbordingContent(
  //   title: 'Finally, here you are! ',
  //   image: 'lib/assets/for_activity/penguin (1).png',
  //   discription:
  //   "I'm Max, let's start our adventure together",
  // ),
];