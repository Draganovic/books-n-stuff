class User < ActiveRecord::Base
  has_secure_password

  # def authenticate(password)
    # password1
    # magic to check validity of the password
  # end
end
