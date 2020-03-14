import urllib.request
import time
import os.path
import argparse

# config
numPokes = 890

# get args
parser = argparse.ArgumentParser("yoink")
parser.add_argument('--forceicon', help='Prevents skipping of existing icon files (redownloads everything)', action='store_true')
parser.add_argument('--forceart', help='Prevents skipping of existing art files (redownloads everything)', action='store_true')
# parser.add_argument('num', help='Number of Pokémon to download', type=int)
args = parser.parse_args()

numPokes += 1



print('Starting download...')
for n in range(1, numPokes):
	fname = "icons/%03d.png" % n
	wait = False
	if args.forceicon or not os.path.isfile(fname):
		url = "https://www.serebii.net/pokedex-swsh/icon/%03d.png" % n
		urllib.request.urlretrieve(url, fname)
		print('\t[icon] %03d/890' % n)
		wait = True

	fname = 'art/%03d.png' % n
	if args.forceart or not os.path.isfile(fname):
		url = "https://serebii.net/pokemon/art/%003d.png" % n
		urllib.request.urlretrieve(url, fname)
		print('\t[art] %03d/890' % n)
		wait = True

	# Probably a good idea so that the server doesn't reject us
	if wait:
		time.sleep(0.05)