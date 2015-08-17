class User < ActiveRecord::Base

  validates :username, uniqueness: true, presence: true
  after_initialize :ensure_session_token

  attr_reader :password
  attr_accessor :login_string, :login_status

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end


  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    unless user
      user = User.create!(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid],
            username: auth_hash[:info][:name],
    end

    user
  end


  def reset_session_token!
    self.session_token = nil
    self.session_token = User.generate_session_token
    self.save!
  end

  private
    def ensure_session_token
      self.session_token ||= User.generate_session_token
    end

end
