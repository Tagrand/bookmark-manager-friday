require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String
  property :password_hash, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end
end
