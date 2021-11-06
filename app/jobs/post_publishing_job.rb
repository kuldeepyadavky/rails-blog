class PostPublishingJob < ApplicationJob
  queue_as :default

  def perform(*args)
  # Do something later
  #lengtgy operatuin
  #   Post.create(title: "Post #{i}",
  #     description: "Post details #{i}", category: category,
  #     tags: i % 2 == 0 ? [javascript, react] : [ruby, node],
  #     # user: admin_user
  # )
  
  # Post.create(title: "Delayed job", description: "Testing delayed job")

  post = Post.new
  post.title = "Delayed job"
  post.description  = "Testing deployed job"
  post.category = Category.first

  post.save

  sleep 1

  end
end
