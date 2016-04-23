# -*- coding: utf8 -*-

import logging
import settings
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener

logging.basicConfig(level=logging.WARNING)

auth = OAuthHandler(settings.CONSUMER_KEY, settings.CONSUMER_SECRET)
auth.set_access_token(settings.ACCESS_TOKEN, settings.ACCESS_TOKEN_SECRET)

class TwitterStreamListener(StreamListener):
	def on_data(self, data):
		logging.warning(data)
		return True

	def on_error(self, status):
		print status

