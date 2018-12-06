f1 = open('multi_comp_kit_components.sql','r+')
f2 = open('new.txt','w+')
content = f1.read(100)
f2.write(content)