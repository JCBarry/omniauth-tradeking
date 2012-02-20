require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class TradeKing < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site               => 'https://api.tradeking.com',
        :authorize_url      => 'https://developers.tradeking.com/oauth/authorize',
        :request_token_url  => 'https://developers.tradeking.com/oauth/request_token',
        :access_token_url   => 'https://developers.tradeking.com/oauth/access_token'
      }

      uid { login_id }

      info do
        {
          'uid'   => login_id,
          'name'  => "#{first_name} #{last_name}",
          'email' => email
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('https://api.tradeking.com/v1/member/profile.json').body)['response']
      end

      def first_name
        raw_info['userdata']['userprofile']['entry'].select { |r| r['name'] == 'primaryFirstName' }.first['value']
      end

      def last_name
        raw_info['userdata']['userprofile']['entry'].select { |r| r['name'] == 'primaryLastName' }.first['value']
      end

      def email
        raw_info['userdata']['userprofile']['entry'].select { |r| r['name'] == 'emailAddress1' }.first['value']
      end

      def login_id
        raw_info['userdata']['userprofile']['entry'].select { |r| r['name'] == 'login_id' }.first['value']
      end

    end
  end
end

OmniAuth.config.add_camelization 'tradeking', 'TradeKing'