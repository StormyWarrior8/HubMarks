require 'octokit'

class Github

  def initialize
    if current_user
      @client = Octokit::Client.new(:access_token => current_user.access_token)
    else
      @client = Octokit::Client.new(:client_id => ENV['GITHUB_KEY'], :client_secret => ENV['GITHUB_SECRET'])
    end
  end

end
