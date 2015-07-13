require_relative 'lib/command_runner'
require_relative 'lib/change_monitor'
require 'thor'

class HolyGit < Thor
  desc "holy_git", "source control thingy that you use for tests ya'know?"
  def leopard
    puts "Created new HolyGit"
  end
end

HolyGit.start(ARGV)
