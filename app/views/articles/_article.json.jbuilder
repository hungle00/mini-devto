json.extract! article, :title, :slug, :body, :description, :favorites_count, :created_at, :updated_at, :tag_list
json.url article_url(article, format: :json)
