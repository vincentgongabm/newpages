import mysql.connector
import csv

def sku(str):
	return str+'-vin'
	
def attribute_set(str):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select attribute_set_name FROM `sku_attribute_set_code` where sku ='" + str + "';")
	cursor.execute(query)
	result = cursor.fetchone()
	if result is None:
		return ""
	else:
		return result[0]

def type():
	return "bundle"

def bundle_options(str):
	cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
	cursor = cnx.cursor()

	query=("select * FROM `multi_comp_kit_components` where kit_number ='" + str + "';")
	cursor.execute(query)
	result = cursor.fetchall()
	length = sum(1 for _ in result)
	s = "-*;"
	count = 1
	for x in result:
		s+="component"+count
	
cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
cursor = cnx.cursor()

query=("select kit_number FROM `multi_comp_kit_components` GROUP BY kit_number;")
cursor.execute(query)
result = cursor.fetchall()
bundle_list = []
for catno in result:
	bundle_list.append(catno[0])


bundle_options((bundle_list[0]))





# with open('editing.csv', 'a', newline='') as f:
# 	writer = csv.writer(f)
# 	writer.writerow(['tb1-vin,Default,bundle,-*;comp1:comp1name:checkbox:1:0;comp2:comp2name:checkbox:1:1;comp3:comp3name:checkbox:1:2,comp1:G457-1:1:0:0:1:0:0;comp2:RT-1B:1:0:1:1:0:0;comp2:RT-1B:1:0:2:1:0:0,1,0,,1,1,1,,,Default,Computer,d,sd,300,,100,1,1,1,1,4,2,Taxable goods,,,,'])