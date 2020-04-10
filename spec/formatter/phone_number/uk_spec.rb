require 'spec_helper'

describe Formatter::PhoneNumber::UK do
  subject { Formatter::PhoneNumber::UK }

  describe '#self.format' do
    context 'valid input' do
      it 'starts with +447' do
        expect { subject.format('+4471234 56789') }.not_to raise_error
      end

      it 'starts with 447' do
        expect { subject.format('4471234 56789') }.not_to raise_error
      end

      it 'starts with 07' do
        expect { subject.format('071234 56789') }.not_to raise_error
      end
    end

    context 'invalid input' do
      it 'raises error when phone number does not start with +447, 447 or 07' do
        expect { subject.format('0634343') }.to raise_error(subject::ErrorHandler::PhoneNumberInvalid, 'Not a valid UK phone number.')
      end

      it 'raises error when phone number contains non numeric characters' do
        expect { subject.format('+44123ABCdef$%^*&') }.to raise_error(subject::ErrorHandler::PhoneNumberInvalid, 'Not a valid UK phone number.')
      end

      it 'is not a string' do
        expect { subject.format(123_456_789) }.to raise_error(subject::ErrorHandler::InputTypeInvalid, 'Phone number input must be a string.')
      end
    end

    context 'output validation' do
      it 'removes any whitespace' do
        formatted_number = subject.format('447 1234 56789')
        expect(formatted_number =~ /\s/).to be_nil
      end

      it 'formats phone number from +447 to +447' do
        formatted_number = subject.format('+447 1234 56789')
        expect(formatted_number).to eql('+447123456789')
      end

      it 'formats phone number from 447 to +447' do
        formatted_number = subject.format('447 1234 56789')
        expect(formatted_number).to eql('+447123456789')
      end

      it 'formats phone number from 07 to +447' do
        formatted_number = subject.format('07 1234 56789')
        expect(formatted_number).to eql('+447123456789')
      end
    end
  end
end
