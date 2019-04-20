require 'spec_helper'

describe Array do

  context "#all_empty" do
    it "returns true if all array element are empty" do
      expect(["", ""].all_empty?).to be_truthy
    end

    it "returns false if some elements are not empty" do
      expect(["a", 2, "", 33, Object.new].all_empty?).to be_falsey
    end
  end

  context "#all_equal" do
    it "returns true if all array element are all empty" do
      expect(["", ""].all_equal?).to be_truthy
    end

    it "returns true if all array element are the same" do
      expect(["a", "a", "a"].all_equal?).to be_truthy
    end

    it "returns false if some elements are not equal" do
      expect(["a", 2, "", 33, Object.new].all_equal?).to be_falsey
    end
  end
end
