require 'octokit'

class Github

  def initialize(username)
    if username
      user = User.find_by(username: username)
    end

    if user
      #connect via user creds
    else
      #connect via app creds
    end
  end

end
