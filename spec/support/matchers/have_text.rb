RSpec::Matchers.define :have_text do |expected|
  match do |actual|
    actual.text == expected
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would have the text \"#{expected}\""
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not have the text \"#{expected}\""
  end

  description do
    "have text #{expected}"
  end
end
