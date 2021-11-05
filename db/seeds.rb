# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Post.delete_all
Category.delete_all
User.delete_all
Tagging.delete_all
Tag.delete_all

Category.create(name: "Programming")
Category.create(name: "Web Dev")
Category.create(name: "Ruby on Rails")
Category.create(name: "React")
Category.create(name: "Angular")

javascript = Tag.create(name: "javascript")
node = Tag.create(name: "node")
ruby = Tag.create(name: "ruby")
react = Tag.create(name: "react")

admin_user = User.create(
    email: "kuldeep.yadav@idfy.com",
    username: "admin",
    admin: true, password: "123456",
    password_confirmation: "123456"
)


10.times do |i|
    User.create(
        email: "user#{i}@idfy.com",
        password: "123456",
        password_confirmation: "123456",
        admin: false,
        username: "user#{i}"
    )
end

Category.all.each do |category|
    10.times do |i|
        #tag_offset = rand(Tag.count)
        #tag = Tag.offset(tag_offset).first
        Post.create(title: "Post #{i}",
            description: "Post details #{i}", category: category,
            tags: i % 2 == 0 ? [javascript, react] : [ruby, node],
            # user: admin_user
        )
    end
end
