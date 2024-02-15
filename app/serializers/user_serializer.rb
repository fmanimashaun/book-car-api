class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username, :name, :role

  attribute :created_date do |user|
    user.created_at&.strftime('%m/%d/%Y')
  end
end
