import 'package:donate/theme/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/project.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key, required this.project}) : super(key: key);
  final Project project;
  static const namedRoute = '/project_screen';

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: _mediaQuery.size.height * 0.3,
      flexibleSpace: Image(
        image: AssetImage(project.imgUrl),
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height * 0.3 + _mediaQuery.padding.top,
        fit: BoxFit.cover,
      ),
      toolbarOpacity: 0.8,
      leading: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.adaptive.arrow_back_outlined,
          size: 36,
          color: GlobalTheme.appBarWhite,
        ),
      ),
      actions: [
        Icon(
          Icons.adaptive.more_outlined,
          size: 36,
          color: GlobalTheme.appBarWhite,
        ),
      ],
    );
    return Scaffold(
      backgroundColor: GlobalTheme.customSurfaceWhite,
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.all(10),
        width: _mediaQuery.size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.01,
            ),
            Text(
              project.association,
              style: const TextStyle(
                color: GlobalTheme.lighterBlue,
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.01,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RatingBar.builder(
                itemSize: 34,
                wrapAlignment: WrapAlignment.end,
                unratedColor: GlobalTheme.grey.withOpacity(0.5),
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.only(right: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearPercentIndicator(
                backgroundColor: GlobalTheme.grey.withOpacity(0.5),
                width: _mediaQuery.size.width * 0.8,
                animation: true,
                lineHeight: _mediaQuery.size.height * 0.03,
                animationDuration: 1000,
                percent: project.reached / project.goal,
                center: Text(
                  (project.reached / project.goal * 100).toStringAsFixed(2) +
                      "%",
                  style: const TextStyle(
                    color: GlobalTheme.darkGrey,
                  ),
                ),
                progressColor: GlobalTheme.lightBlue,
              ),
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.01,
            ),
            Row(
              children: [
                const Text(
                  'Goal: ',
                  style: TextStyle(
                    color: GlobalTheme.grey,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  project.goal.toString() + '\$',
                  style: const TextStyle(
                    color: GlobalTheme.lightBlue,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.03,
            ),
            const Text(
              'Description ',
              style: TextStyle(
                color: GlobalTheme.grey,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.01,
            ),
             Expanded(
               child: SingleChildScrollView(
                 child: Text(
                  project.description,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.overline!.fontSize,
                    color: GlobalTheme.darkGrey.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.left,
            ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}
