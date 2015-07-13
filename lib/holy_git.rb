require 'rubygems'
require 'git'
require 'bundler/setup'
require 'pry'
require_relative './git_parser'
#require 'thor'
class HolyGit
 
  def initialize
    @git_repo = Git.open(Dir.pwd)
  end

  def get_most_recent_local_commit_date
    branch = "master"
    local_log = get_git_log(branch, true)
    GitParser.get_most_recent_remote_commit_date(local_log)
  end

  def get_most_recent_remote_commit_date
    branch = "master"
    local_log = get_git_log(branch, false)
    GitParser.get_most_recent_remote_commit_date(local_log)
  end

  def push

  end

  def pull

  end

  def has_file_changes?
    GitParser.parse_local_repo_has_changes?(get_git_status)
  end

  def get_git_status(branch_name = 'master')
    cmd = "git status"
    IO.popen(cmd){|line| @status_contents = line.read}
    @status_contents
  end

  def get_git_log(branch_name = 'master', is_local = true) 
    cmd = "git log #{(is_local) ? "" : "origin/"}#{branch_name}"
    @git_repo.fetch
    puts "Executing git status...."
    IO.popen(cmd){|c| @log_contents = c.read } 
    @log_contents
  end

end
