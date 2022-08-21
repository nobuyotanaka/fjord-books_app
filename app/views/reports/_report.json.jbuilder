json.extract! report, :id, :title, :comment, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
