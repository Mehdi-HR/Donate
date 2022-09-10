import 'package:donate/dummy_data.dart';
import 'package:donate/theme/global_theme.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../models/project.dart';
import '../../screens/project_screen.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard(this.project);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProjectScreen(project: project),
            ),
          ),
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: GlobalTheme.appBarWhite,
          ),
          height: _mediaQuery.size.height * 0.4,
          child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image(
                    image: AssetImage(project.imgUrl),
                    width: _mediaQuery.size.width * 0.9,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.02,
                  ),
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.left,
                  ),
            /*SizedBox(
                  height: _mediaQuery.size.height * 0.02,
                ),*/
            Text(
              project.association,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    project.description,
                    style: Theme.of(context).textTheme.overline,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CircularProgressIndicator.adaptive(
                  value: project.reached / project.goal,
                  backgroundColor: GlobalTheme.customSurfaceWhite,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      GlobalTheme.lightBlue),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
