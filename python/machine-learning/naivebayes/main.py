from math import log

tweets = [
	('feel', 'yes'),
	('happy', 'yes'),
	('Larry', 'no'),
]

total = float(len(tweets))

labels = {
	'yes': float(2),
	'no': float(1)
}

def probability(a, b):
	return (float(a)/float(b))

def naivebayes(term):
	"""
	P(sentiment|term) = P(term | sentiment) * P(sentiment) / P(term)
	"""
	prob = {}

	for sentiment in labels.keys():
		_count = 0
		
		for tweet, label in tweets:
			if label==sentiment and tweet==term:
				_count += 1

		prob[sentiment] = probability(_count, labels[sentiment])
		prob[sentiment] *= probability(labels[sentiment], total)
		prob[sentiment] /= log(probability(float(1), total)) # Used log to normalize

	return prob

if __name__=='__main__':
	print naivebayes('happy')