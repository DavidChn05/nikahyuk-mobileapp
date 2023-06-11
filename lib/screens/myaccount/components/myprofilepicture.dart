import 'package:flutter/material.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';
import 'package:nikahyuk/screens/providers/getAvatar.dart';

class MyProfilePicture extends StatefulWidget {
  const MyProfilePicture({
    super.key,
  });

  @override
  State<MyProfilePicture> createState() => _MyProfilePictureState();
}

class _MyProfilePictureState extends State<MyProfilePicture> {
  GetAvatar dataResponse = GetAvatar(createdAt: '', job: '', name: '');
  GetAvatarGet dataGet = GetAvatarGet(
      avatar: 'https://reqres.in/img/faces/1-image.jpg',
      id: '1',
      email: 'george.bluth@reqres.in',
      fullname: 'George Bluth');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                (dataGet.avatar == "")
                    ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                    : dataGet.avatar,
                scale: 1.0,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              child: SizedBox(
                height: 40,
                width: 40,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.white),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFF5F6F9))),
                  onPressed: () {
                    Navigator.pushNamed(context, HomePageScreen.routeName);
                  },
                  child: Image.asset("assets/icons/camera.png"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
