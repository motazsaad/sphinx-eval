import os, fnmatch
import argparse


parser = argparse.ArgumentParser(description='speech decoder')
parser.add_argument('-i', '--infile', type=str,
                    help='input wave file', required=True)
parser.add_argument('-o', '--outfile', type=str,
                    help='output text file', required=True)


if __name__ == '__main__':
	args = parser.parse_args()
	wav_file_dir = args.infile
	out_file = args.outfile
	listOfFiles = os.listdir(wav_file_dir)  
	for wfile in listOfFiles:  
	    if fnmatch.fnmatch(wfile, "*.wav" ):
		    wavefile=wav_file_dir+"/"+wfile
		    cmd='python run_decoder.py -i ' + wavefile + '  -o /home/motaz/tmp/'+wfile
		    print(cmd)
		    os.system(cmd)
	with open(out_file, 'w') as outfile:
		listOfFiles = os.listdir('/home/motaz/tmp')  
		for wfile in listOfFiles:  
	    		if fnmatch.fnmatch(wfile, "*.wav" ):
		    		with open('/home/motaz/tmp/'+wfile) as infile:
            				for line in infile:
                				outfile.write(line+' <'+wfile+'>\n')
