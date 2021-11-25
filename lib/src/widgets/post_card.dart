import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard({
    Key? key,
    required this.withImage,
    required this.isMine,
  }) : super(key: key);
  final bool withImage;
  final bool isMine;
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 15.0),
      decoration: _cardDecoration(),
      child: _PostContent(
        purple: purple,
        withImage: widget.withImage,
        isMine: widget.isMine,
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 0),
          blurRadius: 20.0,
        ),
      ],
    );
  }
}

class _PostContent extends StatefulWidget {
  const _PostContent({
    Key? key,
    required this.purple,
    required this.withImage,
    required this.isMine,
  }) : super(key: key);

  final Color purple;
  final bool withImage;
  final bool isMine;

  @override
  State<_PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<_PostContent> {
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  bool isLoved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15.0, top: 20.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/img/friend.jpg'),
                radius: 25.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Hailee Steinfeld',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Arial',
                    color: widget.purple,
                  ),
                ),
              ),
              if (widget.isMine) Spacer(),
              if (widget.isMine)
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: pink,
                  ),
                )
            ],
          ),
        ),
        if (widget.withImage)
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: const Image(
              image: AssetImage('assets/img/post.jpg'),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(
            top: 25.0,
            right: 15.0,
            left: 15.0,
            bottom: 10.0,
          ),
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quam nulla, viverra consequat urna semper, tincidunt pharetra ligula. Vivamus quis nisi lorem. Phasellus vitae rhoncus nulla. Fusce in orci enim. Mauris mattis semper finibus. Fusce vitae felis eget enim pulvinar feugiat. Quisque rhoncus varius nisi auctor porttitor. Aenean eu lorem at sapien fringilla pulvinar. Proin ut faucibus sapien. Nulla viverra nunc eget rutrum ultricies. Curabitur elementum sem a elit scelerisque, lacinia imperdiet lorem pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam eget tortor ornare dolor aliquam iaculis sed pretium leo. Ut euismod, justo a imperdiet lobortis, quam nisl blandit diam, vitae efficitur urna ex vel ante. Vivamus nisl nibh, interdum eget felis ut, mattis imperdiet ante. Sed et ex viverra, lobortis mauris quis, dignissim est.',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15.0,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(pink.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                child: Text(
                  'Comentar',
                  style: TextStyle(
                    color: pink,
                    fontSize: 17.0,
                    fontFamily: 'ArialRoundedMTBold',
                  ),
                ),
                onPressed: () {},
              ),
              Container(
                decoration: BoxDecoration(
                  color: isLoved ? pink : null,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: pink,
                    width: 1.5,
                  ),
                ),
                child: IconButton(
                  iconSize: 25.0,
                  icon: Icon(
                    Icons.favorite_border,
                    color: isLoved ? Colors.white : pink,
                  ),
                  onPressed: () {
                    setState(() {
                      isLoved = !isLoved;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
