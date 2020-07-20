class Course {
  int id;
  String name;
  String description;
  int semester;
  int credits;
  int research;

  Course(this.name, this.semester, this.credits, this.research, [this.description]);
  Course.withId(this.id, this.name, this.semester, this.credits, this.research, [this.description]);
}