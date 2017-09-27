require 'spec_helper'

RSpec.describe '00: Respondent Answers' do
  class Response
    # method to count number of responses in array
    def self.count(responses)
      responses.count
    end

    # iterate through array, return answer if user matches, otherwise return nil
    def self.for(responses, user)
      responses.each do |response|
        if response[:user] == user
          return response
        end
      end
      nil
    end

    # checks to see if user has answered by looking through array
    def self.present?(responses, user)
      responses.any? { |item| item[:user] == user }
    end

    # finds answers and returns answers greater than 3
    def self.positive(responses)
      responses.each do
        return responses.count { |item| item[:answer] > 3 }
      end
    end

    # finds answers and returns answers less than 3
    def self.negative(responses)
      responses.each do
        return responses.count { |item| item[:answer] < 3 }
      end
    end

    # calculates average by finding array length and performing sum of answers
    def self.average(responses)
      sum = 0
      len = responses.length
      responses.each { |item| sum += item[:answer] }
      # to_f to ensure value is a float, also to ensure the tests pass
      (sum.to_f/len)
    end
  end

  let(:responses) do
    [
      { user: "alice@example.com", answer: 1 },
      { user: "bob@example.com", answer: 2 },
      { user: "frank@example.com", answer: 3 },
      { user: "claire@example.com", answer: 4 },
    ]
  end

  context "count" do
    it "counts the number of responses" do
      expect(Response.count(responses)).to eq(4)
    end
  end

  context "for" do
    it "finds the response from frank@example.com" do
      response = Response.for(responses, "frank@example.com")
      expect(response[:answer]).to eq(3)
    end

    it "finds the response from bob@example.com" do
      response = Response.for(responses, "bob@example.com")
      expect(response[:answer]).to eq(2)
    end
  end

  context "present?" do
    it "frank@example.com's response is present" do
      expect(Response.present?(responses, "frank@example.com")).to be true
    end

    it "bill@example.com's response is not present" do
      expect(Response.present?(responses, "bill@example.com")).to be false
    end
  end

  context "positive" do
    it "finds the positive responses (score > 3)" do
      expect(Response.positive(responses)).to eq(1)
    end
  end

  context "negative" do
    it "finds the negative responses (score < 3)" do
      expect(Response.negative(responses)).to eq(2)
    end
  end

  context "average" do
    it "finds the average of the answers" do
      expect(Response.average(responses)).to eq(2.5)
    end
  end
end
