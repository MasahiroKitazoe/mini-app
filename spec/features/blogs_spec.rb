require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  context "when user is signed in" do

    before do
      @user = FactoryGirl.create(:user)

      visit root_path
      click_link "ログイン"
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "ログイン"
    end

    scenario "user creates a new blog" do
      expect{
        click_link "新規投稿"
        fill_in "タイトルを入力", with: "Come A Little Bit Closer"
        fill_in "記事を書く", with: "Fox On the Run"
        click_button "投稿する"

        expect(page).to have_content "Come A Little Bit Closer"
        expect(page).to have_content "Fox On the Run"
        expect(page).to have_content "Written by : #{@user.nickname}"
      }.to change(@user.blogs, :count).by(1)
    end

    context "posted blogs exists" do
      before do
        @blog = @user.blogs.create(title: "We are Groot", text: "I am Groot")
      end

      scenario "user view index page with edit and destroy button" do
          visit blogs_path
          expect(page).to have_content "投稿を編集"
          expect(page).to have_content "投稿を削除"
      end

      scenario "user show a blog with edit and destroy button" do
        visit blog_path(@blog.id)
        expect(page).to have_content "投稿を編集"
        expect(page).to have_content "投稿を削除"
      end

      scenario "user edit a blog through index view" do
        visit blogs_path

        click_link "投稿を編集"
        fill_in "edit-title", with: "Come A Little Bit Closer"
        fill_in"edit-text", with: "Fox On the Run"
        click_button "投稿する"

        expect(page).to have_content "Come A Little Bit Closer"
        expect(page).to have_content "Fox On the Run"
        expect(page).to have_content "Written by : #{@user.nickname}"
      end

      scenario "user edit a blog through show view" do
        visit blog_path(@blog.id)

        click_link "投稿を編集"
        fill_in "edit-title", with: "Come A Little Bit Closer"
        fill_in "edit-text", with: "Fox On the Run"
        click_button "投稿する"

        expect(page).to have_content "Come A Little Bit Closer"
        expect(page).to have_content "Fox On the Run"
        expect(page).to have_content "Written by : #{@user.nickname}"
      end

      scenario "user destroys a blog through index view" do
        visit blogs_path

        expect{
        click_link "投稿を削除"

        expect(page).to_not have_content "We are Groot"
        expect(page).to_not have_content "I am Groot"
        expect(page).to_not have_content "Written by : #{@user.nickname}"
      }.to change(@user.blogs, :count).by(-1)
      end

      scenario "user destroys a blog through index view" do
        visit blog_path(@blog.id)

        expect{
        click_link "投稿を削除"

        expect(page).to_not have_content "We are Groot"
        expect(page).to_not have_content "I am Groot"
        expect(page).to_not have_content "Written by : #{@user.nickname}"
      }.to change(@user.blogs, :count).by(-1)
      end
    end
  end
end
