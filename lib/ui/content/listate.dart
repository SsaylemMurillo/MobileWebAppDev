import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/models/subjects.dart';
import 'package:flutter_application_2/ui/content/create.dart';

class ListateSubjects extends StatefulWidget {
  const ListateSubjects({super.key});

  @override
  State<ListateSubjects> createState() => _ListateSubjectsState();
}

class _ListateSubjectsState extends State<ListateSubjects> {
  final List<Subject> _subjects = subjectsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
        'My Subjects ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ))),
      body: ListView.builder(
          itemCount: _subjects.length,
          itemBuilder: (context, pos) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  child: Text(
                    _subjects[pos].grade,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              title: Text(_subjects[pos].name),
              subtitle: Text(_subjects[pos].teacher),
              trailing: CircleAvatar(
                radius: 10,
                child: Text(_subjects[pos].credits),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddNewSubject(), // Call to the view
            ),
          ).then((result) {
            // Waiting for a result
            _subjects.addAll(result); // Adding to the view what it gets
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
