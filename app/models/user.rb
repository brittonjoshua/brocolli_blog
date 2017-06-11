class User < ApplicationRecord
  include BCrypt
  has_many  :entries

  validates  :username, :email, presence: true
  validates  :username, :email, uniqueness: true
  validate  :password_check

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(plaintext_password)
    @raw_password = plaintext_password
    @password = Password.create(plaintext_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password_attempt)
    user = User.find_by_username(username)
    if user && user.password == password_attempt
      return user
    else
      nil
    end
  end

# check to see if @raw_password is not nil
  def password_check
    if @raw_password.nil?
      errors.add(:password, "required")
    end
  end

end
