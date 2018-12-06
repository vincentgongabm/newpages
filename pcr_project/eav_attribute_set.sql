/*
Navicat MySQL Data Transfer

Source Server         : BitnamiAWS
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : bitnami_magento

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-12-05 16:05:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eav_attribute_set
-- ----------------------------
DROP TABLE IF EXISTS `eav_attribute_set`;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`) USING BTREE,
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`) USING BTREE,
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`) USING BTREE,
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Eav Attribute Set';

-- ----------------------------
-- Records of eav_attribute_set
-- ----------------------------
INSERT INTO `eav_attribute_set` VALUES ('1', '1', 'Default', '2');
INSERT INTO `eav_attribute_set` VALUES ('2', '2', 'Default', '2');
INSERT INTO `eav_attribute_set` VALUES ('3', '3', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('4', '4', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('5', '5', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('6', '6', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('7', '7', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('8', '8', 'Default', '1');
INSERT INTO `eav_attribute_set` VALUES ('10', '4', 'system', '0');
INSERT INTO `eav_attribute_set` VALUES ('11', '4', 'Lyssa_Test_2_qpcr', '0');
INSERT INTO `eav_attribute_set` VALUES ('12', '4', 'Cas9-Expressing Vectors and Viruses', '0');
INSERT INTO `eav_attribute_set` VALUES ('13', '4', 'dntps_ntps', '0');
INSERT INTO `eav_attribute_set` VALUES ('14', '4', 'CRISPR Negative Controls', '0');
INSERT INTO `eav_attribute_set` VALUES ('15', '4', 'allen_test', '0');
INSERT INTO `eav_attribute_set` VALUES ('17', '4', 'CRISPR Cell Line Service', '0');
INSERT INTO `eav_attribute_set` VALUES ('18', '4', 'Cas9-Expressing Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('19', '4', 'button test', '0');
INSERT INTO `eav_attribute_set` VALUES ('20', '4', 'textbuttontest', '0');
INSERT INTO `eav_attribute_set` VALUES ('21', '4', 'CRISPR Vector-Virus Service', '0');
INSERT INTO `eav_attribute_set` VALUES ('23', '4', 'Cas9 Proteins', '0');
INSERT INTO `eav_attribute_set` VALUES ('25', '4', 'growth factors', '0');
INSERT INTO `eav_attribute_set` VALUES ('26', '4', 'active kinases', '0');
INSERT INTO `eav_attribute_set` VALUES ('27', '4', 'Enzymes', '0');
INSERT INTO `eav_attribute_set` VALUES ('28', '4', 'miRNA Expression', '0');
INSERT INTO `eav_attribute_set` VALUES ('29', '4', 'miRNA Controls', '0');
INSERT INTO `eav_attribute_set` VALUES ('30', '4', 'Antibody', '0');
INSERT INTO `eav_attribute_set` VALUES ('31', '4', 'Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('32', '4', 'miRNA Inhibitors', '0');
INSERT INTO `eav_attribute_set` VALUES ('33', '4', 'miRNA qPCR Primer Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('34', '4', 'miRNA Detection Controls', '0');
INSERT INTO `eav_attribute_set` VALUES ('35', '4', 'attributeSet-allen-001', '0');
INSERT INTO `eav_attribute_set` VALUES ('36', '4', 'Gene Expression Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('37', '4', 'siRNA', '0');
INSERT INTO `eav_attribute_set` VALUES ('38', '4', '3UTR Reporter Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('39', '4', 'attrSetTest001', '0');
INSERT INTO `eav_attribute_set` VALUES ('40', '4', 'attrSetTest1', '0');
INSERT INTO `eav_attribute_set` VALUES ('42', '4', 'CRISPR Knockout Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('43', '4', 'CRISPR Activation Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('44', '4', 'Expression Systems', '0');
INSERT INTO `eav_attribute_set` VALUES ('48', '4', 'Other Viral Expression', '0');
INSERT INTO `eav_attribute_set` VALUES ('49', '4', 'Primary and Immortalized Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('50', '4', 'ORF library', '0');
INSERT INTO `eav_attribute_set` VALUES ('51', '4', 'Stem Cell Characterization Kits', '0');
INSERT INTO `eav_attribute_set` VALUES ('53', '4', 'miRNA Synthesis Kit', '0');
INSERT INTO `eav_attribute_set` VALUES ('54', '4', 'iPSC Small Molecule', '0');
INSERT INTO `eav_attribute_set` VALUES ('55', '4', 'Feeder Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('56', '4', 'Tumor Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('57', '4', 'Ready-to-Use Stem Cells', '0');
INSERT INTO `eav_attribute_set` VALUES ('58', '4', 'Transfection Reagents', '0');
INSERT INTO `eav_attribute_set` VALUES ('59', '4', 'IHC Slides', '0');
INSERT INTO `eav_attribute_set` VALUES ('63', '4', 'Western Blotting Reagents', '0');
INSERT INTO `eav_attribute_set` VALUES ('64', '4', 'IHC Reagents', '0');
INSERT INTO `eav_attribute_set` VALUES ('65', '4', 'ELISA Reagents', '0');
INSERT INTO `eav_attribute_set` VALUES ('66', '4', 'Drug Discovery Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('67', '4', 'Reporter Cell Lines', '0');
INSERT INTO `eav_attribute_set` VALUES ('68', '4', 'Protein Vector Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('69', '4', 'Protein Lysate Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('71', '4', 'iPSC Programming Factors', '0');
INSERT INTO `eav_attribute_set` VALUES ('72', '4', 'Cell Immortalization Reagents', '0');
INSERT INTO `eav_attribute_set` VALUES ('73', '4', 'Cell Biology Reagents and Stem Cell Media', '0');
INSERT INTO `eav_attribute_set` VALUES ('74', '4', 'Antibiotics', '0');
INSERT INTO `eav_attribute_set` VALUES ('76', '4', 'iPSC Plasmids', '0');
INSERT INTO `eav_attribute_set` VALUES ('77', '4', 'Custom Cloning', '0');
INSERT INTO `eav_attribute_set` VALUES ('78', '4', 'iPSC Proteins', '0');
INSERT INTO `eav_attribute_set` VALUES ('79', '4', 'Chemicals for Molecular Biology', '0');
INSERT INTO `eav_attribute_set` VALUES ('80', '4', 'Recombinant Protein Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('84', '4', 'DNA Markers', '0');
INSERT INTO `eav_attribute_set` VALUES ('85', '4', 'Protein Markers', '0');
INSERT INTO `eav_attribute_set` VALUES ('93', '4', 'DNA RNA Cleaning', '0');
INSERT INTO `eav_attribute_set` VALUES ('97', '4', 'siRNA Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('99', '4', 'Proteases', '0');
INSERT INTO `eav_attribute_set` VALUES ('100', '4', 'Antibody Purification', '0');
INSERT INTO `eav_attribute_set` VALUES ('101', '4', 'Agarose Resins', '0');
INSERT INTO `eav_attribute_set` VALUES ('102', '4', 'Cell Lysates and Total RNA', '0');
INSERT INTO `eav_attribute_set` VALUES ('104', '4', 'Diagnostic Kits', '0');
INSERT INTO `eav_attribute_set` VALUES ('105', '4', 'Pipettes', '0');
INSERT INTO `eav_attribute_set` VALUES ('106', '4', 'Multiwell Plates', '0');
INSERT INTO `eav_attribute_set` VALUES ('107', '4', 'Flasks', '0');
INSERT INTO `eav_attribute_set` VALUES ('108', '4', 'Cell culture plates', '0');
INSERT INTO `eav_attribute_set` VALUES ('109', '4', 'Bioreactor', '0');
INSERT INTO `eav_attribute_set` VALUES ('110', '4', 'Microtubes', '0');
INSERT INTO `eav_attribute_set` VALUES ('111', '4', 'Pipette tips', '0');
INSERT INTO `eav_attribute_set` VALUES ('112', '4', 'Custom Services', '0');
INSERT INTO `eav_attribute_set` VALUES ('113', '4', 'AAV Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('114', '4', 'Freezers', '0');
INSERT INTO `eav_attribute_set` VALUES ('115', '4', 'Freezing container', '0');
INSERT INTO `eav_attribute_set` VALUES ('116', '4', 'Lab furniture', '0');
INSERT INTO `eav_attribute_set` VALUES ('117', '4', 'Gel Documentation Systems', '0');
INSERT INTO `eav_attribute_set` VALUES ('118', '4', 'Adenovirus Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('119', '4', 'Spectrophotometers', '0');
INSERT INTO `eav_attribute_set` VALUES ('120', '4', 'Gel Systems', '0');
INSERT INTO `eav_attribute_set` VALUES ('121', '4', 'Nitrogen Tanks', '0');
INSERT INTO `eav_attribute_set` VALUES ('122', '4', 'Incubators', '0');
INSERT INTO `eav_attribute_set` VALUES ('123', '4', 'Vacuums', '0');
INSERT INTO `eav_attribute_set` VALUES ('124', '4', 'Used Equipment', '0');
INSERT INTO `eav_attribute_set` VALUES ('125', '4', 'Centrifuges', '0');
INSERT INTO `eav_attribute_set` VALUES ('126', '4', 'Illuminators and UV Equipment', '0');
INSERT INTO `eav_attribute_set` VALUES ('127', '4', 'Retrovirus Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('128', '4', 'Lentivirus Library', '0');
INSERT INTO `eav_attribute_set` VALUES ('129', '4', 'PCR Optimization', '0');
INSERT INTO `eav_attribute_set` VALUES ('130', '4', 'DNA Polymerases', '0');
INSERT INTO `eav_attribute_set` VALUES ('131', '4', 'Real Time PCR', '0');
INSERT INTO `eav_attribute_set` VALUES ('132', '4', 'PCR Tubes', '0');
INSERT INTO `eav_attribute_set` VALUES ('133', '4', 'PCR Plates', '0');
INSERT INTO `eav_attribute_set` VALUES ('134', '4', 'SafeView Series', '0');
INSERT INTO `eav_attribute_set` VALUES ('135', '4', 'PCR films', '0');
INSERT INTO `eav_attribute_set` VALUES ('136', '4', 'CRISPR Validation and Screening', '0');
INSERT INTO `eav_attribute_set` VALUES ('137', '4', 'NGS services', '0');
INSERT INTO `eav_attribute_set` VALUES ('138', '4', 'Targeted RNA Cancer Panel', '0');
INSERT INTO `eav_attribute_set` VALUES ('139', '4', 'Mango', '0');
INSERT INTO `eav_attribute_set` VALUES ('140', '4', 'Library Controls', '0');
INSERT INTO `eav_attribute_set` VALUES ('141', '4', 'kjhbv', '0');
INSERT INTO `eav_attribute_set` VALUES ('142', '9', 'Default', '1');
