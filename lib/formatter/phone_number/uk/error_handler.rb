module Formatter
  module PhoneNumber
    module UK
      module ErrorHandler
        class InputTypeInvalid < ArgumentError 
          def message
            'Phone number input must be a string.' 
          end
        end
        class PhoneNumberInvalid < StandardError
          def message
            'Not a valid UK phone number.'
          end
        end
      end
    end
  end
end
