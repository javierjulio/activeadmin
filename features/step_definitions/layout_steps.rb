Then /^I should see the Active Admin layout$/ do
  expect(page).to have_css '.active-admin-content .main-content-wrapper'
end
