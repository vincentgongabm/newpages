-- start query catalog list
SELECT
	cce.*,
	ccev.`value`
FROM
	`catalog_category_entity` cce
	 inner JOIN catalog_category_entity_varchar ccev on ccev.entity_id=cce.entity_id and ccev.attribute_id=45
WHERE
	( cce.`level` <= 4 )
ORDER BY
	cce.`path` ASC;

	-- loop query count of catalog
	SELECT
		count(distinct (ccp.product_id))
	FROM
		`catalog_category_product` AS ccp
		INNER JOIN `catalog_category_entity` AS cce ON ccp.category_id = cce.entity_id
	WHERE
		( cce.entity_id = '4' )
		OR ( cce.path LIKE '1/2/4/%' );
	-- end loop query count of catalog
-- end query catalog list

-- start query attributes
SELECT
        `attribute_id`,
        `attribute_code`,
        `backend_type`,
        `frontend_input`,
        `frontend_label`
FROM
        eav_attribute
WHERE
        entity_type_id = 4
AND (
        is_user_defined = 1
        OR attribute_code IN (
                'price',
                'name'
        )
)
ORDER BY
        `frontend_label`;
-- end query attributes

-- start query entity_id list
SELECT
        ccp.product_id as `product_id`
FROM
        `catalog_category_product` ccp
LEFT JOIN `catalog_product_entity_varchar` cpev ON ccp.product_id = cpev.entity_id
WHERE
        ccp.category_id = '58'
AND cpev.store_id = '0'
AND cpev.attribute_id = 142 AND cpev.`value` = '11838' -- ssn value=11838
limit 10;

	-- start query attribute value of each entity_id
	---- ssn attribute_id = 142
	---- productName attribute_id = 73
	---- accessionNumber attribute_id = 244
	SELECT cpev.`value` as ssn FROM `catalog_product_entity_varchar` cpev where entity_id = '89074' and attribute_id = '142' and store_id = '0' and `value` = '11838';
	SELECT cpev.`value` as productName FROM `catalog_product_entity_varchar` cpev where entity_id = '89074' and attribute_id = '73' and store_id = '0';
	SELECT cpev.`value` as accessionNumber FROM `catalog_product_entity_varchar` cpev where entity_id = '89083' and attribute_id = '244' and store_id = '0';
	-- end query attribute value of each entity_id
-- end query entity_id list

-- start 查询category_id=58 and ssn=11838的所有产品的ProductName
select a.*,cpev2.`value` as 73_product_name from (
	-- find all product ids which ssn=11838
	SELECT
					ccp.product_id as `product_id`,
					cpev.`value` as 142_ssn
	FROM
					`catalog_category_product` ccp
	LEFT JOIN `catalog_product_entity_varchar` cpev ON ccp.product_id = cpev.entity_id
	WHERE
		ccp.category_id = '58'
		AND cpev.store_id = '0'
		AND cpev.attribute_id = 142 AND cpev.`value` = '11838' -- ssn value=11838
) a

left JOIN `catalog_product_entity_varchar` cpev2 on cpev2.entity_id=a.product_id
where cpev2.store_id = '0' and cpev2.attribute_id = 73 -- ProductName
limit 100;
-- end 查询category_id=58 and ssn=11838的所有产品的ProductName


-- start 根据sku查找产品名称
select a.*,cpev.`value` as product_name from (
	-- find all product ids which sku like 'G065%'
	SELECT
					ccp.product_id,
					cpe.sku
	FROM
					`catalog_category_product` ccp
	LEFT JOIN `catalog_product_entity` cpe ON ccp.product_id = cpe.entity_id
	WHERE
		cpe.sku like 'G065%'
) a

left JOIN `catalog_product_entity_varchar` cpev on cpev.entity_id=a.product_id
where cpev.attribute_id = 73 -- ProductName
limit 100;
-- end 根据sku查找产品名称