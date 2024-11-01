import 'package:duzo/palette.dart';
import 'package:duzo/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        body: Column(
          children: [
            Container(
              height: height*0.2,
              decoration: BoxDecoration(
                color: CustomPalette.lightYellow,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              child: Row(
                children: [
                  Text("data"),
                  Text(
                    FirebaseAuth.instance.currentUser!.email!.toString(),
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                opt(context, "DUZO Card"),
                opt(context, "Slot History"),
                opt(context, "Order History"),
                opt(context, "FAQ"),
                opt(context, "Insurance Card"),
                opt(context, "Change App Language"),
                opt(context, "Cash Balance"),
                opt(context, "About"),
                _logout(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return TextButton(
      onPressed: () async {
        await AuthService().signout(context: context);
      }, 
      child: Text("Log Out", style: TextStyle(color: Colors.red, fontSize: height*0.04 ),)
    );
  }

  Widget opt(BuildContext context, String data) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(top: height*0.008),
      child: SizedBox(
        width: width*0.95,
        height: height*0.06,
        child: FilledButton(
          onPressed: (){}, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data, style: TextStyle(fontSize: height*0.03, color: Colors.black),),
              Icon(Icons.chevron_right_rounded, size: height*0.05, color: Colors.black)
            ],
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(CustomPalette.brightOrange),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )
            )
          )
        ),
      ),
    );
  }
}
