# json.partial! "posts/post", post: @post

# json.id @post.id #=>calls json.extract
json.extract! @post, :id, :title, :created_at
json.edit_url edit_post_url(@post) if current_user
# json.tags @post.tags , :name 
json.categories do |j|
    j.(@post.category, :id, :name)
    json.url category_url(@post.category)
end

#partial
json.tags @post.tags do |tag|
    json.partial! tag
end