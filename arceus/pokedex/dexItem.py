from flask import render_template

class DexItem:
	template = ""

	def __init__(self, template=""):
		self.template = template

	def render(self):
		render_template(self.template)
