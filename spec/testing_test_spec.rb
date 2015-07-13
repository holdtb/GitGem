require 'rspec'
require_relative '../lib/test_file'

describe "TestFile" do
  describe "#test_is_false" do
    context "a context" do
      it "should fail" do
        expect(TestFile.test_is_false).not_to be_truthy
      end
    end
  end
end

