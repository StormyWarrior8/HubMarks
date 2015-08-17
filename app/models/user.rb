class User < ActiveRecord::Base

  validates :username, uniqueness: true, presence: true
  after_initialize :ensure_session_token

  attr_reader :password
  attr_accessor :login_string, :login_status

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end


  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by( access_token: auth_hash[:access_token])

    unless user
      #use octokit to get username, and stars
      #user_info = self.initalize_gh_user(auth_hash[:access_token])
      user = User.create!(
            access_token: auth_hash[:access_token],
            username: user_info[:login]
            )
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
