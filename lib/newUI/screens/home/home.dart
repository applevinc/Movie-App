import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/newUI/screens/home/components/movieContainer.dart';
import 'package:movie_app/ui/pages/bottomNavBar/components/seachBar.dart';

class NewHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTopRatedSearchAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewArrivalsHeaderText(),
            MovieContainer(),
            SizedBox(height: 20),
            MovieContainer(),
          ],
        ),
      ),
    );
  }

  PreferredSize _buildTopRatedSearchAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: HomeSearchAppBar(title: 'MOVIES'),
    );
  }
}

class NewArrivalsHeaderText extends StatelessWidget {
  const NewArrivalsHeaderText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Text(
        'New Arrivals',
        style: GoogleFonts.montserrat(
          color: Color(0xffC1C1C6),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
