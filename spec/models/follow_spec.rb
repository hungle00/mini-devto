require 'rails_helper'

RSpec.describe Follow, type: :model do

  subject { follow }
  
  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    #its(:follower) { should == follower }
    #its(:followed) { should == followed }
  end

  describe "when followed id is not present" do
    before { follow.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { follow.follower_id = nil }
    it { should_not be_valid }
  end
end
