class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_one :branch

  enum role: [:admin, :branch]

  def invalidate_token
    update_columns token: nil
  end

  class << self
    def valid_login? email, password
      find_by(email: email).try :authenticate, password
    end
  end
end
