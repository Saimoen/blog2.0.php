use blog;

CREATE TABLE `blog`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `blog`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
  CREATE TABLE `blog`.`session` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `blog`.`article`
ADD COLUMN `author` INT NULL AFTER `category`;

ALTER TABLE `blog`.`article`
ADD INDEX `fk_article_user_idx` (`author` ASC) VISIBLE;

ALTER TABLE `blog`.`article`
ADD CONSTRAINT `fk_article_user`
  FOREIGN KEY (`author`)
  REFERENCES `blog`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `blog`.`comment`
ADD COLUMN `id_author` INT NULL AFTER `id`;

ALTER TABLE `blog`.`comment`
ADD INDEX `fk_comment_user_idx` (`id_author` ASC) VISIBLE;

ALTER TABLE `blog`.`comment`
ADD CONSTRAINT `fk_comment_user`
  FOREIGN KEY (`id_author`)
  REFERENCES `blog`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

use blog;  

select * from blog.comment;

SELECT comment.content, comment.id_article article, user.firstname prenom, user.lastname nom
FROM comment
LEFT JOIN user ON comment.id_author = user.id
LEFT JOIN article ON comment.id_article = article.id;

SELECT comment.content, comment.id_author FROM comment LEFT JOIN article ON comment.id_article = article.id
