import 'package:flutter/material.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import 'profile.view.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  void gotoPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((_) => setState(() {}));
  }

  Widget userline(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userPost.userimg),
          radius: 20,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userPost.time),
              const SizedBox(width: 4),
              const Text('·'),
              const SizedBox(width: 4),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: Text(userPost.postcontent)),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );

  Widget buttons(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${userPost.numcomments} Comments',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              '${userPost.numshare} Shares',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isliked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  userPost.isliked = !userPost.isliked;
                });
              },
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {
                gotoPage(
                  context,
                  ProfileView(userPost: userPost, userdata: widget.userdata),
                );
              },
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
      const Divider(color: Colors.grey),
    ],
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      userline(userPost),
      postimage(userPost),
      buttons(userPost),
      const SizedBox(height: 10, child: Divider(color: Colors.grey)),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context) {

    // physics: const NeverScrollableScrollPhysics()` and `shrinkWrap: true`,
    // the post list delegates all scroll gestures to the parent scroll view, allowing smooth
    // scrolling even when the user starts dragging on top of an image or post.
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.userdata.userList.map((userPost) {
        return InkWell(
          onTap: () {
            gotoPage(
              context,
              ProfileView(userPost: userPost, userdata: widget.userdata),
            );
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}
