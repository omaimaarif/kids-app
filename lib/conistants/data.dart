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
    " Let's scroll across to meet our other friends",
  ),
  UnbordingContent(
    title: "And I'm Polar",
    image: 'lib/assets/woolly-at-the-sea.png',
    discription: "I have a boat full of colorful ideas",
  ),
  UnbordingContent(
    title: 'Finally, here you are! ',
    image: 'lib/assets/woolly-pearl.png',
    discription:
    "I'm Max, let's start our adventure together",
  ),
];