require 'rspec'
require_relative '../lib/parsers/rspec_parser'
require 'pry'

no_failures = """Finished in 0.002 seconds (files took 0.525 seconds to load)
2 examples, 0 failures"""

has_failures = """Failures:

  1) GitParser file_modified_regex Changes made should return false
     Failure/Error: expect(result).to be false
     NameError:
            undefined local variable or method `result' for #<RSpec::ExampleGroups::GitParser::FileModifiedRegex::ChangesMade:0x00000002ad8228>
     # ./git_parser_spec.rb:31:in `block (4 levels) in <top (required)>'
Finished in 0.002 seconds (files took 0.525 seconds to load)
2 examples, 1 failure"""

describe RspecParser do

  describe "#contains_failure?" do
    context "No Failures" do
      it "should return false" do
        result = RspecParser.contains_failure?(no_failures)
        expect(result).to be false
      end
    end

    context "Has Failures" do
      it "should return true" do
        result = RspecParser.contains_failure?(has_failures)
        expect(result).to be true
      end
    end

  end
end
