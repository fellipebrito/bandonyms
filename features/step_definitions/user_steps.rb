Given /^I am not logged in$/ do
  visit '/logout'
end

Given(/^I am logged in$/) do
  App.any_instance.stub(:active_user).and_return({ 'name' => 'Bruce Wayne'} )
  visit '/'
  page.should have_content "Bruce Wayne"
end

When(/^I click to login with facebook$/) do
  App.any_instance.stub(:active_user).and_return({ 'name' => 'Bruce Wayne'} )
  App.any_instance.stub(:redirect_url).and_return('/')
  click_on 'Sign in with Facebook'
end

When(/^I click to logout$/) do
  App.any_instance.stub(:active_user).and_return( nil )
  visit 'logout'
end

Then /^I should be signed in$/ do
  page.should have_content "Bruce Wayne"
end

Then /^I should be logged off$/ do
  page.should have_content "Sign in with Facebook"
end
