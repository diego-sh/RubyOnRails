json.extract! comentario, :id, :user_id, :article_id, :cuerpo, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)