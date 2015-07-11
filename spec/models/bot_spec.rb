require 'rails_helper'

RSpec.describe Bot, type: :model do
  it "should test 'tweet_a_quote'" do
    allow(Bot::TWITTER_REST_CLIENT).to receive(:update)
    allow(QuoteEngine).to receive(:random) { Quote.new :text => "A random quote", :author => 'Rspec' }
    expect(QuoteEngine).to receive(:random).once
    expect(Bot::TWITTER_REST_CLIENT).to receive(:update).once.with("A random quote")
    Bot.tweet_a_quote
  end

  it "should test tweet" do
    tweet = "A random quote"
    allow(Bot::TWITTER_REST_CLIENT).to receive(:update)
    expect(Bot::TWITTER_REST_CLIENT).to receive(:update).once.with(tweet)
    Bot.tweet tweet
  end
end
