# Apidocbot

A simple bot to generate api docs

## Installation

Add this line to your application's Gemfile:

    gem 'apidocbot', :git => 'git@github.com:yanguango/apidocbot.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apidocbot

## Usage
###1. generate apidocbot templates
	rails generate apidocbot
	
###2. write your api doc yaml files
Example:

		'GET /users/:id':
		  description: 'Get specified users'
		  params:
		  example_request: 'http://example.com/api/users/1'
		  example_response: |
		    {
		      "id":1,
		      "name":"samyang",
		      "birthday":"1986-09-22",
		      "gender":"male",
		      "created_at":"2012-03-23 14:06:25"
		    }

###3. run rake task to generate your api doc		
	rake apidocbot
the result api doc will be in the output.html

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
