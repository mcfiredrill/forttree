require "spec_helper"

describe Branch do
  it { should have_many(:leafs) }
  
  context "a branch" do
    before(:each) do
      @branch = create(:branch)
    end
  end
end
