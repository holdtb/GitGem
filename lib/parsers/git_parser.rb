class GitParser

  @file_modified_regex = /Changes not staged for commit/

   def self.parse_local_repo_has_changes?(git_status)
    @file_modified_regex =~ (git_status)
  end
  
end

