from __future__ import unicode_literals

from flask import Flask, render_template

app = Flask(__name__, 
			template_folder='resources',
			static_folder='bower_components')

@app.route('/')
def home():
	return render_template('index.html')

if __name__=='__main__':
	app.run(host='localhost', 
			port=8000, 
			debug=True)