import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'lib/assets/person1.jpg',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach!',
      postimg: 'lib/assets/post1.png',
      numcomments: '24',
      numshare: '5',
      isliked: false,
    ),
    Userpost(
      userimg: 'lib/assets/person2.png',
      username: 'Jane Smith',
      time: '3 hrs ago',
      postcontent: 'Loving the new cafe in town.',
      postimg: 'lib/assets/post2.jpg',
      numcomments: '18',
      numshare: '3',
      isliked: true,
    ),
    Userpost(
      userimg: 'lib/assets/person3.jpg',
      username: 'Mike Johnson',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      postimg: 'lib/assets/post3.jpg',
      numcomments: '30',
      numshare: '7',
      isliked: false,
    ),
    Userpost(
      userimg: 'lib/assets/person4.jpg',
      username: 'Johnson Stewart',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      postimg: 'lib/assets/post4.png',
      numcomments: '30',
      numshare: '2',
      isliked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'lib/assets/avatar1.jpg', name: 'Alice'),
    Friend(img: 'lib/assets/avatar2.jpg', name: 'Bob'),
    Friend(img: 'lib/assets/avatar3.jpg', name: 'Charlie'),
    Friend(img: 'lib/assets/avatar4.jpg', name: 'Diana'),
    Friend(img: 'lib/assets/person5.jpg', name: 'Ethan'),
    Friend(img: 'lib/assets/person6.png', name: 'Fiona'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'lib/assets/person2.png',
      commenterName: 'Jane Smith',
      commentTime: '1 hr ago',
      commentContent: 'Looks fun!',
    ),
    Usercomment(
      commenterImg: 'lib/assets/person3.jpg',
      commenterName: 'Mike Johnson',
      commentTime: '30 mins ago',
      commentContent: 'Wish I was there!',
    ),
    Usercomment(
      commenterImg: 'lib/assets/avatar1.jpg',
      commenterName: 'Emily Davis',
      commentTime: '15 mins ago',
      commentContent: 'Great photo!',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Joemire Dave Loremas',
    email: 'ljoemiredave@gmail.com',
    img: 'lib/assets/another_male.jpg',
    numFollowers: '1 Million',
    numPosts: '350',
    numFollowing: '500',
    numFriends: '400',
  );
}
