import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nectar/notes/model/note_model.dart';
import 'package:nectar/notes/screens/edit_note_screen.dart';

import '../repositories/database_helper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final colors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.purpleAccent,
    Colors.greenAccent.shade400,
    Colors.cyanAccent,
  ];

  DatabaseHelper dbhelper = DatabaseHelper.instance;
  List<NoteModel> notes = [];

  void getNotesList() async {
    List<Map<String, dynamic>>? allNotes = await dbhelper.queryAllNotes();
    if (allNotes != null) {
      notes.clear();
      notes.addAll(allNotes.map((e) => NoteModel.fromJson(e)).toList());
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Notes",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                "No notes yet",
                style: TextStyle(fontSize: 26),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                NoteModel note = notes[index];

                Random random = Random();
                Color bg = colors[random.nextInt(8)];

                return Dismissible(
                  key: Key(note.id.toString()),
                  background: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child:
                            Icon(Icons.delete, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    dbhelper.delete(note.id);
                    setState(() {
                      notes.removeAt(index);
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Note deleted')));
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditNoteScreen(note: note),
                        ),
                      ).whenComplete(() => getNotesList());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 5,
                        top: 5,
                        left: 15,
                        right: 15,
                      ),
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: bg,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                              top: 5,
                              right: 8,
                              left: 8,
                              bottom: 0,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                note.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              note.body,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                note.date,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const EditNoteScreen(),
            ),
          ).whenComplete(() => getNotesList());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
