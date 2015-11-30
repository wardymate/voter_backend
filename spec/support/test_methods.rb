def user_one_sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def user_two_sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'alice@orange.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button('Sign up')
end

def user_sign_out
  click_link('Sign out')
end

def add_idea
  visit '/ideas'
  click_link 'Add an idea'
  fill_in 'Name', with: 'Lions tour'
  click_button 'Create Idea'
end