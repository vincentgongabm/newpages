#inquiryurl = '/project-design-service-inquiry'
f = open('working.html', 'r+')
content = f.read()

left = '<p><button class="custom-service-inquire-button-normal" style="float: left;">Inquire</button></p>'

right = '<p><button class="custom-service-inquire-button-normal" style="float: right;">Inquire</button></p>'

#newleft = '<p><a href="'+inquiryurl+'" target="_blank"><button class="custom-service-inquire-button-normal" style="float: left;">Inquire</button></a></p>'
#newright = '<p><a href="'+inquiryurl+'" target="_blank"><button class="custom-service-inquire-button-normal" style="float: right;">Inquire</button></a></p>'

newleft = '<p><a href="mailto:ngs@abmgood.com"><button class="custom-service-inquire-button-normal" style="float: left;">Inquire</button></a></p>'
newright = '<p><a href="mailto:ngs@abmgood.com"><button class="custom-service-inquire-button-normal" style="float: right;">Inquire</button></a></p>'
str = content.replace(left, newleft)
str1 = str.replace(right, newright)
str2 = str1.replace('<span class="customServicePriceGeoIP">','')
str3 = str2.replace('00</span>','00')
fo = open('result.html', 'w+')
fo.write(str3)


