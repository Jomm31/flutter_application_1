import 'package:flutter/material.dart';
import '../model/usercomment.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userPost,
    required this.userdata,
  });

  final Userpost userPost;
  final Userdata userdata;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  // Function to add a comment to the post
  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      final newComment = Usercomment(
        commenterImg: widget.userdata.myUserAccount.img,
        commenterName: widget.userdata.myUserAccount.name,
        commentTime: 'Just now',
        commentContent: text,
      );

      widget.userdata.commentList.add(newComment);

      // Increment post comment counter
      final currentCount = int.tryParse(widget.userPost.numcomments) ?? 0;
      widget.userPost.numcomments = (currentCount + 1).toString();

      _commentController.clear();
      FocusScope.of(context).unfocus();
    });
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
                // Focus the comment input box when user taps Comment button
                _commentFocusNode.requestFocus();
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

  Widget commenters(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.thumb_up, size: 16, color: Colors.blue),
            const SizedBox(width: 6),
            Text(
              userPost.numcomments,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Text(
              'All Comments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ],
    ),
  );

  Widget userpostdetails(Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
          radius: 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userComment.commenterName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Text(userComment.commentContent),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    userComment.commentTime,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Reply',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),

      // SOLUTION:
      // 1. Give the outer ListView full scrolling capability.
      // 2. Set `physics: const NeverScrollableScrollPhysics()` and `shrinkWrap: true` on the
      //    inner comment ListView so that drag gestures over the post image, commenters header,
      //    or comment items are seamlessly handled by the parent scroll view without locking up.
      body: ListView(
        children: [
          userline(widget.userPost),
          postimage(widget.userPost),
          buttons(widget.userPost),
          commenters(widget.userPost),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.userdata.commentList
                .map((userComment) => userpostdetails(userComment))
                .toList(),
          ),
          const SizedBox(height: 80), // Padding above bottom comment bar
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.userdata.myUserAccount.img),
                radius: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _commentController,
                  focusNode: _commentFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  onSubmitted: (_) => _addComment(),
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                onPressed: _addComment,
                icon: const Icon(Icons.send, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}