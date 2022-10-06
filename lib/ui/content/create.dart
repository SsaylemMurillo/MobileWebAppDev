import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/models/subjects.dart';

class AddNewSubject extends StatefulWidget {
  const AddNewSubject({super.key});

  @override
  State<AddNewSubject> createState() => _AddNewSubjectState();
}

class _AddNewSubjectState extends State<AddNewSubject> {
  final List<Subject> _addSubject = [];
  TextEditingController controlName = TextEditingController();
  TextEditingController controlTeacher = TextEditingController();
  TextEditingController controlGrade = TextEditingController();
  TextEditingController controlCredits = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subject'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: controlName,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Name ',
                  suffix: GestureDetector(
                      onTap: (() {
                        controlName.clear();
                      }),
                      child: const Icon(Icons.close)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: controlTeacher,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Teacher ',
                  suffix: GestureDetector(
                      onTap: (() {
                        controlTeacher.clear();
                      }),
                      child: const Icon(Icons.close)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: controlGrade,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Grade ',
                  suffix: GestureDetector(
                      onTap: (() {
                        controlGrade.clear();
                      }),
                      child: const Icon(Icons.close)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: controlCredits,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Credits ',
                  suffix: GestureDetector(
                      onTap: (() {
                        controlCredits.clear();
                      }),
                      child: const Icon(Icons.close)),
                )),
          ),
          ElevatedButton(
              onPressed: () {
                _addSubject.add(Subject(
                  name: controlName.text,
                  teacher: controlTeacher.text,
                  grade: controlGrade.text,
                  credits: controlCredits.text,
                ));
                Navigator.pop(context, _addSubject);
              },
              child: const Text('Add Subject'))
        ],
      ),
    );
  }
}
