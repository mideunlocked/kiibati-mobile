import 'dart:convert';

import 'package:http/http.dart' as http;

class BibleStudy {
  final String chapter;
  final String bookName;
  final String version;
  final String by;
  final String audioLink;

  const BibleStudy({
    required this.by,
    required this.chapter,
    required this.version,
    required this.bookName,
    required this.audioLink,
  });

  Future<List<Verse>> getBibleChapter() async {
    try {
      String url =
          "https://bible-memory-verse-flashcard.p.rapidapi.com/get_chapter";

      Map<String, String> queryParams = {
        "book_name": bookName,
        "chapter": chapter,
      };

      Map<String, String> headers = {
        "X-RapidAPI-Key": "1242167271msh5587935b53f1569p1ba5eajsnb08f573056e9",
        "X-RapidAPI-Host": "bible-memory-verse-flashcard.p.rapidapi.com",
      };

      Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

      // Make the HTTP GET request
      final response = await http.get(
        uri,
        headers: headers,
      );

      // Check the status code of the response
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> chapters = data["chapter"] as List<dynamic>;
        return chapters.map((e) {
          String number = e["verse_num"].toString();
          String text = e["verse_text"].toString();
          String verseText = text.split("$chapter:$number")[1];

          return Verse(
            text: verseText,
            number: number,
          );
        }).toList();
      } else {
        // print('Error: ${response.statusCode}');
        // print('Error Message: ${response.body}');
        return const [Verse(text: "null", number: "0")];
      }
    } catch (e) {
      // print("error getting bible verse from api: $e");
      return Future.error("Get bible chapter error: $e");
    }
  }
}

class Verse {
  final String number;
  final String text;

  const Verse({
    required this.text,
    required this.number,
  });
}
