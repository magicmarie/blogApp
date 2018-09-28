require "rails_helper"

RSpec.describe PostsController do
  describe "GET index" do
    it "should render index page" do
      post = create_list :post, 5
      get :index

      son = assigns[:posts]
      expect(son[0][:title]).not_to be_nil
      expect(son[0][:id]).not_to be_nil
      expect(son[0][:body]).not_to be_nil
    end
  end

  describe "GET new" do
    it "should show the newpost page" do
      get :new
      expect(response).to render_template("new")

    end

  end
  #
  # describe "GET show" do
  #   it "should show the specific post page" do
  #
  #     binding.pry
  #   end
  # end
end