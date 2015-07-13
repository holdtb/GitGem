require_relative 'lib/holy_git'
require_relative 'lib/commit'

class Runner
  hg = HolyGit.new
  # puts "Getting last local commit..."
  # hg.print_last_local_commit
  # puts "Getting last remote commit..."
  # hg.print_last_remote_commit(HolyGit.execute_github_get_request)

  puts "Checking if local is behind..."
  puts hg.is_local_behind_remote?
end
