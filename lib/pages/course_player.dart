import 'package:ed_tech/components/course.dart';
import 'package:ed_tech/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoursePlayerPage extends StatefulWidget {
  final Course course;

  const CoursePlayerPage({Key? key, required this.course}) : super(key: key);

  @override
  State<CoursePlayerPage> createState() => _CoursePlayerPageState();
}

class _CoursePlayerPageState extends State<CoursePlayerPage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  @override
  void initState() {
    super.initState();

    // Initialize the controller with the provided YouTube video URL
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.course.youtubeVideoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  // Function to show the claim certificate dialog
  Future<void> _showClaimCertificateDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Claim your certificate'),
          content: Text(
              'Do you want to claim the certificate for ${widget.course.title}?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Claim'),
              onPressed: () {
                // Navigate to the dashboard page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Course Player - ${widget.course.title}'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Course player for ${widget.course.description}'),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: () {},
              onEnded: (YoutubeMetaData metaData) {
                _showClaimCertificateDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
