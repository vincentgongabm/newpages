select concat(option12.productsku, option12.option1sku, option12.option2sku, option3.sku) as finalsku from 
(select option1.productsku, option1.sku as option1sku, option2.sku as option2sku from 
(select productskufirstoptionvaluetable.productsku, catalog_product_option_type_value.sku from catalog_product_option_type_value JOIN
(SELECT catalog_product_entity.sku as productsku,  productoptiontable.min as firstoption FROM
catalog_product_entity JOIN
(SELECT producttable.product_id, MIN(optiontable.option_id) as min
FROM `catalog_category_product` AS producttable
JOIN `catalog_product_option` AS optiontable
on producttable.product_id = optiontable.product_id
WHERE producttable.category_id = 5 and producttable.product_id != 17231559
group by producttable.product_id) as productoptiontable
on catalog_product_entity.entity_id = productoptiontable.product_id) as productskufirstoptionvaluetable
on productskufirstoptionvaluetable.firstoption = catalog_product_option_type_value.option_id) as option1

join

(select productskusecondoptionvaluetable.productsku, catalog_product_option_type_value.sku from catalog_product_option_type_value JOIN
(SELECT catalog_product_entity.sku as productsku,  productoptiontable.mid as secondoption FROM
catalog_product_entity JOIN
(SELECT producttable.product_id, MAX(optiontable.option_id)-1 as mid
FROM `catalog_category_product` AS producttable
JOIN `catalog_product_option` AS optiontable
on producttable.product_id = optiontable.product_id
WHERE producttable.category_id = 5 and producttable.product_id != 17231559
group by producttable.product_id) as productoptiontable
on catalog_product_entity.entity_id = productoptiontable.product_id) as productskusecondoptionvaluetable
on productskusecondoptionvaluetable.secondoption = catalog_product_option_type_value.option_id) as option2
on option1.productsku = option2.productsku)
as option12

JOIN

(select productskuthirdoptionvaluetable.productsku, catalog_product_option_type_value.sku from catalog_product_option_type_value JOIN
(SELECT catalog_product_entity.sku as productsku,  productoptiontable.max as thridoption FROM
catalog_product_entity JOIN
(SELECT producttable.product_id, MAX(optiontable.option_id) as max
FROM `catalog_category_product` AS producttable
JOIN `catalog_product_option` AS optiontable
on producttable.product_id = optiontable.product_id
WHERE producttable.category_id = 5 and producttable.product_id != 17231559
group by producttable.product_id) as productoptiontable
on catalog_product_entity.entity_id = productoptiontable.product_id) as productskuthirdoptionvaluetable
on productskuthirdoptionvaluetable.thridoption = catalog_product_option_type_value.option_id) as option3

on option12.productsku = option3.productsku 