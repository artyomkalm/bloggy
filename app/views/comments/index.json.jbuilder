json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :post_id, :author_id, :approved
  json.url comment_url(comment, format: :json)
end
