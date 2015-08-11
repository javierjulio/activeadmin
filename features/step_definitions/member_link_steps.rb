Then /^I should see an action item button "([^"]*)"$/ do |content|
  expect(page).to have_css '.action-items a', text: content
end

Then /^I should not see an action item button "([^"]*)"$/ do |content|
  expect(page).to_not have_css '.action-items', text: content
end
