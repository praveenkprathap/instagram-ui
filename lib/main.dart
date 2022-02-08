import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Instagram());
  }
}

class Instagram extends StatefulWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  List<Story> stories = [
    Story("Your Story", "assets/profile1.jpg", isYou: true),
    Story("Pouros", "assets/profile2.jpg"),
    Story("smith_oran", "assets/profile3.jpg"),
    Story("Rex wintheiser", "assets/profile4.jpg"),
    Story("Maxil", "assets/profile5.jpg"),
    Story("smith_oran", "assets/profile3.jpg"),
    Story("Rex wintheiser", "assets/profile4.jpg"),
    Story("Maxil", "assets/profile5.jpg"),
  ];

  List<Feed> feeds = [
    Feed("westley_wintler", "assets/feed1.jpg", "assets/profile1.jpg", 120,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Maxil", "assets/feed2.jpg", "assets/profile2.jpg", 25,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Arun", "assets/feed3.jpg", "assets/profile3.jpg", 2555,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Praveen", "assets/feed4.jpg", "assets/profile4.jpg", 222,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Safdher", "assets/feed5.jpg", "assets/profile5.jpg", 1222,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Albin Paul", "assets/feed6.jpg", "assets/profile1.jpg", 22,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("westley_wintler", "assets/feed1.jpg", "assets/profile1.jpg", 120,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Maxil", "assets/feed2.jpg", "assets/profile2.jpg", 25,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Arun", "assets/feed3.jpg", "assets/profile3.jpg", 2555,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Praveen", "assets/feed4.jpg", "assets/profile4.jpg", 222,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Safdher", "assets/feed5.jpg", "assets/profile5.jpg", 1222,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
    Feed("Albin Paul", "assets/feed6.jpg", "assets/profile1.jpg", 22,
        [Comments("arun", "Hi How are you"), Comments("Febin", "Hi There")]),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70), child: _appBar()),
          body: SingleChildScrollView(
            child: Column(
              children: [_storyWidget(), _feedWidget()],
            ),
          )),
    );
  }

  Widget _appBar() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.camera_alt_outlined),
            Image(
              image: const AssetImage(
                "assets/insta.png",
              ),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const Icon(Icons.send_outlined)
          ],
        ));
  }

  Widget _storyWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Stories",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.play_arrow,
                    size: 18,
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(stories.length,
                      (index) => _singleStoryWidget(stories[index]))),
            ))
      ],
    );
  }

  _singleStoryWidget(Story story) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(4),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              gradient: story.isYou
                  ? null
                  : const LinearGradient(
                      colors: [Color(0xff9b3a9f), Color(0xfff3892a)]),
              shape: BoxShape.circle),
          child: Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(story.imageUrl), fit: BoxFit.cover)),
              child: story.isYou
                  ? Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      ))
                  : null),
        ),
        Container(
          padding: const EdgeInsets.only(left: 13, top: 3),
          child: Text(
            story.name,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  _feedWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              feeds.length, (index) => _singleFeedWidget(feeds[index])),
        ),
      ),
    );
  }
}

Widget _singleFeedWidget(Feed feed) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(4),
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff9b3a9f), Color(0xfff3892a)]),
                    shape: BoxShape.circle),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(feed.profileImage),
                          fit: BoxFit.cover)),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                feed.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.menu),
            )
          ],
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image(
              image: AssetImage(feed.feedImage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              Icon(Icons.circle_outlined),
              Icon(Icons.send_outlined),
              Expanded(
                child: SizedBox(),
              ),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(feed.likes.toString() + " Likes")),
        ),
        Column(
          children: List.generate(feed.comments.length,
              (index) => _commentWidget(feed.comments[index])),
        )
      ],
    ),
  );
}

Widget _commentWidget(Comments comment) {
  return Container(
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Text(comment.name + "  " + comment.commentText));
}

class Story {
  late String name;
  late String imageUrl;
  late bool isYou;

  Story(this.name, this.imageUrl, {this.isYou = false});
}

class Feed {
  late String name;
  late String feedImage;
  late String profileImage;
  late int likes;
  late List<Comments> comments;

  Feed(this.name, this.feedImage, this.profileImage, this.likes, this.comments);
}

class Comments {
  late String name;
  late String commentText;

  Comments(this.name, this.commentText);
}
