require "rails_helper"
require "spec_helper"


RSpec.describe 'posts', type: :feature, js: true do
  let!(:post) {create :post}
  feature "it should load the home page" do
    scenario " and return status code 200" do
      visit home_path
      expect(page).to have_content "Blog Posts"
    end
  end

  feature "it should load the create post page" do
    scenario " and return status code 200" do
      visit home_path
      click_on 'Create Post'
      expect(page).to have_content "Title"
      expect(page).to have_content "Body"
      expect(page).to have_content "Add Post"
      fill_in 'post_title', with: 'blog one'
      fill_in 'post_body', with: 'grhrhgfghrtrherj'
      click_on 'Save Post'
      sleep 2
    end
  end
  feature "it should edit the post" do
    scenario "and return new results" do
      visit home_path
      click_on 'Read more'
      sleep 2
      click_on 'Edit'
      fill_in 'post_title', with: 'blog ones'
      fill_in 'post_body', with: 'grhrhgfghrtrherfbijnfj'
      click_on 'Save Post'
      sleep 5
      expect(page).to have_content "blog ones"
    end
  end

  feature "it should delete the post" do
    scenario " and return an empty page" do
      visit home_path
      click_on 'Read more'
      sleep 2
      accept_alert do
        click_on 'Delete'

      end
      sleep 2
      expect(page).to have_content "Blog Posts"
      expect(page).not_to have_content "blog one"
      expect(page).not_to have_content "grhrhgfghrtrherj"

    end
  end

end
