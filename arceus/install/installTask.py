from flask import render_template, url_for
import time

class InstallTask():
	title = 'New Install Task'
	description = 'A new install task'
	passedText = 'Click next to proceed.'
	failedText = 'Click retry.'
	# logLines = []
	nextTask = 'install.welcome'
	passed = True

	def __init__(self):
		self.logLines = []
		self.run()

	def render(self):
		print(len(self.logLines))
		self.nextTask = url_for(self.nextTask)
		html = render_template('install.html', task=self)
		self.log("After first render")
		return html

	def log(self, str):
		str = "[{}] {}".format(time.strftime('%H:%M:%S'), str)
		self.logLines.append(str)

	# Callback for the task program
	def run(self):
		pass