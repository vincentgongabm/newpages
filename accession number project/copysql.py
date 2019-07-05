import urllib.request
import urllib.error
from bs4 import BeautifulSoup

def extraction(accnum):
	d = {}
	quote_page = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=' + accnum + '&usehistory=y'
	page = urllib.request.urlopen(quote_page)
	soup = BeautifulSoup(page, 'html.parser')
	webenv = soup.find('webenv')
	if webenv is None:
		d[accnum] = ["no file found"]
		return d
	url = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&query_key=1&WebEnv=' + webenv.text
	data = urllib.request.urlopen(url)
	d[accnum]=[]
	for line in data:
		if 'accession "' + accnum.split('.')[0] in line.decode("utf-8"):
			nxt = next(data).decode("utf-8").strip()
			if 'version' in nxt:
				d[accnum].append(nxt)
	f = -99999
	t = -99999
	diff = 0
	data2 = urllib.request.urlopen(url)
	for line2 in data2:
		if 'annot {' in line2.decode("utf-8"):
			while 1:
				crt = next(data2).decode("utf-8").strip()
				if(crt.startswith('from ')):
					f = int(crt[5:-1])
				if(crt.startswith('to ')):
					t = int(crt[3:-1])
				if(f != -99999 and t != -99999):
					diff = t - f + 1
					f = -99999
					t = -99999
					break
			d[accnum].append(diff)

	return d

count = 0
fr = open("textfiles/nr.txt", "r")
fw = open("textfiles/result_nr.txt", "w")
for x in fr:
	fw.write(str(extraction(x.strip())))
	fw.write('\n')
	count += 1
	if(count%50 == 0):
		print(str(int(count/50)*50) + ' finished')
