class User
  include DataMapper::Resource
  property :id, UUID, :key => true
  property :name, String
  property :created_at, DateTime
  property :bucket, String
end
