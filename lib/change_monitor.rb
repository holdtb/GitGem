require_relative 'parsers/git_parser'
require_relative 'parsers/rspec_parser'
require_relative 'command_runner'
class ChangeMonitor

  def self.pwd_file_changes?
    status = CommandRunner.run_cmd("git status")
    GitParser.parse_local_repo_has_changes?(status)
  end

  def self.has_failing_test?
    RspecParser.contains_failure?(
         CommandRunner.run_cmd("rspec spec"))
  end
end
