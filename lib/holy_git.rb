require 'rubygems'
require 'net/http'
require 'git'
class HolyGit
  attr_accessor :local_commit
  attr_accessor :remote_commit

  def init_remote_commit
    @remote_commit = Commit.new
    @remote_commit[:owner] = "holdtb"
    @remote_commit[:repo] = "GitGem"
    @remote_commit[:branch] = "master"
  end

  def self.get_last_remote_commit
    url = "repos/#{:remote_commit[:owner]}/#{:remote_commit[:repo]}/branches/#{:remote_commit[:branch]}"
    req = Net::HTTP::Get.new(url.to_str)
    result = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
  end


  def self.get_last_local_commit
    g = Git.open(Dir.pwd)

    g.log.each do |commit|
      puts commit.date.strftime("%m-%d-%y")
    end
  end
end
