# installation views
from flask import Blueprint, render_template

install = Blueprint('install', __name__, url_prefix='/install', static_folder='static', template_folder='templates')

@install.route('/', methods=['GET', 'POST'])
@install.route('/welcome', methods=['GET', 'POST'])
def welcome():
	from arceus.install.welcome import ITask_Welcome
	task = ITask_Welcome()
	return task.render()

@install.route('/mkdb', methods=['GET', 'POST'])
def mkdb():
	from arceus.install.mkdb import ITask_MKDB
	task = ITask_MKDB()

	return task.render()
