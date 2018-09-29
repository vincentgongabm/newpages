import math, re
from bs4 import BeautifulSoup, Comment
f = open('working.html', 'r+')
fo = open('related.html', 'w+')
fo2 = open('faqs.html', 'w+')
content = f.read()
soup = BeautifulSoup(content, "html.parser")
#product = soup.find_all('div',attrs={"class" : "banners"})
#str1=""
#str1+='<div id="abm-category-section4" class="abm-container-fluid">\n<div class="row">\n<div class="col-lg-8">\n<h3 class="abm-perfect-h3">Related Products</h3>\n<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">\n<div class="row">\n<div class="module">\n<ul class="htmlcontent-home">\n<li class="col-xs-6 col-sm-6 col-md-6">\n'+product[0].prettify().replace("black-link", "orange-link").replace("related-products-services.png", "Related-Products-tube.png")+'</li>\n<li class="col-xs-6 col-sm-6 col-md-6">\n'+product[1].prettify().replace("black-link", "orange-link").replace("related-products-services.png", "Related-Products-tube.png")+'</li>\n</ul>\n</div>\n</div>\n</div>\n<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">\n<div class="row">\n<div class="module">\n<ul class="htmlcontent-home">\n<li class="col-xs-6 col-sm-6 col-md-6">\n'+product[2].prettify().replace("black-link", "orange-link").replace("related-products-services.png", "Related-Products-tube.png")+'</li>\n<li class="col-xs-6 col-sm-6 col-md-6">\n'
#if len(product) == 3:
#    str1+='</li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n<div class="col-lg-4"></div>\n</div>\n</div>'
#elif len(product) == 4:
#    str1+=product[3].prettify().replace("black-link", "orange-link").replace("related-products-services.png", "Related-Products-tube.png")+'</li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n<div class="col-lg-4"></div>\n</div>\n</div>'
#fo.write("\n"+str1)


question = soup.find_all('b',attrs={"class" : "customfaq"})
answer = soup.find_all('div',attrs={"class" : "abm-perfect-faqs-text"})
num = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
str='<div id="abm-category-section6" class="abm-container-fluid">\n<div class="row">\n<div class="col-lg-8">\n<h3 class="abm-perfect-h3">FAQs</h3>\n'
for i in range(len(question)):
    str+='<table>\n<tbody>\n<tr>\n<td style="padding: 8px 0; width: 37px;"><a href="#collapse'+num[i]+'" data-toggle="collapse" data-parent="#accordion"> <i class="fa fa-angle-down OrderAngleDown"></i> </a></td>\n<td><a href="#collapse'+num[i]+'" data-toggle="collapse" data-parent="#accordion"><b class="customfaq black-link">'+question[i].text+'</b></a></td>\n</tr>\n</tbody>\n</table>\n<table>\n<tbody>\n<tr>\n<td>\n<div id="collapse'+num[i]+'" class="panel-collapse collapse">\n<div class="abm-perfect-faqs-text">\n'+answer[i].text.strip()+'\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n'
str+='</div>\n<div class="col-lg-4"></div>\n</div>\n</div>'
fo2.write("\n"+str)

