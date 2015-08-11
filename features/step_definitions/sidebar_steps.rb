Then /^I should see a sidebar titled "([^"]*)"$/ do |title|
  expect(page).to have_css '.sidebar-section h3', text: title
end

Then /^I should not see a sidebar titled "([^"]*)"$/ do |title|
  title = title.tr(' ', '').underscore
  sidebars = page.all :css, "##{title}-sidebar-section"
  expect(sidebars.count).to eq 0
end

Then(/^I should see a sidebar titled "(.*?)" above sidebar titled "(.*?)"$/) do |top_title, bottom_title|
  expect(page).to have_css %Q(.sidebar-section:contains('#{top_title}') + .sidebar-section:contains('#{bottom_title}'))
end
