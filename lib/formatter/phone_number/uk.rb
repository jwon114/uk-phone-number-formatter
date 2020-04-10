require 'formatter/phone_number/uk/error_handler'

module Formatter
  module PhoneNumber
    module UK
      VALID_UK_PHONE_NUMBER = /(^\+447[0-9]{9}$)|(^07[0-9]{9}$)|(^447[0-9]{9}$)/.freeze
      UK_COUNTRY_CODE = /(^07)|(^447)/.freeze

      def self.format(number)
        raise Formatter::PhoneNumber::UK::ErrorHandler::InputTypeInvalid unless number.is_a? String
        number.gsub!(/\s+/, '')
        raise Formatter::PhoneNumber::UK::ErrorHandler::PhoneNumberInvalid unless valid?(number)
        number.sub(UK_COUNTRY_CODE, '+447')
      end

      def self.valid?(number)
        number.match?(VALID_UK_PHONE_NUMBER)
      end
    end
  end
end