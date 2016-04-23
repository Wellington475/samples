#!/usr/bin/env python
# -*- coding: utf8 -*-

from __future__ import unicode_literals

import logging
from apscheduler.schedulers.blocking import BlockingScheduler
from tweepy import Stream
from streaming import TwitterStreamListener, auth

logging.basicConfig(level=logging.WARNING)

listener = TwitterStreamListener()
sched = BlockingScheduler()

@sched.scheduled_job('interval', seconds=15)
def twitter_streaming():
	stream = Stream(auth, listener)
	stream.filter(track=['python', 'javascript', 'ruby'])

if __name__=='__main__':
	try:
		sched.start()
	except Exception, e:
		sched.shutdown()