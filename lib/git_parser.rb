class GitParser

  @date_regex = /\w{3} \w{3} \d{2} \d{2}:\d{2}:\d{2} \d{4}/
  @file_modified_regex = /(Changes not staged for commit:)|(Changes to be committed:)/

  def self.parse_most_recent_commit_date (git_log)
    @date_regex.match(git_log)
  end

  def self.parse_local_repo_has_changes?(git_status)
    @file_modified_regex =~ (git_status)
  end
  
end

