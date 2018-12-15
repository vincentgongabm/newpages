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
		return ""
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
		return ""
	else:
		return result[0]

def price(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select price FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
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
		return result[0]

def additional_attributes(st):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select description FROM `prodpcr` where catNo ='" + st + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		return result[0]

cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
cursor = cnx.cursor()

query=("select kit_number FROM `multi_comp_kit_components` GROUP BY kit_number;")
cursor.execute(query)
result = cursor.fetchall()
bundle_list = []
for catno in result:
	bundle_list.append(catno[0])


print(price((bundle_list[99])))





# with open('editing.csv', 'a', newline='') as f:
# 	writer = csv.writer(f)
# 	writer.writerow(['tb1-vin,Default,bundle,-*;comp1:comp1name:checkbox:1:0;comp2:comp2name:checkbox:1:1;comp3:comp3name:checkbox:1:2,comp1:G457-1:1:0:0:1:0:0;comp2:RT-1B:1:0:1:1:0:0;comp2:RT-1B:1:0:2:1:0:0,1,0,,1,1,1,,,Default,Computer,d,sd,300,,100,1,1,1,1,4,2,Taxable goods,,,,'])