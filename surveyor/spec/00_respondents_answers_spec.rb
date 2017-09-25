require 'spec_helper'

RSpec.describe '00: Respondent Answers' do
  class Response
    def self.count(responses)
      responses.count
    end

    def self.for(responses, user)
     for response in responses 
	if response[:user] == user
	  return response
      end
    end
    return nil
    end

    def self.present?(responses, user)
      responses.any? {|item| item[:user] == user}
    end

    def self.positive(responses)
      for item in responses
        return responses.count { |item| item[:answer] > 3 }
      end	
    end

    def self.negative(responses)
      for item in responses
        return responses.count { |item| item[:answer] < 3 }
      end
    end

    def self.average(responses)
      sum = 0
      len = responses.length
      for item in responses do
        sum += item[:answer]
      end
	return ( sum.to_f / len )
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
