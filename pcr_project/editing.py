import mysql.connector
import csv

def sku(st):
	return st+'-vin'
	
def attribute_set(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select attribute_set_name FROM `sku_attribute_set_code` where sku ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return "Default"
	else:
		return result[0]

def type():
	return "bundle"

def bundle_options(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select * FROM `multi_comp_kit_components` where kit_number ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchall()
	length = sum(1 for _ in result)
	s = "-*;"
	count = 0
	for x in result:
		s+="component"+str(count)+":"+"cname:checkbox:1:"+str(count)+";"
		count+=1
	return s[:-1]

def bundle_skus(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select * FROM `multi_comp_kit_components` where kit_number ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchall()
	s = ""
	count = 0
	for x in result:
		s+="component"+str(count)+":"+x[2]+":1:0:"+str(count)+":1:0:0;"
		count+=1
	return s[:-1]

def categories(st):
	return "Default Category"

def name(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select pname FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return st+"name"
	else:
		return result[0]

def price(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select price FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return "99999"
	else:
		return result[0]

def description(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select description FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		result = result[0].replace('\u03bc','Âµ')
		result = result.replace('\u03bb','Âλ')
		return result


def application(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select application FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		result = result[0].replace('\u03bc','Âµ')
		result = result.replace('\u03bb','Âλ')
		return result

def notes(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select notes FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		result = result[0].replace('\u03bc','Âµ')
		result = result.replace('\u03bb','Âλ')
		return result

def storage(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select storage FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		result = result[0].replace('\u03bc','Âµ')
		result = result.replace('\u03bb','Âλ')
		return result


cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
cursor = cnx.cursor()

query=("select kit_number FROM `multi_comp_kit_components` GROUP BY kit_number;")
cursor.execute(query)
result = cursor.fetchall()
bundle_list = []
for catno in result:
	bundle_list.append(catno[0])

for i in range(len(bundle_list)):
	with open('new.csv', 'a', newline='') as f:
		writer = csv.writer(f)
		writer.writerow([sku(bundle_list[i]), attribute_set(bundle_list[i]), type(), bundle_options(bundle_list[i]), bundle_skus(bundle_list[i]), categories(bundle_list[i]), name(bundle_list[i]), price(bundle_list[i])])