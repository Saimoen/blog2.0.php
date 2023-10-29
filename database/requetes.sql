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
