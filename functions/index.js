const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

// Function to write to the 'notifications' collection
function writeToNotifications(data) {
  // Add a document with the provided data to the 'notifications' collection
  return admin.firestore().collection("notifications").add(data);
}

exports.notifyUsersSermon = functions.firestore.document("/sermons/{id}")
    .onCreate((snap, context) => {
      const data = snap.data();
      const title = data["title"];

      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "New sermon",
          body: `Exciting news! A new sermon, ${title} is now available.`,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        return writeToNotifications({
          title: "New sermon",
          body: `Exciting news! A new sermon, ${title} is now available.`,
          type: 3,
          linkId: context.resource.name,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });

exports.notifyUsersAnnouncements = functions.firestore
    .document("/announcements/{id}")
    .onCreate((snap, context) => {
      const data = snap.data();
      const notifyContent = `
${data["title"]}

${data["body"]}
      `;

      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "Announcement alert",
          body: notifyContent,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        return writeToNotifications({
          title: "Announcement alert",
          body: notifyContent,
          type: 0,
          linkId: context.resource.name,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });

exports.notifyUsersbibleStudy = functions.firestore
    .document("/bible-study/{id}")
    .onCreate((snap, context) => {
      const data = snap.data();
      const title = data["title"];
      const content = `Exciting news! A new bible study, 
${title} is now available.`;

      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "New bible study",
          body: content,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        return writeToNotifications({
          title: "New bible study",
          body: content,
          type: 3,
          linkId: context.resource.name,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });

exports.notifyUsersPrayersForWeek = functions.firestore
    .document("/prayers-for-week/{id}")
    .onCreate((snap, context) => {
      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "Prayer for the week",
          body: `Start your week with a moment of reflection and prayer. 
Our weekly prayer is now available, offering guidance and 
inspiration for the days ahead. Take a moment to connect with your 
faith and find strength in prayer.
          `,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        const dateTime = admin.firestore.FieldValue.serverTimestamp();
        return writeToNotifications({
          title: "Prayer for the week",
          body: `As we embark on a new week, Come before God 
with hearts full of gratitude.`,
          type: 2,
          linkId: context.resource.name,
          timestamp: dateTime,
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });

exports.notifyUsersVerseOfWeek = functions.firestore
    .document("/verse-of-the-week/{id}")
    .onCreate((snap, context) => {
      const data = snap.data();
      const body = data["body"];
      const verse = data["verse"];
      const notifyContent = `
Start your week with inspiration!

${body} - ${verse}
      `;

      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "Verse for the week",
          body: notifyContent,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        const dateTime = admin.firestore.FieldValue.serverTimestamp();
        return writeToNotifications({
          title: "Verse for the week",
          body: notifyContent,
          type: 1,
          linkId: context.resource.name,
          timestamp: dateTime,
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });

exports.notifyUsersExhortation = functions.firestore
    .document("/weekly-exhortation/{id}")
    .onCreate((snap, context) => {
      const data = snap.data();
      const title = data["title"];
      const reference = data["reference"];
      const notifyContent = `
Get ready for an uplifting message!

${title} - ${reference}
      `;

      return admin.messaging().sendToTopic("Church", {
        notification: {
          title: "Exhortation for this week",
          body: notifyContent,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      }).then((value) => {
        const dateTime = admin.firestore.FieldValue.serverTimestamp();
        return writeToNotifications({
          title: "Exhortation for the week",
          body: notifyContent,
          type: 3,
          linkId: context.resource.name,
          timestamp: dateTime,
        });
      }).catch((error) => {
        console.error("Error sending notification:", error);
        throw new Error("Error sending notification");
      });
    });
