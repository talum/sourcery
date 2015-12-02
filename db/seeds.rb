User.destroy_all
Group.destroy_all
Resource.destroy_all
Teacher.destroy_all
Student.destroy_all

tracy = User.create(gmail_name: "Tracy")
jim = User.create(gmail_name: "Jim")
maddy = User.create(gmail_name: "Maddy")
meredith = User.create(gmail_name: "Meredith")

magic = Group.create(topic: "magic")
sorcery = Group.create(topic: "sorcery")
geology = Group.create(topic: "geology")
evolutionary_biology = Group.create(topic: "evolutionary biology")
economics = Group.create(topic: "economics")
english = Group.create(topic: "english")

tracy.teacher = Teacher.create
jim.student = Student.create
maddy.student = Student.create
meredith.student = Student.create

tracy.teacher.groups << magic
tracy.teacher.groups << sorcery
tracy.teacher.groups << geology
tracy.teacher.groups << evolutionary_biology
tracy.teacher.groups << economics
tracy.teacher.groups << english

jim.student.groups << geology
jim.student.groups << magic
jim.student.groups << english
maddy.student.groups << evolutionary_biology
maddy.student.groups << english
maddy.student.groups << economics
meredith.student.groups << magic
meredith.student.groups << economics
meredith.student.groups << geology
