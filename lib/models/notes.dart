

import 'package:hive_flutter/adapters.dart';
part 'notes.g.dart';

@HiveType(typeId:1)
class Note{
  @HiveField(0)
  String id = DateTime.now().toString();

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  DateTime editedTime;

  @HiveField(4)
  String username;

  Note({required this.title, required this.content, required this.editedTime,required this.username});
}


// @HiveType(typeId: 1)
// class StudentModel{
//   @HiveField(0)
//   int? id;
//   @HiveField(1)
//   final String name;
//   @HiveField(2)
//   final String age;

//   StudentModel({required this.name, required this.age,this.id});

// }




// List<Note> notes = [
//     // Note(id: 1, title: 'Meeting Notes', content: 'Discuss project milestones.', editedTime: DateTime(2022, 1, 1)),
//     // Note(id: 2, title: 'Grocery List', content: 'Milk, eggs, bread, vegetables.', editedTime: DateTime(2022, 1, 2)),
//     // Note(id: 3, title: 'Book Recommendations', content: 'Read "The Alchemist".', editedTime: DateTime(2022, 1, 3)),
//     // Note(id: 4, title: 'Fitness Goals', content: 'Plan workout routine.', editedTime: DateTime(2022, 1, 4)),
//     // Note(id: 5, title: 'Travel Itinerary', content: 'Plan trip to the mountains.', editedTime: DateTime(2022, 1, 5)),
//     // Note(id: 6, title: 'Recipe Ideas', content: 'Try new pasta recipe.', editedTime: DateTime(2022, 1, 6)),
//     // Note(id: 7, title: 'Coding Tasks', content: 'Finish feature implementation.', editedTime: DateTime(2022, 1, 7)),
//     // Note(id: 8, title: 'Movie Watchlist', content: 'Watch "Inception" and "The Matrix".', editedTime: DateTime(2022, 1, 8)),
//     // Note(id: 9, title: 'Home Improvement', content: 'Buy paint for the living room.', editedTime: DateTime(2022, 1, 9)),
//     // Note(id: 10, title: 'Project Ideas', content: 'Brainstorm new app ideas.', editedTime: DateTime(2022, 1, 10)),
//     // Note(id: 11, title: 'Language Learning', content: 'Practice Spanish vocabulary.', editedTime: DateTime(2022, 1, 11)),
//     // Note(id: 12, title: 'Tech News', content: 'Read latest tech articles.', editedTime: DateTime(2022, 1, 12)),
//     // Note(id: 13, title: 'Gift Ideas', content: 'Find birthday gift for a friend.', editedTime: DateTime(2022, 1, 13)),
//     // Note(id: 14, title: 'Podcast Recommendations', content: 'Listen to new podcast episodes.', editedTime: DateTime(2022, 1, 14)),
//     // Note(id: 15, title: 'Job Search', content: 'Update resume and apply to new positions.', editedTime: DateTime(2022, 1, 15)),
//     // Note(id: 16, title: 'Gardening Plans', content: 'Plant flowers in the backyard.', editedTime: DateTime(2022, 1, 16)),
//     // Note(id: 17, title: 'Financial Goals', content: 'Create budget for the month.', editedTime: DateTime(2022, 1, 17)),
//     // Note(id: 18, title: 'Art Inspiration', content: 'Visit local art gallery.', editedTime: DateTime(2022, 1, 18)),
//     // Note(id: 19, title: 'Pet Care', content: 'Schedule vet appointment for the dog.', editedTime: DateTime(2022, 1, 19)),
//     // Note(id: 20, title: 'Tech Conference', content: 'Register for upcoming tech conference.', editedTime: DateTime(2022, 1, 20)),
//   ];

  List<Note>filtered_note = [];