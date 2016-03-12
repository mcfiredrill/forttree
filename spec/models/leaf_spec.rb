require "spec_helper"

describe Leaf do
  context "a leaf" do
    before(:each) do
      @leaf = create(:leaf)
    end

    it "should transliterate filename" do
      assert_match(/\d{1,2}-\d{1,2}-\d\d\d\d_\d{1,2}-\d{1,2}-\d{1,2}_forttree.png/, @leaf.photo_file_name)
    end

    context "with content but without a photo" do

    end

    context "with photo but without content" do
      before(:each) do
        @leaf = Factory.build(:leaf, :content => nil)
      end
    end
  end
end
