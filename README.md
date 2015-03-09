[![Build Status](https://travis-ci.org/amwelch-oss/hubot-influxdb-alerts.svg?branch=master)](https://travis-ci.org/amwelch-oss/hubot-influxdb-alerts) [![Coverage Status](https://coveralls.io/repos/amwelch-oss/hubot-confluence/badge.svg?branch=master)](https://coveralls.io/r/amwelch-oss/hubot-confluence?branch=master) [![npm version](https://badge.fury.io/js/hubot-confluence.svg)](http://badge.fury.io/js/hubot-confluence)

## hubot-confluence
Automatically respond to questions in chat with a relevant confluence article.

##Features

INSERT SAMPLE IMAGES

##Installation

npm install hubot-confluence --save

Then add hubot-confluence to your external-scripts.json

["hubot-confluence"]


##Configuration

hubot-confluence requires an atlassian account with read access to your organization's confluence

hubot-confluence supports the following environment variables for configuration.

_Required_:

	HUBOT_CONFLUENCE_USER			#Atlassian User
	HUBOT_CONFLUENCE_PASSWORD		#Atlassian Password
	HUBOT_CONFLUENCE_HOST		
	HUBOT_CONFLUENCE_PORT
	HUBOT_CONFLUENCE_SEARCH_SPACE 	#The confluence space to search
    
_Optional_:

	HUBOT_CONFLUENCE_NUM_RESULTS  	#The number of results to return. Defaults to 1.
	HUBOT_CONFLUENCE_TIMEOUT  		#Timeout in ms for requests to confluence. Default is no timeout

##Commands


	confluence show triggers	#Show the current trigger regexs
    confluence help				#Show this text
    confluence search TEXT		#Run a text search against the phrase TEXT


##Author

Alexander Welch <amwelch3@gmail.com>

##License

MIT
