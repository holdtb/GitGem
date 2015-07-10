require_relative 'lib/holy_git'
require_relative 'lib/commit'

class Runner
    HolyGit.get_last_local_commit
end
