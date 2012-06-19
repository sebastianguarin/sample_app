include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
  	page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_correct_title  do |h1_text, title_text|
  match do |page|
  	if title_text.nil?
    title_text = h1_text
  	end
  	page.should have_selector('h1',    text: h1_text) 
    page.should have_selector('title', text: title_text) 
  end
end


def valid_register
	  fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"
end
