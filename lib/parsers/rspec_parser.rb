class RspecParser

  @pass_regex = /0 failures/
  
  def self.contains_failure?(input)
    input !~ @pass_regex
  end

end
