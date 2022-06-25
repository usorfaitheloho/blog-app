RSpec.describe 'Posts show page', type: :feature do
    before(:each) do
      User.destroy_all
      @user = User.create(name: 'Faith', photo: 'profile.png', bio: 'Developer',
                          email: 'faith@email.com', password: 'password',
                          confirmed_at: Time.now, role: 'admin', posts_counter: 0)
  
      @user1 = User.create(name: 'Victor', photo: 'profile.jpg',
                           bio: 'Developer', email: 'victor@email.com',
                           password: 'password', confirmed_at: Time.now)
  
      @post = Post.create(user_id: @user.id, title: 'My title', text: 'My text', likes_counter: 0, comments_counter: 0)
  
      @comment = Comment.create(text: 'My first comment', user: @user, post: @post)
  
      @comment = Comment.create(text: 'My second comment', user: @user, post: @post)
  
      @like = Like.create(user_id: @user.id, post_id: @post.id)
  
      visit new_user_session_path
      fill_in 'Email', with: 'victor@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_posts_path(@user)
    end
  
    describe 'Specs for view posts#show' do
      it 'Can see the posts title.' do
        expect(page).to have_content 'My title'
      end
  
      it 'Can see who wrote the post' do
        expect(page).to have_content 'Faith'
      end
  
      it 'Can see how many comments it has' do
        expect(page).to have_content 'Comments: 2'
      end
  
      it 'Can see how many likes it has' do
        expect(page).to have_content 'Likes: 1'
      end
  
      it 'Can see the post body' do
        expect(page).to have_content 'My text'
      end
  
      it 'Can see the username of each commentor' do
        expect(page).to have_content 'Faith'
      end
  
      it 'Can see the comment each commentor left' do
        expect(page).to have_content 'My first comment'
        expect(page).to have_content 'My second comment'
      end
    end
  end
  