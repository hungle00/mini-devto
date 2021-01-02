json.extract! article, :id, :title, :slug, :body, :description, :favorites_count, :created_at, :updated_at
json.url article_url(article, format: :json)
