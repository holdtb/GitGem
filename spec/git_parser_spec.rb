require 'rspec'
require_relative '../lib/parsers/git_parser'
require 'pry'

changes_not_staged = """Changes not staged for commit:
(use 'git add <file>...' to update what will be committed)
(use 'git checkout -- <file>...' to discard changes in working directory)
      modified:   spec/git_parser_spec.rb
no changes added to commit (use 'git add' and/or 'git commit -a')"""

changes_made = """On branch master
Your branch is ahead of 'origin/master' by 1 commit.
(use 'git push' to publish your local commits)
Changes to be committed:
(use 'git reset HEAD <file>...'' to unstage)
      modified:   spec/git_parser_spec.rb"""

describe GitParser do

  describe "file_modified_regex" do
    context "No Changes" do
      it "should return true" do
        result = GitParser.parse_local_repo_has_changes?(changes_not_staged)
        expect(result).to be true
      end
    end

    context "Changes made" do
      it "should return false" do
        result = GitParser.parse_local_repo_has_changes?(changes_made)
        expect(result).to be false
      end
    end

  end
end
