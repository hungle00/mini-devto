require 'rails_helper'

#include ArticlesHelper
# Specs in this file have access to a helper object that includes
# the ArticleHelper. For example:
#
# describe ArticleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticlesHelper, type: :helper do
  it "assigns a user to a post" do
    creator = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    @article = Article.new(
      title: 'My Article',
      body: 'My Body'
    )
    assign_article_creator(@article, creator)
    expect(@article.user).to be(creator)
  end
end
