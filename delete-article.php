<?php
require_once __DIR__ . '/database/database.php';
$authDB = require_once __DIR__ . '/database/security.php';
$currentUser = $authDB->isLoggedin();
$articleDB = require_once __DIR__ . '/database/models/ArticleDB.php';
$articles = $articleDB->fetchAll();
if ($currentUser) {
  $_GET = filter_input_array(INPUT_GET, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
  $id = $_GET['id'] ?? '';
  if ($id) {
    $article = $articleDB->fetchOne($id);
    if ($article['author'] === $currentUser['id']) {
      $articleDB->deleteOne($id);
    }
  }
}

header('Location: /');
