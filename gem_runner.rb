require_relative 'lib/holy_git'
require_relative 'lib/commit'
require_relative 'lib/process'
class Runner
  hg = HolyGit.new
  # puts "Getting last local commit..."
  # hg.print_last_local_commit
  # puts "Getting last remote commit..."
  # hg.print_last_remote_commit(HolyGit.execute_github_get_request)

  puts "Checking if files have been modified...."
  if hg.has_file_changes?
    puts "File changes detected"
    #run rspec tests
#   if passes
#     #Do BLAH
#   else
#     puts "Rspec tests failed!"
#   end
# else
#   puts "No file changes. Get back to work!"
  end
end
