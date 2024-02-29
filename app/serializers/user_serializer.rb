class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username, :name, :role
end
