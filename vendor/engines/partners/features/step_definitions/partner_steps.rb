Given /^I have no partners$/ do
  Partner.delete_all
end

Given /^I (only )?have partners titled "?([^\"]*)"?$/ do |only, titles|
  Partner.delete_all if only
  titles.split(', ').each do |title|
    Partner.create(:name => title)
  end
end

Then /^I should have ([0-9]+) partners?$/ do |count|
  Partner.count.should == count.to_i
end
