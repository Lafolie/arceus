from flask import Blueprint
import arceus.test2

# bp = Blueprint('testing', __name__, url_prefix='testing')

# @bp.route('/')
def test():
	return arceus.test2.Testing()

