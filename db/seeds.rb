
User.destroy_all 
Teacher.destroy_all
Student.destroy_all
Group.destroy_all
Resource.destroy_all
Comment.destroy_all
Favorite.destroy_all
GoogleDoc.destroy_all




def make_users
   800.times do |num|
    gmail_name =  Faker::Name.name 
    email =  Faker::Internet.email 
    created_at = 3.years.ago + (rand * num * 2).days
    User.create!(gmail_name: gmail_name, 
                 email: email,
                 created_at: created_at
                 ) 
   end 
end

def make_students
  User.all.each do |user|
    user.student = Student.create
  end
end

def make_groups
  100.times do |num|
    topic =  Faker::Lorem.word 
    description =  Faker::Lorem.sentence 
    group = Group.create!(topic: topic, 
                 description: description,
                 ) 
    (User.all.length / 80 * rand).floor.times do |num|
      User.all[num].groups << group
    end
  end
end

def make_resources_with_comments
  Group.all.each do |group|
    (rand * 10).floor.times do
      title = Faker::Lorem.word
      link = Faker::Internet.url
      index = (group.users.length * rand).floor
      user_id = group.users[index].id
      resource = Resource.create!(
            title: title,
            link: link,
            user_id: user_id,
            group_id: group.id
        )
      (rand * group.users.length).floor.times do
      index = (group.users.length * rand).floor
      user_id = group.users[index].id        
      created_at = 3.years.ago + (rand * 30 * 2).days
        resource.favorites << Favorite.create!(user_id: user_id, resource_id: resource.id, created_at: created_at)
      end
      (rand * group.users.length).floor.times do
        index = (group.users.length * rand).floor
        user_id = group.users[index].id
        content = Faker::Lorem.paragraph
        created_at = resource.created_at + (rand * 30 * 2).days
        resource.comments << Comment.create!(user_id: user_id, resource_id: resource.id, content: content)
      end
    end
  end
end

def make_comments

end

make_users
make_students
make_groups
make_resources_with_comments