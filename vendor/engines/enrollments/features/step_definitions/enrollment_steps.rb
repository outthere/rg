Given /^I have no enrollments$/ do
  Enrollment.delete_all
end

Given /^I (only )?have enrollments titled "?([^\"]*)"?$/ do |only, titles|
  Enrollment.delete_all if only
  titles.split(', ').each do |title|
    Enrollment.create(:name => title)
  end
end

Then /^I should have ([0-9]+) enrollments?$/ do |count|
  Enrollment.count.should == count.to_i
end
