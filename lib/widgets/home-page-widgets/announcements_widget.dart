import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'announcement_container.dart';

class AnnouncemenstsWidget extends StatelessWidget {
  const AnnouncemenstsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            SizedBox(
              width: 4.w,
            ),
            const AnnoucementContainer(
              title: "Power Service",
              subtitle:
                  "Experience the enriching journey of exploring the Scriptures together. Join us for an engaging and enlightening Bible study session where we delve deeper into God's Word, uncovering its timeless wisdom and applying it to our lives.",
              timeDate: "Sunday, 9:00 am",
            ),
            const AnnoucementContainer(
              title: "Bible study",
              subtitle:
                  "Experience the enriching journey of exploring the Scriptures together. Join us for an engaging and enlightening Bible study session where we delve deeper into God's Word.",
              timeDate: "Monday, 6:30 pm",
            ),
            const AnnoucementContainer(
              title: "My case is urgent service (Tetesetemi)",
              subtitle:
                  "Experience the power of prayer and divine intervention at our weekly 'My Case Is Urgent' service. Join us as we come together in fervent supplication, seeking God's immediate guidance, healing, and breakthrough in every urgent situation. Trust in His faithfulness and witness the miraculous unfold as we unite in prayer.",
              timeDate: "Wednesday, 7:00 am",
            ),
            const AnnoucementContainer(
              title: "Night of God's throne",
              subtitle:
                  "Prepare to encounter the majesty and presence of God during our Night Vigil: Night of God's Throne. Join us for a night of worship, prayer, and seeking God's face as we gather in anticipation of divine encounters, spiritual breakthroughs, and transformative experiences in the presence of His glorious throne.",
              timeDate: "Quartely last friday of the month, 11pm",
            ),
          ],
        ),
      ),
    );
  }
}
