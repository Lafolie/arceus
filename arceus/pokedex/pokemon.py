from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text as query

class Pokemon():

	def __init__(self, id):
		self.id = id

	
def createTable(db):
	sql = query("""
		)""")
