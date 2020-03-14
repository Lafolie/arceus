import os

from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from . import test1


db = SQLAlchemy()

def create_app(test_config=None):
	# create and configure the app
	app = Flask("arceus", instance_relative_config=True)
	app.config.from_mapping(
		SECRET_KEY='dev',
		# DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
	)

	if test_config is None:
		# load the instance config, if it exists, when not testing
		app.config.from_pyfile('config.py', silent=True)
	else:
		# load the test config if passed in
		app.config.from_mapping(test_config)

	# ensure the instance folder exists
	try:
		os.makedirs(app.instance_path)
	except OSError:
		pass

	# setup the db
	db.init_app(app)

	# a simple page that says hello
	@app.route('/hello')
	def hello():
		from arceus.test1 import test
		ttt = test()
		return render_template('base.html')

		# return render_template('tutorial.html')

	# register blueprints
	from arceus.pokedex import pkmntype
	app.register_blueprint(pkmntype.bp)

	from arceus.install import install
	app.register_blueprint(install)

	from arceus.kig import bp
	app.register_blueprint(bp)

	@app.teardown_request
	def teardown(ex):
		print("End of request.")


	return app

# app = create_app()
# db = SQLAlchemy(app)

# @app.route('/test')
# def dotest():
# 	# something.nope()
# 	return test1.testFunc()

# @app.route('/db')
# def dbtest():
# 	result = db.engine.execute("DROP TABLE IF EXISTS testtbl")
# 	result = db.engine.execute("CREATE TABLE testtbl (col_name INT)")
# 	print(result)
# 	return "fdfd"