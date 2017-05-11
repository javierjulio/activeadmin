Then /^I should see the panel title "([^"]*)"$/ do |title|
  expect(page).to have_css '.panel-title', text: title
end

Then /^I should not see the panel title "([^"]*)"$/ do |title|
  expect(page).to_not have_css '.panel-title', text: title
end

Then /^I should see the attributes table$/ do
  expect(page).to have_css '.panel .attributes-table'
end
