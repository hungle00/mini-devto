require 'rails_helper'

RSpec.describe User, type: :model do
    it { should respond_to(:follows) }
end
