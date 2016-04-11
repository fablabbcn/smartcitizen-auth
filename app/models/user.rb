class User < ActiveRecord::Base

  has_secure_password
  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner

  def authenticate_with_legacy_support raw_password
    begin
      return authenticate(raw_password)
    rescue BCrypt::Errors::InvalidHash
      if old_data && old_data['password'] == Digest::SHA1.hexdigest([ENV['old_salt'], raw_password].join)
        self.password = raw_password
        save(validate: false)
        return self
      end
      return false
    end
  end

end
