require 'rails_helper'
require_relative '../../app/services/simple_string_calculator'

RSpec.describe SimpleStringCalculator do
  let(:calculator) { described_class.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum for a two number string" do
      expect(calculator.add("1,2")).to eq(3)
    end

    it "returns the sum for multiple number strings" do
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it "handles new lines between numbers" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "supports different delimiters" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception for negative numbers" do
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it "raises an exception for multiple negative numbers" do
      expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end
  end
end