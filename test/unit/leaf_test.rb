require 'test_helper'

class LeafTest < ActiveSupport::TestCase
  should belong_to :branch
  context "a leaf" do
    setup { @leaf = Factory.create(:leaf) }

    should "transliterate filename" do
      assert_match /\d{1,2}-\d{1,2}-\d\d\d\d_\d{1,2}-\d{1,2}-\d{1,2}_forttree.png/, @leaf.photo_file_name
    end
    context "with content but without a photo" do
      #assert !@leaf.save
    end
    context "with photo but without content" do
      setup { @leaf = Factory.build(:leaf, :content => nil) }
      #assert !@leaf.save
    end
  end
end
