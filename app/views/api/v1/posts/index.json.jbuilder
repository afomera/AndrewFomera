json.posts(@posts) do |post|
  json.id post.id
  json.url post_url(post)
  json.slug post.slug
  json.title post.title
  json.content post.content
  json.published post.published
  json.created_at post.created_at

end
