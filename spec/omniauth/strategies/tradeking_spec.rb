require 'spec_helper'

describe OmniAuth::Strategies::TradeKing do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::TradeKing.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct TradeKing site' do
      subject.options.client_options.site.should eq('https://api.tradeking.com')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://developers.tradeking.com/oauth/authorize')
    end

    it 'has correct request token url' do
      subject.options.client_options.request_token_url.should eq('https://developers.tradeking.com/oauth/request_token')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_url.should eq('https://developers.tradeking.com/oauth/access_token')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:login_id) { 'omgbbqlol' }
      subject.uid.should eq('omgbbqlol')
    end
  end

  describe '#info' do
    before :each do
      subject.stub(:first_name) { 'James' }
      subject.stub(:last_name) { 'Brown' }
      subject.stub(:email) { 'jbrown@gmail.com' }
      subject.stub(:login_id) { '12345' }
    end

    context 'when data is present in raw info' do
      it 'returns the name' do
        subject.info['name'].should eq('James Brown')
      end

      it 'returns the email' do
        subject.info['email'].should eq('jbrown@gmail.com')
      end
    end
  end

  describe '#extra' do
    before :each do
      @raw_info_hash = { "accounts" => [] }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end