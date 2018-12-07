import mysql.connector
import csv

def A(str):
	return str+'-vin'
def C(str):
	



	
cnx=mysql.connector.connect(host='localhost', user='root', password='vincent', database='pcr_tables')
cursor = cnx.cursor()

query=("select kit_number FROM `multi_comp_kit_components` GROUP BY kit_number;")
cursor.execute(query)
result = cursor.fetchall()
for catno in result:
	print(appendcatno(catno[0]))






# with open('editing.csv', 'a', newline='') as f:
# 	writer = csv.writer(f)
# 	writer.writerow([4,5,6])
# 	writer.writerow([7,8,9])