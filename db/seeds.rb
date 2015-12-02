User.destroy_all
Group.destroy_all
Resource.destroy_all
Teacher.destroy_all
Student.destroy_all

User.create(gmail_name: "Tracy")
User.create(gmail_name: "Jim")
User.create(gmail_name: "Maddie")
User.create(gmail_name: "Meredith")

Group.create(topic: "magic")
Group.create(topic: "sorcery")
Group.create(topic: "geology")
Group.create(topic: "evolutionary biology")
Group.create(topic: "economics")
Group.create(topic: "english")


