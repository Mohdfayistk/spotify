import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:untitled19/Repository/Modelclass/spotify.dart';

import 'Bloc/spotify_bloc.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}


late Spotify data;
late AudioPlayer _audioPlayer;

class _homeState extends State<home> with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<SpotifyBloc>(context).add(FetchSpotify());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: BlocBuilder<SpotifyBloc, SpotifyState>(
          builder: (context, state) {
            if (state is SpotifyLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SpotifyError) {
              return Text('error');
            }
            if (state is SpotifyLoaded) {
              data = BlocProvider
                  .of<SpotifyBloc>(context)
                  .Spotify1;
              return Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),

                  Container(
                    width: 350.w,
                    height: 400.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Image.asset("assets/1.png"),
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    'Hope you have now created a StatefulWidget ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.sp,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  // Slider(
                  //   activeColor: Colors.white,
                  //   inactiveColor: Colors.grey,
                  //   value: _position.inSeconds.toDouble(),
                  //   max: _duration.inSeconds.toDouble(),
                  //   onChanged: (double value) {
                  //     // Add code to track the music duration.
                  //   },
                  // ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.navigate_before,
                        size: 55,
                        color: Colors.white,
                      ),
                      GestureDetector(
                        onTap: () {
                          _audioPlayer = AudioPlayer();
                          _audioPlayer.setUrl(data.results![0].toString());
                          _audioPlayer.play();
                        },
                        child: ClipOval(
                          child: Container(
                            color: Colors.pink[600],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 55,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              );
            }
            else {
              return SizedBox();
            }
          }),
      ),
    );
  }
}
