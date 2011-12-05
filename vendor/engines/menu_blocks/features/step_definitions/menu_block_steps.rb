Given /^I have no menu_blocks$/ do
  MenuBlock.delete_all
end

Given /^I (only )?have menu_blocks titled "?([^\"]*)"?$/ do |only, titles|
  MenuBlock.delete_all if only
  titles.split(', ').each do |title|
    MenuBlock.create(:name => title)
  end
end

Then /^I should have ([0-9]+) menu_blocks?$/ do |count|
  MenuBlock.count.should == count.to_i
end
