class CommandRunner

  def self.run_cmd(cmd)
    IO.popen(cmd){|line| @result = line.read}
    @result
  end

  def self.auto_commit
   run_cmd("git add -A")
   run_cmd("git commit --amend --no-edit")
  end

  def self.run_tests(project)
    if ChangeMonitor.has_failing_test?
      puts "Rspec tests failed!"
    else
      puts "passing"
      auto_commit
    end
  end
end
