require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'Faith', photo: 'picture1.jpg',
                         bio: 'Developer.',
                         email: 'faithy@gmail.com',
                         password: 'password', confirmed_at: Time.now,
                         posts_counter: 0, role: 'admin')

    @second = User.create(name: 'Victor', photo: 'picture2.jpg',
                          bio: 'Developer.', email: 'okorojiebube@gmail.com',
                          password: 'password', confirmed_at: Time.now,
                          posts_counter: 0, role: 'admin')

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  scenario 'See all usernames' do
    expect(page).to have_content('Faith')
    expect(page).to have_content('Victor')
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content 'picture1.jpg'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'Faith', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end