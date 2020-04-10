# uk-phone-number-formatter
Twilio is used to send customers SMS messages for order reminders and other useful information about their delivery. Twilio requires the phone number to be formatted correctly before being sent to Twilio, including the +44 prefix.

This feature formats and validates a UK phone number to be used by Twilio. Customers are able to input their phone number in any of the following formats:

- +447..
- 447..
- 07..

## Approach
I used a Test Driven Development approach to build specs for the
Formatter::PhoneNumber::UK#format method, starting with input and output validation.

For input validation, all the whitespace is removed and then tested with a regular expression. The regular expression checks if the phone number starts with either +447, 447 or 07, followed by 9 digits. Anything other than this format is returned as an invalid UK phone number.

This feature requires output phone numbers to have the +447 prefix format. This was tackled by substituting the sub-string 447 or 07 with +447 in a valid UK phone number. A string replace with regular expression performs the substitution. The regular expression looks for a sub-string starting with either 447 or 07.

Error handler module for custom exception classes.

## Future Improvements and Limitations
- Implement the handling of exceptions in UK mobile phone numbers
- Error handling and messaging could be more concise
- UK only

## Getting Started
- This project requires Ruby 2.6.5
- Download or clone this repository
- Install the gem dependencies

```
bundle install
```

## Usage
- Require the module in your code
```
require 'formatter/phone_number/UK'
```
- Invoke the format method with phone number string input
```
Formatter::PhoneNumber::UK.format('+447 1234 56789')
```

## Testing
- This feature was tested using RSpec
- To run the tests, navigate to the root folder and execute the command:
```
rspec
```

## Built With
- Ruby 2.6.5
- RSpec
