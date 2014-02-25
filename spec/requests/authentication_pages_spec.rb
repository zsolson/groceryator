require 'spec_helper'

describe "Sign up page" do 

	subject { page }

	shared_examples_for "all static pages" do
    	it { should have_selector('h1', text: heading) }
    	it { should have_title(full_title(page_title)) }
  	end

  	describe "Sign up page" do
  		before { visit new_user_registration_path }
  		let(:heading) {'Sign up'}
  		let(:page_title) {'Sign up'}

  		it_should_behave_like "all static pages"

      describe "with no info" do
        before { click_button "Sign up" }

        it { should have_title('Sign up') }
        it { should have_content("Email can't be blank") }
        it { should have_content("Password can't be blank") }
        it { should have_content("Name can't be blank") }
      end

      describe "with bad info" do
        before do
          fill_in "Email", with: "foo@bar"
          fill_in "Name", with: "test"
          fill_in "Password", with: "test"
          click_button "Sign up" 
        end

        it { should have_title('Sign up') }
        it { should have_content("Email is invalid") }
        it { should have_content(/Password is too short/) }
      end

      describe "with non-matching password " do
        before do
          fill_in "Email", with: "foo@bar.com"
          fill_in "Name", with: "test"
          fill_in "Password", with: "testtest"
          click_button "Sign up" 
        end

        it { should have_title('Sign up') }
        it { should have_content("Password confirmation doesn't match Password") }
      end

      describe "with good info" do
        before do
          ActionMailer::Base.delivery_method = :test
          ActionMailer::Base.perform_deliveries = true
          ActionMailer::Base.deliveries.clear
          fill_in "Email", with: "test@example.com"
          fill_in "Name", with: "user.name"
          fill_in "Password", with: "user.password"
          fill_in "Password confirmation", with: "user.password"
        end


        it "should create a user" do
          expect { click_button "Sign up" }.to change(User, :count).by(1)
          ActionMailer::Base.deliveries.count == 1
          ActionMailer::Base.deliveries.first.to.should == ['test@example.com']
        end

        #it "should send an email" do
        #  expect { click_button "Sign up" }.to change(ActionMailer::Base.deliveries.count).by(1)
        #end

        describe "after saving the user" do
          before { click_button "Sign up" }
          let(:user) { User.find_by(email: 'test@example.com') }
          it { should have_title(full_title('')) }
          it { should have_link('Edit profile', href: edit_user_registration_path) }
          it { should have_link('Logout', href: destroy_user_session_path) }
          it { should have_content('Welcome! You have signed up successfully') }
          it { should have_content("Logged in as #{user.email}") }
        end
      end

  	end
	
end