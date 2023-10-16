import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/bible_study.dart';
import '../church_today_widgets/bible_study_widget.dart';
import '../general-widgets/custom_progress_indicator.dart';
import 'bible_verse_widget.dart';
import 'bible_version_widget.dart';

class BibleStudyBody extends StatelessWidget {
  const BibleStudyBody({
    super.key,
    required this.widget,
  });

  final BibleStudySheet widget;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      child: ShaderMask(
        shaderCallback: (rect) {
          // adds a linear gradient to the image (makes the bottom shaded)
          return const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, 12.h));
        },
        blendMode: BlendMode.dstIn,
        child: SizedBox(
          height: 100.h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Audio guide",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.bibleStudy.by,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.bibleStudy.bookName} ${widget.bibleStudy.chapter}",
                      style: titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    BibleVersionWidget(
                      version: widget.bibleStudy.version,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                FutureBuilder<List<Verse>>(
                    future: widget.bibleStudy.getBibleChapter(),
                    builder: (context, snapshot) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: snapshot.data
                                ?.map(
                                  (e) => BibleVerseWidget(
                                    verse: e,
                                  ),
                                )
                                .toList() ??
                            [
                              SizedBox(
                                height: 50.h,
                                child: const Center(
                                  child: CustomProgressIndicator(),
                                ),
                              ),
                            ],
                      );
                    }),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
