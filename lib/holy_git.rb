require 'rubygems'
require 'net/http'
require 'git'
class HolyGit
  attr_accessor :local_commit
  attr_accessor :remote_commit


  def get_last_remote_commit
    url = "repos/#{:remote_commit[:owner]}/#{:remote_commit[:repo]}/branches/#{:remote_commit[:branch]}"
    req = Net::HTTP::Get.new(url.to_str)
    result = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
  end


  def get_last_local_commit
    g = Git.open(working_dir, :log => Logger.new(STDOUT))

    g.log.since('2 weeks ago')
    g.each do |commit|
      puts commit.sha
    end
  end
end
