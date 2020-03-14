from arceus.install.installTask import InstallTask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy import text

class ITask_MKDB(InstallTask):
	title = "Database Setup"
	description = 'Attempting to setup the database.'
	nextTask = 'install.mkdb'
	
	def run(self):
		db = SQLAlchemy()
		db.engine.execute("DROP TABLE IF EXISTS testtbl")

		db.engine.execute('''CREATE TABLE testtbl (
		id INT GENERATED ALWAYS AS IDENTITY,
		the_txt VARCHAR(255)
		)''')


		db.engine.execute("""PREPARE test (varchar) AS
		INSERT INTO testtbl (the_txt) VALUES($1);
		""")

		try:
			t = text("EXECUTE test(:txt)")
			db.engine.execute(t, txt='boop')
		except SQLAlchemyError as e:
			print(e._message)
			print(e._sql_message)
			self.failedText = e._message
		finally:
			print('done')

		# db.engine.execute("INSERT INTO testtbl (the_txt) VALUES ('sdsd')")

		# try:
		# 	db.engine.execute("EXECUTE test('boop')")
		# except SQLAlchemyError as e:
		# 	print(e._message)
		# 	print(e._sql_message)
		# 	self.failedText = e._message
		# finally:
		# 	print('done')

		# db.engine.execute("INSERT INTO testtbl (the_txt) VALUES ('sdsd')")

		db.engine.execute('DEALLOCATE test')
