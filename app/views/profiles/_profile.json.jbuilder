json.extract! profile, :id, :name, :gender, :birthday, :blood_type, :personality, :created_at, :updated_at
json.url profile_url(profile, format: :json)
