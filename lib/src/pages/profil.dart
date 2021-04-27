import 'package:flutter/material.dart';
import 'package:structurepublic/src/pages/vereible.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


bool showPassword=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkAlert,
     child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: changecolor),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/img/logo.png"),
                      ) ,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Text('Hello Bhupesh!!!'),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                  child: Center(child: Text('Welcome to your Profile, Although, you do not have much to say in your profile apart from your cool image!!!')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
/* padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w500,
                color:darkfont,
                fontFamily: font,),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: changecolor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                            ))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: changecolor,
                          ),
                          color:changecolor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: darkfont,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            buildTextField("Full Name", "Nour Ah", false),
            buildTextField("E-mail", "ahn32857@gmail.com", false),
            buildTextField("Password", "********", true),
            buildTextField("Location", "syria", false),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text("CANCEL",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:darkfont,
                        fontFamily: font,)),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: changecolor,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                     "SAVE",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color:darkfont,
                      fontFamily: font,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: darkfont,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color:changecolor,
              fontFamily: font,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color:darkfont,
              fontFamily: font,
            )),
      ),
    );
  }}*/