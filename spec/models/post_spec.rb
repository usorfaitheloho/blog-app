require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 2)
  subject { Post.new(title: 'Hello', text: 'This is my first post', likes_counter: 3, comments_counter: 4) } 
 
  before {subject.save }
 
  it "title should be present" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
 
  it "title should not 250" do
    subject.title = 'm' * 400 
    expect(subject).to_not be_valid
  end
 
   it "text should be present" do
    subject.text = nil
    expect(subject).to_not be_valid
  end
 
  it "comments counter should be greater than 0" do
    subject.comments_counter = 0
    expect(subject).to_not be_valid
   end
 
  it "likes counter should be greater than 0" do
    subject.likes_counter = 0
    expect(subject).to_not be_valid
   end
 end 
