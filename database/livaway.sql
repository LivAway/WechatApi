/*
 Navicat Premium Data Transfer

 Source Server         : 逆创
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : 120.27.199.167:3306
 Source Schema         : livaway

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 26/09/2018 09:48:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_token
-- ----------------------------
DROP TABLE IF EXISTS `auth_token`;
CREATE TABLE `auth_token`  (
  `oid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Token',
  `is_update` int(3) NULL DEFAULT 1 COMMENT '是否更新时间#每次请求时 跟新duetime 为0时表示不更新此时 登录时已经记住了密码',
  `expires_in` int(10) NULL DEFAULT 0 COMMENT '有效期',
  `duetime` bigint(20) NULL DEFAULT 0 COMMENT '过期时间',
  `createdtime` bigint(20) NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Token 临时令牌管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_token
-- ----------------------------
INSERT INTO `auth_token` VALUES (1, 1, 'BhIEtTK_lpfY_xybKB8WFSaMr0cyY9ED', 1, 259200, 1534523474, 1531736018);
INSERT INTO `auth_token` VALUES (2, 2, 'OW0emyc0p13-N_Stdb9clFXBmYrV5Aij', 1, 259200, 1531996095, 1531736136);
INSERT INTO `auth_token` VALUES (3, 3, 'ZiPdCmCDqXqrIH3S1tWNTobVunPvgqfj', 1, 259200, 1532151470, 1531892055);
INSERT INTO `auth_token` VALUES (4, 4, 'jAjEn6ZSYv7z3F3Qpgtba6dUemgFmxc7', 1, 259200, 1532151530, 1531892329);
INSERT INTO `auth_token` VALUES (5, 5, 'Dzm5vDsFwAbyJdyqdWvFx1-e-3OugZPv', 1, 259200, 1532151778, 1531892529);
INSERT INTO `auth_token` VALUES (6, 6, 'LmyEEWD62Q3CrzXcVoTpS1srnHmsLQGT', 1, 259200, 1532152212, 1531892580);
INSERT INTO `auth_token` VALUES (7, 7, 'raMRmASu03tknfLuhEllKzPZGCBYGClL', 1, 259200, 1532151936, 1531892651);
INSERT INTO `auth_token` VALUES (8, 8, 'kuoBNdXiPKICsT4sHAuzC_UzamSWTzXl', 1, 259200, 1532152256, 1531893055);
INSERT INTO `auth_token` VALUES (9, 9, 'lIiXJj9UzmzqOx4r6FQgPz8wcmDpb-MH', 1, 259200, 1532152264, 1531893063);
INSERT INTO `auth_token` VALUES (10, 10, 'KRuP4C2bunNnxm5a1PpzUpMTzg-iJ9kE', 1, 259200, 1532152508, 1531893307);
INSERT INTO `auth_token` VALUES (11, 11, '0G4ckeJlrjPM2ocld06JN7dC_1fSsdnO', 1, 259200, 1532154020, 1531894819);
INSERT INTO `auth_token` VALUES (12, 2, 'DlnIGT9FlTkse-fd6dMyKkefbcJIkVun', 1, 259200, 1533469420, 1533208523);
INSERT INTO `auth_token` VALUES (13, 1, 'aOONKV_RMF3rVXQQAXAj1P2rVZnkjNCv', 1, 259200, 1533823110, 1533558062);
INSERT INTO `auth_token` VALUES (14, 1, 'UsQiMmQ9rUNlJrUsIgSo-Fq5b340m4nc', 1, 259200, 1533822394, 1533563194);
INSERT INTO `auth_token` VALUES (15, 1, 'oGb6OpTXfCOdKvC6kjoMvtfoRb6mzJuy', 1, 259200, 1533823523, 1533564323);
INSERT INTO `auth_token` VALUES (16, 2, 'Gj_abJwEIJIL5Y5Kd4b9VzhQ4v2zNpNk', 1, 259200, 1534060445, 1533727247);
INSERT INTO `auth_token` VALUES (17, 1, 'L28m_90C4gzqNGxSiPHOYSAi4Zaqlkju', 1, 259200, 1534228567, 1533963334);
INSERT INTO `auth_token` VALUES (18, 1, '6u7dnfGypAxnrgjUZzsSIJSiCkvD34VH', 1, 259200, 1534222547, 1533963347);
INSERT INTO `auth_token` VALUES (19, 1, '_w7mKpAA6jRCUeqjA948bYwwtfxBGhwL', 1, 259200, 1534222547, 1533963347);
INSERT INTO `auth_token` VALUES (20, 1, 'hzk2OSejpDNtkX2frZ5H_a1YNNLt5xnm', 1, 259200, 1534222727, 1533963527);
INSERT INTO `auth_token` VALUES (21, 1, 'jTdDDCQMSp69Tw_Qe4DflqozujW5HHJ2', 1, 259200, 1534223507, 1533964153);
INSERT INTO `auth_token` VALUES (22, 1, 'Uw4JrfFQKCLplR3d0PT4Ab4Y14YMuc9H', 1, 259200, 1534226551, 1533964160);
INSERT INTO `auth_token` VALUES (23, 1, 'PsEfS5gCRRQgKwp56ViAvhgU0rUf7yO3', 1, 259200, 1534224737, 1533964351);
INSERT INTO `auth_token` VALUES (24, 1, 'YxgAGx0HToC8TCZPiklf9WqCg1eJBZvh', 1, 259200, 1534228304, 1533965538);
INSERT INTO `auth_token` VALUES (25, 1, 'fqdZPhTaOdJjHnLty3WKRJzRmtGN-giY', 1, 259200, 1534518251, 1534258437);
INSERT INTO `auth_token` VALUES (26, 1, 'yRlKH7aGtL9d_rS9VfDe-SopaxDwEOjr', 1, 259200, 1534517648, 1534258448);
INSERT INTO `auth_token` VALUES (27, 1, 'yhuKWmOlw26nun9G1HPlzcou0s5EEg73', 1, 259200, 1534517648, 1534258448);
INSERT INTO `auth_token` VALUES (28, 1, 'BmeL0NnKIN1skokPzoez9fHF2KeWisRa', 1, 259200, 1534517712, 1534258512);
INSERT INTO `auth_token` VALUES (29, 1, 'Qzhj3lr7ZE1NMXox7JiLApFkMVuVvz0D', 1, 259200, 1534517713, 1534258513);
INSERT INTO `auth_token` VALUES (30, 1, 'bkH5pjlO9Jixc-SN0gOwk-WyN9raSI5r', 1, 259200, 1534518336, 1534259134);
INSERT INTO `auth_token` VALUES (31, 5, 't5v-QxQR4c7ihchibuhuRxDX50fNLbCs', 1, 259200, 1534522747, 1534259219);
INSERT INTO `auth_token` VALUES (32, 5, 'oPbniemR_RJN932PTn-nhCG2IfM22TYC', 1, 259200, 1534523386, 1534264096);
INSERT INTO `auth_token` VALUES (33, 12, 'xm9LnAi-LaL0g4k1SZvKRWIX_YC8ebGZ', 1, 259200, 1534523629, 1534264388);
INSERT INTO `auth_token` VALUES (34, 2, '4N3_8JjGrov_EpUh07EAgJEELv9bJeWD', 1, 259200, 1536414506, 1536113637);
INSERT INTO `auth_token` VALUES (35, 13, '4D3I8V_BuhFQHFSkTsyGs_F0vEarTfDn', 1, 259200, 1536414640, 1536113851);
INSERT INTO `auth_token` VALUES (36, 14, 'lqx5Cc4AUK3gDckZkMoiNcLaZTnucRbc', 1, 259200, 1536373929, 1536114372);
INSERT INTO `auth_token` VALUES (37, 14, 'GSyNORrEmXs5Z9rcv_v-GrPq5tG3WCea', 1, 259200, 1536414556, 1536114522);
INSERT INTO `auth_token` VALUES (38, 15, 'Tmk4UaDShRV9p5657JopV3txF-hS6V0H', 1, 259200, 1536375315, 1536116113);
INSERT INTO `auth_token` VALUES (39, 15, 'r2qJMe1TM8_lxpTP1HtLeMu88cQlC29t', 1, 259200, 1536375826, 1536116625);
INSERT INTO `auth_token` VALUES (40, 16, 'XVcuxDsdlrcbA5HO23RDBeie6oMRkylb', 1, 259200, 1536414658, 1536154554);
INSERT INTO `auth_token` VALUES (41, 15, 'QfRJhV_Ep82q1pk1ghy-5Yk3pFIWSGTp', 1, 259200, 1536414673, 1536154559);
INSERT INTO `auth_token` VALUES (42, 16, 'E95DBF1G_9s2zWoKM1RZyASCnSnBD_WT', 1, 259200, 1536580370, 1536321170);
INSERT INTO `auth_token` VALUES (43, 5, 'taIsxkooiFsWhERqXnU3kuRsBUJCLtuI', 1, 259200, 1536855568, 1536586721);
INSERT INTO `auth_token` VALUES (44, 1, '2LqJL92Mf0m7HjtKgZ-tKEIonH4Ow8Fn', 1, 259200, 1537199132, 1536588262);
INSERT INTO `auth_token` VALUES (45, 2, 'U9Z4oXEgxoEYFbxWcMGd9bdJVTx79TsY', 1, 259200, 1537291019, 1536662192);
INSERT INTO `auth_token` VALUES (46, 5, 'JsxBqWH8w_5CoDBUPd36VGpLFbb0kAn9', 1, 259200, 1537199039, 1536939168);
INSERT INTO `auth_token` VALUES (47, 5, 'zlFSQnhzfWxMdD9L4fnjGySBwgy4cMGd', 1, 259200, 1537198378, 1536939178);
INSERT INTO `auth_token` VALUES (48, 5, '5lpVURFcXmE8AUeVriS5xb5POFXILs55', 1, 259200, 1537198379, 1536939179);
INSERT INTO `auth_token` VALUES (49, 5, 'qTxSSyENqdMMoXeBIiNQjL7lgmMO1Wu6', 1, 259200, 1537199452, 1536940252);
INSERT INTO `auth_token` VALUES (50, 5, 'Kz9fqCq0UyzGA98aa0kkVLXJhkanQ3AN', 1, 259200, 1537241332, 1536982132);
INSERT INTO `auth_token` VALUES (51, 16, 'aa8OnIXHGATDbCgHUUdO_LSPHTEy1jXe', 1, 259200, 1537844375, 1537585128);
INSERT INTO `auth_token` VALUES (52, 1, 'CNWNlpXZbYEzu1RiMyWV--Su9Pu0p-ym', 1, 259200, 1537948749, 1537689350);
INSERT INTO `auth_token` VALUES (53, 17, '7csCOaK5Ne_QNxI44aq4zm-kAmbrrVBY', 1, 259200, 1537948700, 1537689356);
INSERT INTO `auth_token` VALUES (54, 18, 'x-CmKSHOwsMMUuzNWrZS5RFMonP6Ojpq', 1, 259200, 1537948757, 1537689357);
INSERT INTO `auth_token` VALUES (55, 19, 'n62KwxC7NrHYs89uEoZ2rbvkeKxflyby', 1, 259200, 1537948786, 1537689374);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments_uid` bigint(20) NULL DEFAULT NULL COMMENT '评论人',
  `comments_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论昵称',
  `comments_headpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '被评论人',
  `to_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被评论昵称',
  `to_headpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被评论用户头像',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `createdtime` bigint(20) NULL DEFAULT NULL COMMENT '评论时间',
  `is_read` int(3) NULL DEFAULT 0 COMMENT '是否已读0/1',
  `type` int(3) NULL DEFAULT 0 COMMENT '消息类型0正常消息',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (17, 7, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 7, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '肉肉肉', 1530961674, 0, 0);
INSERT INTO `comment` VALUES (18, 2, '随缘', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4XTRc2K0liclRStiaEjn1rpw445QxBnODXA17xibWeKKWib6VOvxy8AaxIOKW2KyVZic9u3o8MzKg9Jw/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '不错哦', 1530971656, 0, 0);
INSERT INTO `comment` VALUES (19, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 2, '随缘', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4XTRc2K0liclRStiaEjn1rpw445QxBnODXA17xibWeKKWib6VOvxy8AaxIOKW2KyVZic9u3o8MzKg9Jw/132', '真的很好啊', 1530974612, 0, 0);
INSERT INTO `comment` VALUES (20, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 2, '随缘', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4XTRc2K0liclRStiaEjn1rpw445QxBnODXA17xibWeKKWib6VOvxy8AaxIOKW2KyVZic9u3o8MzKg9Jw/132', '又是一个评价', 1530974943, 0, 0);
INSERT INTO `comment` VALUES (21, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 2, '随缘', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4XTRc2K0liclRStiaEjn1rpw445QxBnODXA17xibWeKKWib6VOvxy8AaxIOKW2KyVZic9u3o8MzKg9Jw/132', '测试\n', 1530975367, 0, 0);
INSERT INTO `comment` VALUES (22, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '哈哈', 1534259690, 0, 0);
INSERT INTO `comment` VALUES (23, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '222222', 1534262224, 0, 0);
INSERT INTO `comment` VALUES (24, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '222222', 1534262243, 0, 0);
INSERT INTO `comment` VALUES (32, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '测试', 1534262863, 0, 0);
INSERT INTO `comment` VALUES (33, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '测试啊', 1534263057, 0, 0);
INSERT INTO `comment` VALUES (34, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '测hi是啊', 1534263506, 0, 0);
INSERT INTO `comment` VALUES (35, 2, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 14, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'Thank you', 1536155017, 0, 0);
INSERT INTO `comment` VALUES (36, 13, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 2, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Very good', 1536155284, 0, 0);
INSERT INTO `comment` VALUES (37, 16, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 14, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'it’s ok', 1536155317, 0, 0);
INSERT INTO `comment` VALUES (38, 15, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 16, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Good job', 1536155453, 0, 0);
INSERT INTO `comment` VALUES (39, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊', 1536591722, 0, 0);
INSERT INTO `comment` VALUES (40, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '给姚磊留言了', 1536592051, 0, 0);
INSERT INTO `comment` VALUES (41, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '发给姚磊的\n', 1536593315, 0, 0);
INSERT INTO `comment` VALUES (42, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '测试吧', 1536594573, 0, 0);
INSERT INTO `comment` VALUES (43, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '不错啊\n', 1536595769, 0, 0);
INSERT INTO `comment` VALUES (44, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '哈哈哈', 1536596256, 0, 0);
INSERT INTO `comment` VALUES (45, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '12', 1536596315, 0, 0);
INSERT INTO `comment` VALUES (46, 2, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'This is my review for u', 1536833039, 0, 0);
INSERT INTO `comment` VALUES (52, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '测试哦啊', 1536939650, 0, 0);
INSERT INTO `comment` VALUES (53, 2, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 16, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', '好吧', 1537031756, 0, 0);

-- ----------------------------
-- Table structure for learn
-- ----------------------------
DROP TABLE IF EXISTS `learn`;
CREATE TABLE `learn`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdtime` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of learn
-- ----------------------------
INSERT INTO `learn` VALUES (1, 'English', NULL);
INSERT INTO `learn` VALUES (2, 'Chinese', NULL);
INSERT INTO `learn` VALUES (3, 'Chinese Cuisine', NULL);
INSERT INTO `learn` VALUES (4, 'Foreign Cuisine', NULL);
INSERT INTO `learn` VALUES (5, 'Museum', NULL);

-- ----------------------------
-- Table structure for meet
-- ----------------------------
DROP TABLE IF EXISTS `meet`;
CREATE TABLE `meet`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) NULL DEFAULT NULL COMMENT '消息id',
  `from_uid` bigint(20) NULL DEFAULT NULL COMMENT '发起者',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '被请求的人',
  `status` int(3) NULL DEFAULT 0 COMMENT '状态0:请求见面   1：同意见面 ',
  `is_comment` int(3) NULL DEFAULT 0 COMMENT '是否评论0未评论1 一方已评论 2双方都评论',
  `createdtime` bigint(20) NULL DEFAULT NULL COMMENT '请求时间',
  `agreedtime` bigint(20) NULL DEFAULT NULL COMMENT '同意时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `last_comment_uid` bigint(20) NULL DEFAULT NULL COMMENT '最后评论ren id',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of meet
-- ----------------------------
INSERT INTO `meet` VALUES (1, 6, 2, 3, 0, 0, 1533208696, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (2, 8, 2, 1, 0, 0, 1533209747, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (3, 10, 2, 1, 1, 1, 1533209756, 1533785231, 'You have requested a meet up. Please wait for reply.', 2);
INSERT INTO `meet` VALUES (4, 12, 1, 6, 0, 0, 1533561234, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (5, 14, 1, 3, 0, 0, 1533561620, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (6, 18, 1, 7, 0, 0, 1533562655, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (7, 20, 2, 6, 0, 0, 1533727319, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (8, 22, 2, 6, 0, 0, 1533727382, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (9, 24, 2, 6, 0, 0, 1533727382, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (10, 26, 2, 6, 0, 0, 1533727384, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (11, 29, 2, 5, 0, 0, 1533784693, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (12, 44, 3, 5, 0, 0, 1534259294, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (13, 50, 1, 5, 1, 2, 1534259670, 1534259679, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (14, 54, 5, 1, 1, 2, 1534259699, 1534259702, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (15, 58, 5, 5, 1, 2, 1534259796, 1534259825, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (16, 62, 5, 1, 1, 2, 1534262334, 1534262338, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (17, 66, 5, 1, 1, 2, 1534263033, 1534263042, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (18, 70, 5, 1, 1, 2, 1534263490, 1534263497, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (19, 79, 2, 14, 1, 1, 1536154784, 1536154786, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (20, 84, 16, 2, 1, 1, 1536154922, 1536662221, 'You have requested a meet up. Please wait for reply.', 2);
INSERT INTO `meet` VALUES (21, 87, 13, 13, 1, 1, 1536154927, 1536155260, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (22, 91, 16, 14, 1, 1, 1536154986, 1536155273, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (23, 112, 16, 15, 1, 0, 1536155408, 1536155465, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (24, 114, 15, 16, 1, 1, 1536155409, 1536155425, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (25, 138, 1, 5, 1, 2, 1536591419, 1536591426, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (26, 143, 5, 1, 1, 2, 1536592016, 1536592027, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (27, 148, 1, 5, 1, 2, 1536593020, 1536593031, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (28, 154, 5, 1, 1, 2, 1536594608, 1536594625, 'You have requested a meet up. Please wait for reply.', 5);
INSERT INTO `meet` VALUES (29, 158, 5, 6, 0, 0, 1536595517, NULL, 'You have requested a meet up. Please wait for reply.', NULL);
INSERT INTO `meet` VALUES (30, 161, 5, 1, 1, 2, 1536595802, 1536595817, 'You have requested a meet up. Please wait for reply.', 1);
INSERT INTO `meet` VALUES (31, 172, 1, 5, 1, 1, 1536939232, 1536939251, 'You have requested a meet up. Please wait for reply.', 5);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_uid` bigint(20) NULL DEFAULT NULL COMMENT '发送者',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '接收者',
  `from_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者昵称#冗余',
  `from_headpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者头像#冗余',
  `to_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者昵称#冗余',
  `to_headpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者头像#冗余',
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息',
  `msg_type` int(3) NULL DEFAULT 0 COMMENT '消息类型 目前为0 普通消息 1：系统消息',
  `send_time` bigint(20) NULL DEFAULT NULL COMMENT '发送时间',
  `is_read` int(3) NULL DEFAULT 0 COMMENT '是否已读0未读1已读',
  `group` int(3) NULL DEFAULT 0 COMMENT '消息分组0学习1是分享',
  `system_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '系统消息id',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 1, 1, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'buc', 0, 1531741572, 1, 1, '0');
INSERT INTO `message` VALUES (2, 6, 1, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'hello', 0, 1531892978, 1, 1, '0');
INSERT INTO `message` VALUES (3, 2, 1, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Hey how’s it going ', 0, 1533208565, 1, 1, '0');
INSERT INTO `message` VALUES (4, 2, 2, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Hi', 0, 1533208585, 1, 1, '0');
INSERT INTO `message` VALUES (5, 2, 3, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'Hello', 0, 1533208672, 1, 0, '0');
INSERT INTO `message` VALUES (6, 3, 2, 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533208696, 1, 1, '2_to_3');
INSERT INTO `message` VALUES (7, 2, 3, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'Has requested to meet you.', 1, 1533208696, 1, 1, '3_to_2');
INSERT INTO `message` VALUES (8, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533209747, 1, 1, '2_to_1');
INSERT INTO `message` VALUES (9, 2, 1, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1533209747, 1, 1, '1_to_2');
INSERT INTO `message` VALUES (10, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533209756, 1, 1, '2_to_1');
INSERT INTO `message` VALUES (11, 2, 1, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1533209756, 1, 1, '1_to_2');
INSERT INTO `message` VALUES (12, 6, 1, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1533561234, 1, 1, '1_to_6');
INSERT INTO `message` VALUES (13, 1, 6, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1533561234, 0, 1, '6_to_1');
INSERT INTO `message` VALUES (14, 3, 1, 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1533561620, 1, 1, '1_to_3');
INSERT INTO `message` VALUES (15, 1, 3, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'Has requested to meet you.', 1, 1533561620, 1, 1, '3_to_1');
INSERT INTO `message` VALUES (16, 1, 6, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', '111', 0, 1533562599, 0, 1, '0');
INSERT INTO `message` VALUES (17, 1, 7, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Yl', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcT1fcqJIqTJDup3O4FAzddNbibgquRt0MXqrYdQFohwkP6icuwENQkSB0m69TV7GdQ2icYWC2T9kQ/132', '你好姚玲', 0, 1533562631, 0, 1, '0');
INSERT INTO `message` VALUES (18, 7, 1, 'Yl', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcT1fcqJIqTJDup3O4FAzddNbibgquRt0MXqrYdQFohwkP6icuwENQkSB0m69TV7GdQ2icYWC2T9kQ/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1533562655, 1, 1, '1_to_7');
INSERT INTO `message` VALUES (19, 1, 7, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Yl', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcT1fcqJIqTJDup3O4FAzddNbibgquRt0MXqrYdQFohwkP6icuwENQkSB0m69TV7GdQ2icYWC2T9kQ/132', 'Has requested to meet you.', 1, 1533562655, 0, 1, '7_to_1');
INSERT INTO `message` VALUES (20, 6, 2, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533727319, 1, 1, '2_to_6');
INSERT INTO `message` VALUES (21, 2, 6, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1533727319, 0, 1, '6_to_2');
INSERT INTO `message` VALUES (22, 6, 2, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533727382, 1, 1, '2_to_6');
INSERT INTO `message` VALUES (23, 2, 6, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1533727382, 0, 1, '6_to_2');
INSERT INTO `message` VALUES (24, 6, 2, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533727382, 1, 1, '2_to_6');
INSERT INTO `message` VALUES (25, 2, 6, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1533727382, 0, 1, '6_to_2');
INSERT INTO `message` VALUES (26, 6, 2, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533727384, 1, 1, '2_to_6');
INSERT INTO `message` VALUES (27, 2, 6, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1533727384, 0, 1, '6_to_2');
INSERT INTO `message` VALUES (28, 2, 5, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '我们不一样', 0, 1533727423, 1, 1, '0');
INSERT INTO `message` VALUES (29, 5, 2, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1533784693, 1, 1, '2_to_5');
INSERT INTO `message` VALUES (30, 2, 5, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1533784693, 1, 1, '5_to_2');
INSERT INTO `message` VALUES (31, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '你好 test', 0, 1533785100, 1, 1, '0');
INSERT INTO `message` VALUES (32, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1533785231, 1, 1, '1_to_2');
INSERT INTO `message` VALUES (33, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'ANeeds your review', 1, 1533785231, 1, 1, '1_to_2');
INSERT INTO `message` VALUES (34, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好双仁', 0, 1533785469, 1, 1, '0');
INSERT INTO `message` VALUES (35, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '好久不见啊', 0, 1533785478, 1, 1, '0');
INSERT INTO `message` VALUES (36, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '嘴贱可好', 0, 1533785487, 1, 1, '0');
INSERT INTO `message` VALUES (37, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好吗', 0, 1533785496, 1, 1, '0');
INSERT INTO `message` VALUES (38, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '我很好啊', 0, 1533785505, 1, 1, '0');
INSERT INTO `message` VALUES (39, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '不知道说啥好', 0, 1533785514, 1, 1, '0');
INSERT INTO `message` VALUES (40, 1, 7, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Yl', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcT1fcqJIqTJDup3O4FAzddNbibgquRt0MXqrYdQFohwkP6icuwENQkSB0m69TV7GdQ2icYWC2T9kQ/132', '对的', 0, 1533966319, 0, 1, '0');
INSERT INTO `message` VALUES (41, 1, 6, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', '222', 0, 1533966597, 0, 1, '0');
INSERT INTO `message` VALUES (42, 1, 6, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', '2', 0, 1533966599, 0, 1, '0');
INSERT INTO `message` VALUES (43, 1, 6, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', '2', 0, 1533966600, 0, 1, '0');
INSERT INTO `message` VALUES (44, 5, 3, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'You have requested a meet up. Please wait for reply.', 1, 1534259294, 1, 1, '3_to_5');
INSERT INTO `message` VALUES (45, 3, 5, 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1534259294, 1, 1, '5_to_3');
INSERT INTO `message` VALUES (46, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'nih ', 0, 1534259527, 1, 1, '0');
INSERT INTO `message` VALUES (47, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'kk ', 0, 1534259583, 1, 1, '0');
INSERT INTO `message` VALUES (48, 3, 5, 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '烦烦烦的', 0, 1534259593, 1, 1, '0');
INSERT INTO `message` VALUES (49, 3, 5, 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊', 0, 1534259607, 1, 1, '0');
INSERT INTO `message` VALUES (50, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1534259670, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (51, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1534259670, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (52, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534259679, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (53, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ANeeds your review', 1, 1534259679, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (54, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1534259699, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (55, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1534259699, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (56, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534259702, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (57, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1534259702, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (58, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1534259796, 1, 1, '5_to_5');
INSERT INTO `message` VALUES (59, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1534259796, 1, 1, '5_to_5');
INSERT INTO `message` VALUES (60, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534259825, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (61, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1534259825, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (62, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1534262334, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (63, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1534262334, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (64, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534262338, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (65, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1534262338, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (66, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1534263033, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (67, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1534263033, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (68, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534263042, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (69, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1534263042, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (70, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1534263490, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (71, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1534263490, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (72, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1534263497, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (73, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1534263497, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (74, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊', 0, 1534264113, 1, 1, '0');
INSERT INTO `message` VALUES (75, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ni shuo shenme me', 0, 1534264160, 1, 1, '0');
INSERT INTO `message` VALUES (76, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'hh', 0, 1534264169, 1, 1, '0');
INSERT INTO `message` VALUES (77, 2, 14, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'Hi this is Vincent ', 0, 1536154771, 1, 0, '0');
INSERT INTO `message` VALUES (78, 14, 2, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Hi this is Bingo ', 0, 1536154784, 1, 0, '0');
INSERT INTO `message` VALUES (79, 14, 2, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'You have requested a meet up. Please wait for reply.', 1, 1536154784, 1, 0, '2_to_14');
INSERT INTO `message` VALUES (80, 2, 14, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'Has requested to meet you.', 1, 1536154784, 1, 0, '14_to_2');
INSERT INTO `message` VALUES (81, 2, 14, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536154786, 1, 1, '2_to_14');
INSERT INTO `message` VALUES (82, 2, 14, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'ANeeds your review', 1, 1536154786, 1, 1, '2_to_14');
INSERT INTO `message` VALUES (83, 16, 2, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'hello ', 0, 1536154914, 1, 1, '0');
INSERT INTO `message` VALUES (84, 2, 16, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'You have requested a meet up. Please wait for reply.', 1, 1536154922, 1, 1, '16_to_2');
INSERT INTO `message` VALUES (85, 16, 2, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Has requested to meet you.', 1, 1536154922, 1, 1, '2_to_16');
INSERT INTO `message` VALUES (86, 13, 13, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Bingo', 0, 1536154923, 1, 1, '0');
INSERT INTO `message` VALUES (87, 13, 13, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'You have requested a meet up. Please wait for reply.', 1, 1536154927, 1, 1, '13_to_13');
INSERT INTO `message` VALUES (88, 13, 13, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Has requested to meet you.', 1, 1536154927, 1, 1, '13_to_13');
INSERT INTO `message` VALUES (89, 14, 16, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Hi ', 0, 1536154959, 1, 1, '0');
INSERT INTO `message` VALUES (90, 14, 2, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Hi ', 0, 1536154986, 1, 1, '0');
INSERT INTO `message` VALUES (91, 14, 16, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'You have requested a meet up. Please wait for reply.', 1, 1536154986, 1, 0, '16_to_14');
INSERT INTO `message` VALUES (92, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'Has requested to meet you.', 1, 1536154986, 1, 0, '14_to_16');
INSERT INTO `message` VALUES (93, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Hi', 0, 1536154992, 1, 1, '0');
INSERT INTO `message` VALUES (94, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Hi', 0, 1536155007, 1, 0, '0');
INSERT INTO `message` VALUES (95, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'hello ', 0, 1536155018, 1, 0, '0');
INSERT INTO `message` VALUES (96, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Hi', 0, 1536155229, 1, 0, '0');
INSERT INTO `message` VALUES (97, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Love you', 0, 1536155248, 1, 0, '0');
INSERT INTO `message` VALUES (98, 2, 13, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Hey', 0, 1536155249, 1, 0, '0');
INSERT INTO `message` VALUES (99, 2, 13, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'Hey', 0, 1536155249, 1, 0, '0');
INSERT INTO `message` VALUES (100, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155258, 1, 1, '13_to_2');
INSERT INTO `message` VALUES (101, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'ANeeds your review', 1, 1536155258, 1, 1, '13_to_2');
INSERT INTO `message` VALUES (102, 14, 16, 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Hi ', 0, 1536155259, 1, 1, '0');
INSERT INTO `message` VALUES (103, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155260, 1, 1, '13_to_2');
INSERT INTO `message` VALUES (104, 13, 2, 'Alin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'ANeeds your review', 1, 1536155260, 1, 1, '13_to_2');
INSERT INTO `message` VALUES (105, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'hhh', 0, 1536155267, 1, 0, '0');
INSERT INTO `message` VALUES (106, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155272, 1, 1, '16_to_14');
INSERT INTO `message` VALUES (107, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'ANeeds your review', 1, 1536155272, 1, 1, '16_to_14');
INSERT INTO `message` VALUES (108, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155273, 1, 1, '16_to_14');
INSERT INTO `message` VALUES (109, 16, 14, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Bingo Yao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 'ANeeds your review', 1, 1536155273, 1, 1, '16_to_14');
INSERT INTO `message` VALUES (110, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Uu', 0, 1536155391, 1, 1, '0');
INSERT INTO `message` VALUES (111, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'hello ', 0, 1536155401, 1, 0, '0');
INSERT INTO `message` VALUES (112, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'You have requested a meet up. Please wait for reply.', 1, 1536155408, 1, 0, '16_to_15');
INSERT INTO `message` VALUES (113, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'Has requested to meet you.', 1, 1536155408, 1, 0, '15_to_16');
INSERT INTO `message` VALUES (114, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'You have requested a meet up. Please wait for reply.', 1, 1536155409, 1, 1, '15_to_16');
INSERT INTO `message` VALUES (115, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Has requested to meet you.', 1, 1536155409, 1, 1, '16_to_15');
INSERT INTO `message` VALUES (116, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155423, 1, 1, '15_to_16');
INSERT INTO `message` VALUES (117, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'ANeeds your review', 1, 1536155423, 1, 1, '15_to_16');
INSERT INTO `message` VALUES (118, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155425, 1, 1, '15_to_16');
INSERT INTO `message` VALUES (119, 15, 16, 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'ANeeds your review', 1, 1536155425, 1, 1, '15_to_16');
INSERT INTO `message` VALUES (120, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536155465, 1, 1, '16_to_15');
INSERT INTO `message` VALUES (121, 16, 15, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Wang Tiantian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 'ANeeds your review', 1, 1536155465, 1, 1, '16_to_15');
INSERT INTO `message` VALUES (122, 5, 3, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', '你好啊', 0, 1536587524, 0, 0, '0');
INSERT INTO `message` VALUES (123, 5, 3, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', '你好啊', 0, 1536587544, 0, 0, '0');
INSERT INTO `message` VALUES (124, 5, 3, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', '你好啊', 0, 1536587546, 0, 0, '0');
INSERT INTO `message` VALUES (125, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊', 0, 1536587699, 1, 0, '0');
INSERT INTO `message` VALUES (126, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '', 0, 1536587699, 1, 0, '0');
INSERT INTO `message` VALUES (127, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'a', 0, 1536587869, 1, 0, '0');
INSERT INTO `message` VALUES (128, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'aw', 0, 1536587872, 1, 0, '0');
INSERT INTO `message` VALUES (129, 5, 3, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'YuanTian', 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', '你好啊', 0, 1536587894, 0, 0, '0');
INSERT INTO `message` VALUES (130, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '姚磊你好啊', 0, 1536587941, 1, 1, '0');
INSERT INTO `message` VALUES (131, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊 我不是很好哦', 0, 1536588280, 1, 0, '0');
INSERT INTO `message` VALUES (132, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'www', 0, 1536588326, 1, 0, '0');
INSERT INTO `message` VALUES (133, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好双人', 0, 1536588868, 1, 1, '0');
INSERT INTO `message` VALUES (134, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '学习', 0, 1536588982, 1, 1, '0');
INSERT INTO `message` VALUES (135, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'nihaoba', 0, 1536589023, 1, 0, '0');
INSERT INTO `message` VALUES (136, 5, 4, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', ' 太阳花ヾ', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLCHgqAZzaNib9lCX7KJbpguUfou5j3XZauSichbOrG45ia95DVhx6RkxHnlBdGLhBuNHI6H4oaRtdHuQ/132', 'nihaoba', 0, 1536589237, 0, 0, '0');
INSERT INTO `message` VALUES (137, 5, 5, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'nihaoa', 0, 1536589271, 1, 0, '0');
INSERT INTO `message` VALUES (138, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1536591419, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (139, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1536591419, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (140, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536591426, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (141, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ANeeds your review', 1, 1536591426, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (142, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '你好啊', 1, 1536591722, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (143, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1536592016, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (144, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1536592016, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (145, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536592027, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (146, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1536592027, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (147, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '给姚磊留言了', 1, 1536592051, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (148, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1536593020, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (149, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1536593020, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (150, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536593032, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (151, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ANeeds your review', 1, 1536593032, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (152, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '发给姚磊的\n', 1, 1536593315, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (153, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '测试吧', 1, 1536594573, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (154, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1536594608, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (155, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1536594608, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (156, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536594625, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (157, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ANeeds your review', 1, 1536594625, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (158, 6, 5, '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1536595517, 1, 1, '5_to_6');
INSERT INTO `message` VALUES (159, 5, 6, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '遇见', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 'Has requested to meet you.', 1, 1536595517, 0, 1, '6_to_5');
INSERT INTO `message` VALUES (160, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '不错啊\n', 1, 1536595769, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (161, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'You have requested a meet up. Please wait for reply.', 1, 1536595802, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (162, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Has requested to meet you.', 1, 1536595802, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (163, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.', 1, 1536595817, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (164, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'Even needs your review.', 1, 1536595817, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (165, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', '哈哈哈', 1, 1536596256, 1, 1, '5_to_1');
INSERT INTO `message` VALUES (166, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '12', 1, 1536596315, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (167, 2, 16, 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'Hello', 0, 1536662213, 1, 1, '0');
INSERT INTO `message` VALUES (168, 16, 2, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KINDNESS.', 1, 1536662221, 1, 1, '16_to_2');
INSERT INTO `message` VALUES (169, 16, 2, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'VincentChan needs your review.', 1, 1536662221, 1, 1, '16_to_2');
INSERT INTO `message` VALUES (170, 1, 2, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 'This is my review for u', 1, 1536833039, 1, 1, '1_to_2');
INSERT INTO `message` VALUES (171, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'nihao a', 0, 1536939212, 1, 0, '0');
INSERT INTO `message` VALUES (172, 5, 1, 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'You have requested a meet up. Please wait for reply.', 1, 1536939232, 1, 0, '1_to_5');
INSERT INTO `message` VALUES (173, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'Has requested to meet you.', 1, 1536939232, 1, 0, '5_to_1');
INSERT INTO `message` VALUES (174, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KINDNESS.', 1, 1536939251, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (175, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 'ZhangsR needs your review.', 1, 1536939251, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (176, 1, 5, 'Even', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 'ZhangsR', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', '测试哦啊 System - VincentChan\'s Review for You', 1, 1536939650, 1, 1, '1_to_5');
INSERT INTO `message` VALUES (177, 16, 2, '...', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 'VincentChan', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', '好吧 System - VincentChan\'s Review for You', 1, 1537031756, 1, 1, '16_to_2');

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdtime` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (1, 'English', NULL);
INSERT INTO `share` VALUES (2, 'Chinese', NULL);
INSERT INTO `share` VALUES (3, 'Chinese Cuisine', NULL);
INSERT INTO `share` VALUES (4, 'Foreign Cuisine', NULL);
INSERT INTO `share` VALUES (5, 'Museum', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名[search]`*',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名[search]',
  `headpic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像[img]',
  `sex` int(3) NULL DEFAULT 1 COMMENT '性别[search][list]1:男|0:女',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号[search]',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱[search]',
  `reg_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间[search][date]',
  `last_login_time` bigint(20) NULL DEFAULT NULL COMMENT '最后登录时间',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '登录时间',
  `login_count` int(10) NULL DEFAULT 0 COMMENT '登录次数',
  `reg_source` int(3) NULL DEFAULT 0 COMMENT '注册设备[search][list]0:PC|1:Android|2:IOS|3:Mobile',
  `isvalid` int(3) NULL DEFAULT 1 COMMENT '是否有效',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方登录openid 唯一的',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `learn` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学习',
  `share` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享',
  `desc` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `total_KNP` int(10) NULL DEFAULT 0 COMMENT '总数KNP',
  `use_KNP` int(10) NULL DEFAULT 0 COMMENT '使用KNP',
  `overplus_KNP` int(10) NULL DEFAULT 0 COMMENT '可用KNP',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'weixin_oo4IKxDF', NULL, 'Even', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132', 1, NULL, NULL, 1531736017, NULL, NULL, 0, 3, 1, 'oo4IKxDFw-6wG-98XMFYBABtJ7cM', '微信登录', 12, 'Chinese/Foreign Cuisine/English/Museum/Chinese Cuisine', 'English/Chinese/Chinese Cuisine/Foreign Cuisine/Museum', 'To determine the bottom of the scroll bar, you need three DOM attribute values, scrollTop, clientHeight, and scrollHeight.\nScrollTop is the scroll distance on the Y axis of the scroll bar.\nClientHeight is the height of the content visible area.\nScrollHeight adds the overflow (scroll) distance to the height of the content visible area.', 31, 3, 28);
INSERT INTO `user` VALUES (2, 'weixin_oo4IKxNp', NULL, 'VincentChan', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq18dsJT1aw00XYWESd4jrugJd2B6kDwibWicasDA36Yd5nQd314ibpbRBJnx7kcu0e9py44XjjNKYDw/132', 1, NULL, NULL, 1531736136, NULL, NULL, 0, 3, 1, 'oo4IKxNpMf3g6EorL1eKiM_5qY5w', '微信登录', 1, 'Chinese/Foreign Cuisine/English/Museum/Chinese Cuisine', 'English/Chinese/Chinese Cuisine/Foreign Cuisine/Museum', 'Hi this is Vincent', 20, 6, 14);
INSERT INTO `user` VALUES (3, 'weixin_oo4IKxG8', NULL, 'YuanTian', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/I6NmVLXAu47iaMAlq4hbYK5K8J8ozKA8gOKKEN30SUeqMFR54omLDz8VGHKyTOpnrSHTibDsAefMNnDseT2xR70g/132', 1, NULL, NULL, 1531892055, NULL, NULL, 0, 3, 1, 'oo4IKxG8BNqyujcHBXVxucstSW8U', '微信登录', 0, 'Chinese/Foreign Cuisine/English/Museum/Chinese Cuisine', 'English/Chinese/Chinese Cuisine/Foreign Cuisine/Museum', 'test', 0, 0, 0);
INSERT INTO `user` VALUES (4, 'weixin_oo4IKxAF', NULL, ' 太阳花ヾ', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLCHgqAZzaNib9lCX7KJbpguUfou5j3XZauSichbOrG45ia95DVhx6RkxHnlBdGLhBuNHI6H4oaRtdHuQ/132', 1, NULL, NULL, 1531892329, NULL, NULL, 0, 3, 1, 'oo4IKxAFUYrKvKdUMsXVIYE4_15g', '微信登录', 0, 'Chinese/Foreign Cuisine/English/Museum/Chinese Cuisine', 'English/Chinese/Chinese Cuisine/Foreign Cuisine/Museum', 'test', 0, 0, 0);
INSERT INTO `user` VALUES (5, 'weixin_oo4IKxMK', NULL, 'ZhangsR', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTCIAFiczUYibPvPk2DGUaYia8Fun10zcsVvWdiaVqmSNBjkNLEtmdibUz3Pd91TocXLm1xDpHcfl2AlA/132', 1, NULL, NULL, 1531892528, NULL, NULL, 0, 3, 1, 'oo4IKxMKQpSokU-aaDFB4UOxIK50', '微信登录', 3, 'English', 'English/English', 'ict', 23, 20, 3);
INSERT INTO `user` VALUES (6, 'weixin_oo4IKxGn', NULL, '遇见', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuI1icaupskahj77QbzJavHl3do957IQVQ5ogiaO6l5YYqBSKQ3C0WERCt6mTC2aibNVa6dPPdltyXw/132', 1, NULL, NULL, 1531892580, NULL, NULL, 0, 3, 1, 'oo4IKxGnNrgInKUwEj8AjYiSWljA', '微信登录', 0, 'English/Museum/Chinese Cuisine', 'English/Museum/Chinese Cuisine', 'test1', 0, 0, 0);
INSERT INTO `user` VALUES (7, 'weixin_oo4IKxFm', NULL, 'Yl', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcT1fcqJIqTJDup3O4FAzddNbibgquRt0MXqrYdQFohwkP6icuwENQkSB0m69TV7GdQ2icYWC2T9kQ/132', 1, NULL, NULL, 1531892651, NULL, NULL, 0, 3, 1, 'oo4IKxFmXroQW2QAs0j-ySjv_ym4', '微信登录', 0, 'English/Museum', 'English/Museum', 'test2', 0, 0, 0);
INSERT INTO `user` VALUES (8, 'weixin_oo4IKxO3', NULL, '姚萍', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/7xB3OdNLiaPhmb9SqKWtVfKMu7CSTUA50k6h976IE1ic20wCRcsKqGSCG1ILRKicdv1q5uBjwTbxNmKNqmCeYVJgg/132', 1, NULL, NULL, 1531893055, NULL, NULL, 0, 3, 1, 'oo4IKxO38rolTn_9_wttsqtIs2O4', '微信登录', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `user` VALUES (9, 'weixin_oo4IKxIm', NULL, '半梦半痴半疯癫ゼ', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJyTgOnWqw2JZwdRW07VE69AQkcQKx5ib0icRky5d6bNib1QXSTYx1xBvQn44RLRWvibxQHBicfaTlTxDA/132', 1, NULL, NULL, 1531893063, NULL, NULL, 0, 3, 1, 'oo4IKxImu5algn1PLzRyyvUVUq2U', '微信登录', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `user` VALUES (10, 'weixin_oo4IKxJQ', NULL, '宋满香', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/G52dFToDxCia31Qap1Gib3AYtqSYMiboEPvYicKw24lJk4tO5WKNaiaHdxTjTN9pENkbEEJ7NlzmBvQYMx7qYWFJ1Pw/132', 1, NULL, NULL, 1531893307, NULL, NULL, 0, 3, 1, 'oo4IKxJQ8uzzTHgly6rzSSZUsi30', '微信登录', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `user` VALUES (11, 'weixin_oo4IKxPS', NULL, '析木射手', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/RRxS0JCd5qvnTgobBJZI8vWjotd2xNpaq3xlUlUgwe4bgt15RdEN84kegXkbE9npDtmskuuZRqmbW5pmFukLUA/132', 1, NULL, NULL, 1531894819, NULL, NULL, 0, 3, 1, 'oo4IKxPSLqO3l6i-dKT-k14A9dYM', '微信登录', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `user` VALUES (12, 'weixin_oo4IKxJV', NULL, '安心', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/f4RQiaSpt4OLYASFFgpKSQ244mBT9gaCezGqHsuOQC3z5icj3Ej2tyD5vst0vX3yzkgianMTg5FDK3VkwQvibvV7Cw/132', 1, NULL, NULL, 1534264388, NULL, NULL, 0, 3, 1, 'oo4IKxJVjmc7yhrodIK7PpxmWBPg', '微信登录', 0, NULL, NULL, NULL, 10, 0, 10);
INSERT INTO `user` VALUES (13, 'weixin_oo4IKxKr', NULL, 'Alin', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/5BpytLibbaeCGdXrDmadTyjKINPGHjgO9oQFIaqAQaSkxbuH2gfGd5JEwTcKXiaqSCCR5KTVWC1dksGpTJVbCNZg/132', 1, NULL, NULL, 1536113851, NULL, NULL, 0, 3, 1, 'oo4IKxKrUnlqTbSVULaCjOS1giFg', '微信登录', 0, 'Chinese', 'Foreign Cuisine', 'I’m Alin', 10, 10, 0);
INSERT INTO `user` VALUES (14, 'weixin_oo4IKxEx', NULL, 'Bingo Yao', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/uCibSVYfJwz0zib0NXQs1cDszic2pQ1F2xlXNbqWWBnp8XNGM5eBHVFXzsg4O3AqichLvt0EUxdIic3r5u1hqCFXK0Q/132', 1, NULL, NULL, 1536114372, NULL, NULL, 0, 3, 1, 'oo4IKxExJug_BZSTtMWTPD9bwMUI', '微信登录', 2, 'English/Foreign Cuisine', 'Chinese/Chinese Cuisine/Museum', 'Lllllllllllll', 20, 0, 20);
INSERT INTO `user` VALUES (15, 'weixin_oo4IKxAW', NULL, 'Wang Tiantian', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIP2OtRibWAV1ibQVnZVAmqzYC7uQtpRBfBGXla8DtP1CN9GTsUBXo8fLgWZCTUxzo3j1RgLw4MQyiag/132', 1, NULL, NULL, 1536116113, NULL, NULL, 0, 3, 1, 'oo4IKxAWnJBLiymB5CBuiYof2V04', '微信登录', 0, 'English/Foreign Cuisine', 'Chinese/Chinese Cuisine/Museum', 'Tea, wine, and cousin lover', 10, 5, 5);
INSERT INTO `user` VALUES (16, 'weixin_oo4IKxFN', NULL, '...', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erjq58ZIic5fIxh2n0ZaNes5ViciaXmcHW66poibnPRmOsk87xj3IdDuhpExkiccjF569Ttakc9L9NHF3Q/132', 1, NULL, NULL, 1536154554, NULL, NULL, 0, 3, 1, 'oo4IKxFNwgIZMLgGNN51KMF2xDU8', '微信登录', 2, 'Museum', 'English', 'i could teach you english', 15, 5, 10);
INSERT INTO `user` VALUES (17, 'weixin_oo4IKxBe', NULL, 'Max', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/TtfQjrjtpibFKDma7AFjkT9gJvz1icmmmkAyjL67ZLSH4rDsxOJ7gdgJPHEicBH3p70ugwJw2sAsl2WagArKYZsAw/132', 1, NULL, NULL, 1537689356, NULL, NULL, 0, 3, 1, 'oo4IKxBeuQgl3SpfZMV1nUSPNQ-c', '微信登录', 0, NULL, NULL, NULL, 10, 0, 10);
INSERT INTO `user` VALUES (18, 'weixin_oo4IKxPR', NULL, 'Darren', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjvaAqWxb7YnSfRuKxVnM6AL1dictibSSNvkALmyMia7YVyOABNMj8SAfqKxwDceiatibQweBXqS487TA/132', 1, NULL, NULL, 1537689357, NULL, NULL, 0, 3, 1, 'oo4IKxPRsXo5sZibjlk6oEdrjUsM', '微信登录', 0, NULL, NULL, NULL, 10, 0, 10);
INSERT INTO `user` VALUES (19, 'weixin_oo4IKxBX', NULL, 'Sean', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/TmJORDnuRxVzFNJvdu9UTbsvA6DlfHibgGkjarOoibRDxSULgtjcnGhKoOr3xhjbR7Xu53ibNLicnYFfEPX9nU7XsA/132', 1, NULL, NULL, 1537689374, NULL, NULL, 0, 3, 1, 'oo4IKxBXmDqshEVmQu2rMqNdhEn8', '微信登录', 0, NULL, NULL, NULL, 10, 0, 10);

-- ----------------------------
-- Table structure for user_knp_log
-- ----------------------------
DROP TABLE IF EXISTS `user_knp_log`;
CREATE TABLE `user_knp_log`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户',
  `surplus` int(19) NULL DEFAULT NULL COMMENT '用户剩余knp数',
  `number` int(10) NULL DEFAULT NULL COMMENT '数量',
  `total` int(10) NULL DEFAULT NULL COMMENT '总数',
  `type` int(3) NULL DEFAULT NULL COMMENT '类型0是支出1是收入',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `createdtime` bigint(20) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_knp_log
-- ----------------------------
INSERT INTO `user_knp_log` VALUES (1, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262551);
INSERT INTO `user_knp_log` VALUES (2, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262623);
INSERT INTO `user_knp_log` VALUES (3, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262674);
INSERT INTO `user_knp_log` VALUES (4, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262682);
INSERT INTO `user_knp_log` VALUES (5, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262835);
INSERT INTO `user_knp_log` VALUES (6, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262852);
INSERT INTO `user_knp_log` VALUES (7, 1, 20, 5, 25, 1, '打赏获得:5KNP', 1534262852);
INSERT INTO `user_knp_log` VALUES (8, 5, 20, 5, 25, 0, '评论用户 打赏:5KNP', 1534262863);
INSERT INTO `user_knp_log` VALUES (9, 1, 20, 5, 25, 1, '打赏获得:5KNP', 1534262863);
INSERT INTO `user_knp_log` VALUES (10, 5, 15, 6, 9, 0, '评论用户 打赏:6KNP', 1534263057);
INSERT INTO `user_knp_log` VALUES (11, 1, 15, 6, 21, 1, '打赏获得:6KNP', 1534263057);
INSERT INTO `user_knp_log` VALUES (12, 12, 0, 10, 10, 1, '首次注册获得:10KNP', 1534264388);
INSERT INTO `user_knp_log` VALUES (13, 13, 0, 10, 10, 1, '首次注册获得:10KNP', 1536113851);
INSERT INTO `user_knp_log` VALUES (14, 14, 0, 10, 10, 1, '首次注册获得:10KNP', 1536114372);
INSERT INTO `user_knp_log` VALUES (15, 15, 0, 10, 10, 1, '首次注册获得:10KNP', 1536116113);
INSERT INTO `user_knp_log` VALUES (16, 16, 0, 10, 10, 1, '首次注册获得:10KNP', 1536154554);
INSERT INTO `user_knp_log` VALUES (17, 2, 10, 5, 5, 0, '评论用户 打赏:5KNP', 1536155017);
INSERT INTO `user_knp_log` VALUES (18, 14, 10, 5, 15, 1, '打赏获得:5KNP', 1536155017);
INSERT INTO `user_knp_log` VALUES (19, 13, 10, 10, 0, 0, '评论用户 打赏:10KNP', 1536155284);
INSERT INTO `user_knp_log` VALUES (20, 2, 10, 10, 20, 1, '打赏获得:10KNP', 1536155284);
INSERT INTO `user_knp_log` VALUES (21, 16, 10, 5, 5, 0, '评论用户 打赏:5KNP', 1536155317);
INSERT INTO `user_knp_log` VALUES (22, 14, 10, 5, 15, 1, '打赏获得:5KNP', 1536155317);
INSERT INTO `user_knp_log` VALUES (23, 15, 10, 5, 5, 0, '评论用户 打赏:5KNP', 1536155453);
INSERT INTO `user_knp_log` VALUES (24, 16, 10, 5, 15, 1, '打赏获得:5KNP', 1536155453);
INSERT INTO `user_knp_log` VALUES (25, 1, 21, 1, 20, 0, '评论用户 打赏:1KNP', 1536591722);
INSERT INTO `user_knp_log` VALUES (26, 5, 21, 1, 22, 1, '打赏获得:1KNP', 1536591722);
INSERT INTO `user_knp_log` VALUES (27, 5, 10, 1, 9, 0, '评论用户 打赏:1KNP', 1536592051);
INSERT INTO `user_knp_log` VALUES (28, 1, 10, 1, 11, 1, '打赏获得:1KNP', 1536592051);
INSERT INTO `user_knp_log` VALUES (29, 5, 9, 2, 7, 0, '评论用户 打赏:2KNP', 1536593315);
INSERT INTO `user_knp_log` VALUES (30, 1, 9, 2, 11, 1, '打赏获得:2KNP', 1536593315);
INSERT INTO `user_knp_log` VALUES (31, 5, 7, 2, 5, 0, '评论用户 打赏:2KNP', 1536594573);
INSERT INTO `user_knp_log` VALUES (32, 1, 7, 2, 9, 1, '打赏获得:2KNP', 1536594573);
INSERT INTO `user_knp_log` VALUES (33, 5, 5, 1, 4, 0, '评论用户 打赏:1KNP', 1536595769);
INSERT INTO `user_knp_log` VALUES (34, 1, 5, 1, 6, 1, '打赏获得:1KNP', 1536595769);
INSERT INTO `user_knp_log` VALUES (35, 1, 26, 2, 24, 0, '评论用户 打赏:2KNP', 1536596256);
INSERT INTO `user_knp_log` VALUES (36, 5, 26, 2, 28, 1, '打赏获得:2KNP', 1536596256);
INSERT INTO `user_knp_log` VALUES (37, 5, 6, 1, 5, 0, '评论用户 打赏:1KNP', 1536596315);
INSERT INTO `user_knp_log` VALUES (38, 1, 6, 1, 7, 1, '打赏获得:1KNP', 1536596315);
INSERT INTO `user_knp_log` VALUES (39, 2, 15, 1, 14, 0, '评论用户 打赏:1KNP', 1536833039);
INSERT INTO `user_knp_log` VALUES (40, 1, 15, 1, 16, 1, '打赏获得:1KNP', 1536833039);
INSERT INTO `user_knp_log` VALUES (41, 1, 26, 1, 25, 0, '评论用户 打赏:1KNP', 1536939564);
INSERT INTO `user_knp_log` VALUES (42, 5, 26, 1, 27, 1, '打赏获得:1KNP', 1536939564);
INSERT INTO `user_knp_log` VALUES (43, 1, 26, 1, 25, 0, '评论用户 打赏:1KNP', 1536939569);
INSERT INTO `user_knp_log` VALUES (44, 5, 26, 1, 27, 1, '打赏获得:1KNP', 1536939569);
INSERT INTO `user_knp_log` VALUES (45, 1, 26, 1, 25, 0, '评论用户 打赏:1KNP', 1536939592);
INSERT INTO `user_knp_log` VALUES (46, 5, 26, 1, 27, 1, '打赏获得:1KNP', 1536939592);
INSERT INTO `user_knp_log` VALUES (47, 1, 26, 1, 25, 0, '评论用户 打赏:1KNP', 1536939595);
INSERT INTO `user_knp_log` VALUES (48, 5, 26, 1, 27, 1, '打赏获得:1KNP', 1536939595);
INSERT INTO `user_knp_log` VALUES (49, 5, 5, 2, 3, 0, '评论用户 打赏:2KNP', 1536939616);
INSERT INTO `user_knp_log` VALUES (50, 1, 5, 2, 7, 1, '打赏获得:2KNP', 1536939616);
INSERT INTO `user_knp_log` VALUES (51, 5, 5, 2, 3, 0, '评论用户 打赏:2KNP', 1536939650);
INSERT INTO `user_knp_log` VALUES (52, 1, 5, 2, 7, 1, '打赏获得:2KNP', 1536939650);
INSERT INTO `user_knp_log` VALUES (53, 17, 0, 10, 10, 1, '首次注册获得:10KNP', 1537689356);
INSERT INTO `user_knp_log` VALUES (54, 18, 0, 10, 10, 1, '首次注册获得:10KNP', 1537689357);
INSERT INTO `user_knp_log` VALUES (55, 19, 0, 10, 10, 1, '首次注册获得:10KNP', 1537689374);

-- ----------------------------
-- Table structure for weixin_auth
-- ----------------------------
DROP TABLE IF EXISTS `weixin_auth`;
CREATE TABLE `weixin_auth`  (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `wx_appid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `access_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token',
  `signature` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'signature',
  `expires_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token',
  `expires_in` bigint(20) NULL DEFAULT NULL,
  `jsapi_ticket` bigint(20) NULL DEFAULT NULL COMMENT '更新时间[date]',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of weixin_auth
-- ----------------------------
INSERT INTO `weixin_auth` VALUES (1, 0, '8_Uvyh4Lkvj5bPjEwN2q1igv7T0zBlQ83cMkUgCsrDnMMpu-1REXJ9RS3KuEGHCph86aqMOpJ2MVbplEcgQk1jGc_LL3WWUf443U', 'c0d1ad3c2425b0c58a4d02541cd21e68ea06c3a1', '1524047148', 7200, 0);

SET FOREIGN_KEY_CHECKS = 1;
