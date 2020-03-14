from flask import Blueprint, render_template

bp = Blueprint('kig', __name__, url_prefix='/kig')

@bp.route("/")
def kig():
	return render_template('kig.html')