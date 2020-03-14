from arceus.install.installTask import InstallTask

class ITask_Welcome(InstallTask):
	title = "Welcome to the Arceus Installer"
	description = '''<p>The first install task will attempt to create all the tables for the database.</p>
	<div class="alert alert-warning">&#9888; Existing tables will be dropped! Be sure to backup any important information before continuing.</div>
	'''

	nextTask = 'install.mkdb'