SELECT * FROM `catalog_product_entity` where sku =3694010;-- find product
SELECT * FROM `catalog_product_entity_text` where entity_id=17844744 and attribute_id=440;-- find attributes available sku:440 inquiry sku: 453

SELECT * FROM `catalog_product_option` where product_id = 17844744;-- find option id
SELECT * FROM `catalog_product_option_type_value` where option_id=3174778;-- find option sku
SELECT * FROM `catalog_product_option_type_title` where option_type_id=19862526;-- find option title
SELECT * FROM `catalog_product_option_type_price` where option_type_id=22018085;-- find option price

SELECT * FROM `abm_customsearch` where catno = 369401011810;