require 'rubygems'
require 'git'
require 'bundler/setup'
require 'pry'
require 'rest-client'
require 'json'
require 'thor'

class HolyGit < Thor
  attr_accessor :local_commit
  attr_accessor :remote_commit

  def init_remote_commit
    @remote_commit = Commit.new
    @remote_commit.owner = "holdtb"
    @remote_commit.repo = "GitGem"
    @remote_commit.branch = "master"
  end


  def self.execute_github_get_request
    url = "https://api.github.com/repos/holdtb/GitGem/branches/master"
    unparsed_json = RestClient.get url
    result = JSON.parse(unparsed_json)
    return result
  end

  def print_last_remote_commit(parsed_json_get_request)
    commit_date = parsed_json_get_request["commit"]["commit"]["author"]["date"]
    commit_message = parsed_json_get_request["commit"]["commit"]["message"]
    commit_author = parsed_json_get_request["commit"]["commit"]["author"]["name"]
    puts "#{commit_date} - #{commit_message} by #{commit_author}"
  end

  def print_last_local_commit
    g = Git.open(Dir.pwd)
    g.log(1).each do |commit|
      puts "#{commit.date.strftime("%m-%d-%y")} - #{commit.message} by #{commit.author.name}"
    end
  end

  def is_local_behind_remote?(remote_name = 'origin')
    g = Git.open(Dir.pwd)
    puts "fetching from remote #{remote_name}..."
    g.fetch
    #g.lib.send(:command, 'status', '-s')
    puts "Executing git status...."
    IO.popen("git status"){|o| puts o.gets}
  end

end
