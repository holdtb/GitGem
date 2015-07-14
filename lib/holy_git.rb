require 'rubygems'
require 'git'
require 'bundler/setup'
require 'pry'
require_relative './git_parser'
require_relative './rspec_parser'
class HolyGit


  # todo DELETE THIS FILE

  def initialize
    @git_repo = Git.open(Dir.pwd)
  end

end
