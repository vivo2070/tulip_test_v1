import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class FacebookPost extends StatefulWidget {
  final String avatarImageUrl;
  final String name;
  final String date;
  final String content;
  final List<String> showcaseImageUrls;
  final int likes;
  final int comments;

  FacebookPost({
    required this.avatarImageUrl,
    required this.name,
    required this.date,
    required this.content,
    required this.showcaseImageUrls,
    required this.likes,
    required this.comments,
  });

  @override
  State<FacebookPost> createState() => _FacebookPostState();
}

late VideoPlayerController _controller;
bool _isPlaying = false;



class _FacebookPostState extends State<FacebookPost> {

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'images/video.mp4',)
      ..initialize().then((_) {
        setState(() {
          _isPlaying = true;
        });
      });


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.bookmark_border, color: Color(0xffA61379)),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [

                        SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Text(
                                  widget.date,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  ' بغداد ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),

                                Icon(Icons.location_on, color: Color(0xffA61379)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10
                          ),
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(widget.avatarImageUrl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              widget.content,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              width: double.infinity,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: widget.showcaseImageUrls.length,
                itemBuilder: (context, index) {
                  final item = widget.showcaseImageUrls[index];
                  bool isImage = item.endsWith('.jpg') || item.endsWith('.jpeg') || item.endsWith('.png');
                  return Stack(
                    children: [
                        Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,

                        ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border, color: Color(0xffA61379)),
                      SizedBox(width: 5.0),
                      Row(
                        children: [
                          Text(widget.likes.toString(),
                              style: TextStyle(color: Color(0xffA61379))),
                          SizedBox(
                            width: 10,
                          ),
                          Text('أعجاب',
                              style: TextStyle(color: Color(0xffA61379))),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.mode_comment_outlined, color: Color(0xffA61379)),
                      SizedBox(width: 5.0),
                      Row(
                        children: [
                          Text(widget.comments.toString(),
                              style: TextStyle(color: Color(0xffA61379))),
                          SizedBox(
                            width: 10,
                          ),
                          Text('تعليقات',
                              style: TextStyle(color: Color(0xffA61379))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 1,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width/2 - 14,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color:  Color(0xffA61379),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.telegram,color: Color(0xffA61379),),
                        SizedBox(width: 8,),
                        Text('مراسلة',style: GoogleFonts.almarai(
                            fontSize: 15
                        ),),

                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 14,

                    alignment: AlignmentDirectional.center,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffA61379),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month,color: Colors.white,),
                        SizedBox(width: 8,),
                        Text('حجز موعد',style: GoogleFonts.almarai(
                            fontSize: 15,
                            color: Colors.white
                        ),),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
