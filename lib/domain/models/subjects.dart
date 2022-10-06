class Subject {
  var name;
  var credits;
  var teacher;
  var grade;

  Subject({this.name, this.credits, this.teacher, this.grade});
}

List<Subject> subjectsList = [
  Subject(
    name: 'Mobile Programming',
    credits: '2',
    teacher: 'Alex Vacca',
    grade: '4.0',
  ),
  Subject(
    name: 'Artificial Intelligence',
    credits: '2',
    teacher: 'Braulio Barrios',
    grade: '3.0',
  ),
  Subject(
    name: 'Data Base',
    credits: '1',
    teacher: 'Christyan Silva',
    grade: '2.0',
  ),
  Subject(
    name: 'Software II',
    credits: '4',
    teacher: 'Carlos Pabon',
    grade: '5.0',
  ),
];
