/*
Navicat MySQL Data Transfer

Source Server         : dolphin
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : burrhamilton

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-03-11 09:00:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(10000) NOT NULL,
  `votes_num` int(11) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `statement` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jwgbf0ajnq10u13v3jr2e5s88` (`author_id`),
  KEY `FK_8ek057q05ykmq8s622xd3ehpu` (`statement`),
  CONSTRAINT `FK_8ek057q05ykmq8s622xd3ehpu` FOREIGN KEY (`statement`) REFERENCES `statement` (`id`),
  CONSTRAINT `FK_jwgbf0ajnq10u13v3jr2e5s88` FOREIGN KEY (`author_id`) REFERENCES `social_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('7', 'sejbfejbfe', '2', '15', '3');
INSERT INTO `answer` VALUES ('10', 'wefef', '4', '10', '3');
INSERT INTO `answer` VALUES ('11', 'Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect', '1', '10', '4');
INSERT INTO `answer` VALUES ('12', 'People are free to choose!', '1', '10', '3');
INSERT INTO `answer` VALUES ('13', 'Human life is in the hands of God', '0', '10', '4');
INSERT INTO `answer` VALUES ('14', 'sdfjbejhb', '1', '10', '4');
INSERT INTO `answer` VALUES ('15', 'lallaa', '0', '10', '4');
INSERT INTO `answer` VALUES ('16', 'trololo', '0', '10', '4');
INSERT INTO `answer` VALUES ('17', 'hwfjve', '0', '10', '4');
INSERT INTO `answer` VALUES ('18', 'aswcevevv', '0', '10', '4');
INSERT INTO `answer` VALUES ('19', 'efevce', '0', '10', '4');
INSERT INTO `answer` VALUES ('20', 'scecec', '0', '10', '4');
INSERT INTO `answer` VALUES ('21', 'mcnbrhvcebwxe', '0', '10', '4');
INSERT INTO `answer` VALUES ('22', 'sadvrbtbtb', '1', '10', '4');
INSERT INTO `answer` VALUES ('23', 'sakcebvjrevjvc4e', '0', '10', '4');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `negative_statement` bigint(20) DEFAULT NULL,
  `positive_statement` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k179yjp59ndpikaaruth27f9m` (`author_id`),
  KEY `FK_q784dbg5dn1dkwgxk2wl7j0t2` (`negative_statement`),
  KEY `FK_9uki3kiudik39646i92vg8ti4` (`positive_statement`),
  CONSTRAINT `FK_9uki3kiudik39646i92vg8ti4` FOREIGN KEY (`positive_statement`) REFERENCES `statement` (`id`),
  CONSTRAINT `FK_k179yjp59ndpikaaruth27f9m` FOREIGN KEY (`author_id`) REFERENCES `social_user` (`id`),
  CONSTRAINT `FK_q784dbg5dn1dkwgxk2wl7j0t2` FOREIGN KEY (`negative_statement`) REFERENCES `statement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('2', 'Euthanasia is a choice of everyone', '2016-02-21', '11', '4', '3');
INSERT INTO `question` VALUES ('4', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit aenean commodo ligula eget dolor?', '2016-02-27', '10', '8', '7');
INSERT INTO `question` VALUES ('7', 'Test question', '2016-03-07', '10', '14', '13');
INSERT INTO `question` VALUES ('8', 'Big question', '2016-03-08', '10', '16', '15');

-- ----------------------------
-- Table structure for `social_user`
-- ----------------------------
DROP TABLE IF EXISTS `social_user`;
CREATE TABLE `social_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `unique_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_aglynd43bei5wfpodoqlus38c` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_user
-- ----------------------------
INSERT INTO `social_user` VALUES ('10', 'vitalii.oleksiv@gmail.com', '1', 'Vitalii Oleksiv', 'https://graph.facebook.com/v2.5/780596582044604/picture', '$2a$10$8mXAYLyGa1aAwaklUZewHOnC3onV/AsAImJpdlgC9bMw5KHXCkhYa', 'Software Developer', 'facebook780596582044604');
INSERT INTO `social_user` VALUES ('11', 'stryzh@i.ua', '0', 'Olesya Stryzhko', 'https://graph.facebook.com/v2.5/1043079749063936/picture', '$2a$10$qjiVnlXdUkVsmJHfYveILejz.oZ1ozxVu.eLm6UiaF/XJbRS1/btO', 'Web Designer', 'facebook1043079749063936');
INSERT INTO `social_user` VALUES ('15', 'vitalii.oleksiv@gmail.com', '0', 'Vitalii Oleksiv', 'https://lh5.googleusercontent.com/-v-Vl2kTRYOk/AAAAAAAAAAI/AAAAAAAAABE/4_SNV7wXxJc/photo.jpg', '$2a$10$qNLKG/DDc13yK2Kd3Ct2Dur.slogf874XdKYipTunRPJsL6mueqEu', 'Tao Master', 'google102757310490621492959');
INSERT INTO `social_user` VALUES ('23', 'vitalii.oleksiv@gmail.com', '0', 'Vitalii Oleksiv', 'http://abs.twimg.com/sticky/default_profile_images/default_profile_5_normal.png', '$2a$10$KcM5NFmmQn1NgxzoBtbSzOCABaQeM19OH7V7Az327NQxolm23wjja', 'Painter', 'twitter2574904645');

-- ----------------------------
-- Table structure for `statement`
-- ----------------------------
DROP TABLE IF EXISTS `statement`;
CREATE TABLE `statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `likes` int(11) NOT NULL,
  `statement` varchar(1000) NOT NULL,
  `question` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2fsr273tbd64jc577i1l2wmkl` (`question`),
  CONSTRAINT `FK_2fsr273tbd64jc577i1l2wmkl` FOREIGN KEY (`question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statement
-- ----------------------------
INSERT INTO `statement` VALUES ('3', '7', 'Euthanasia should be available to everyone', '2');
INSERT INTO `statement` VALUES ('4', '15', 'Euthanasia should be forbidden in the whole world', '2');
INSERT INTO `statement` VALUES ('7', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget.', '4');
INSERT INTO `statement` VALUES ('8', '0', 'Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '4');
INSERT INTO `statement` VALUES ('13', '0', 'Positive statement', '7');
INSERT INTO `statement` VALUES ('14', '0', 'Negative statement', '7');
INSERT INTO `statement` VALUES ('15', '0', 'Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect', '8');
INSERT INTO `statement` VALUES ('16', '0', 'Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect. Cume sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit, consect', '8');

-- ----------------------------
-- Table structure for `userconnection`
-- ----------------------------
DROP TABLE IF EXISTS `userconnection`;
CREATE TABLE `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`),
  UNIQUE KEY `UserConnectionProviderUser` (`providerId`,`providerUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userconnection
-- ----------------------------
INSERT INTO `userconnection` VALUES ('facebook1043079749063936', 'facebook', '1043079749063936', '1', 'Olesya Stryzhko', 'https://www.facebook.com/app_scoped_user_id/1043079749063936/', 'https://graph.facebook.com/v2.5/1043079749063936/picture', 'CAACfJO28zh0BACYLwF5Be9hpBQlVZCt6PSoZAIityQcKoIalxRCchdWvxY4qtk1nfZAKw12VF3iMjxQNvTjwu3ybZAVltehAF3k3R5crr1pcYXRXZCIpXZAuUXoexLQTQWBbPYZABwBpR6uCMXPppLGZC8E1VkJM4orvvD7Rr6vfbbPam5vtwqF1GiNqZBnI1dmOmtqgRS3Eg9wZDZD', null, null, '1461493434933');
INSERT INTO `userconnection` VALUES ('facebook780596582044604', 'facebook', '780596582044604', '1', 'Vitalii Oleksiv', 'https://www.facebook.com/app_scoped_user_id/780596582044604/', 'https://graph.facebook.com/v2.5/780596582044604/picture', 'CAACfJO28zh0BALWyj60DMNLlaca30ZCPLW59dwlLKrwxjuZBAu1TzuFeLNN4NKwNM3LSN59k2TbpXZAiJltIn49K1ZCPwfyk8YoFyHLpU7tpGPPVMZCbyAM1s5Bqu6NZBjD6ZCQ85YKAWAmqfCKerBm3WAd5L3TIBtbwJrQ8XZBaJWnqjwDNonbVAApP9ZA9thFIzCJsTK2PepgZDZD', null, null, '1462537677667');
INSERT INTO `userconnection` VALUES ('google102757310490621492959', 'google', '102757310490621492959', '1', 'Vitalii Oleksiv', 'https://plus.google.com/102757310490621492959', 'https://lh5.googleusercontent.com/-v-Vl2kTRYOk/AAAAAAAAAAI/AAAAAAAAABE/4_SNV7wXxJc/photo.jpg', 'ya29.lQIEYF6pwAzvQpZ4FbKR0hUc0IAhtuzyHvUDz6axEbfTf5OuyDOMIzSoL1cMx1RqWg', null, null, '1456600845445');
INSERT INTO `userconnection` VALUES ('twitter2574904645', 'twitter', '2574904645', '1', '@VitaliiOleksiv', 'http://twitter.com/VitaliiOleksiv', 'http://abs.twimg.com/sticky/default_profile_images/default_profile_5_normal.png', '2574904645-OtFILNRuPCjJ0pmAqLmdQG9BSW4IrhjWrLzdnNz', '46YTV4pWEy0RCjNAKZYtu723b3Q29ffgOZiwyUSp8tb0g', null, null);

-- ----------------------------
-- Table structure for `votes`
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `answer_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`answer_id`,`user_id`),
  KEY `FK_jpy5cpqhdr870g41de432t0kp` (`user_id`),
  CONSTRAINT `FK_d4u6v02t5h2hgh0be3nmiwad0` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `FK_jpy5cpqhdr870g41de432t0kp` FOREIGN KEY (`user_id`) REFERENCES `social_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of votes
-- ----------------------------
INSERT INTO `votes` VALUES ('7', '10');
INSERT INTO `votes` VALUES ('10', '10');
INSERT INTO `votes` VALUES ('11', '10');
INSERT INTO `votes` VALUES ('12', '10');
INSERT INTO `votes` VALUES ('14', '10');
INSERT INTO `votes` VALUES ('22', '10');
