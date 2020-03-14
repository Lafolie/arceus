from flask import Blueprint, render_template, request, url_for

bp = Blueprint('dexType', __name__, url_prefix='/type')



class PType:
	name = 'New Type'
	color = 'ffffff'

	def __init__(self, name, color):
		self.name = name
		self.color = color
