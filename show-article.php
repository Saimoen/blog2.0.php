<?php
require_once __DIR__ . '/database/database.php';
$articleDB = require_once __DIR__ . '/database/models/ArticleDB.php';
$authDB = require_once __DIR__ . '/database/security.php';
$currentUser = $authDB->isLoggedin();
$articles = $articleDB->fetchAll();
$commentDB = require_once __DIR__ . '/database/models/CommentDB.php';

$_GET = filter_input_array(INPUT_GET, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$id = $_GET['id'] ?? '';


if (!$id) {
  header('Location: /');
} else {
  $comments = $commentDB->fetchByArticle($id);
  $article = $articleDB->fetchOne($id);

  $content = $_POST['commentaire'] ?? '';
  
  if ($content) {
    $commentDB->createComment($article['id'], $currentUser['id'], $content);
    header('Location: /');
}

}
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <?php require_once 'includes/head.php' ?>
  <link rel="stylesheet" href="/public/css/show-article.css">
  <title>Article</title>
</head>

<body>
  <div class="container1">
    <?php require_once 'includes/header.php' ?>
    <div class="content">
      <div class="article-container">
        <a class="article-back" href="/">Retour à la liste des articles</a>
        <div class="article-cover-img" style="background-image:url(<?= $article['image'] ?>)"></div>
        <h1 class="article-title"><?= $article['title'] ?></h1>
        <div class="separator"></div>
        <p class="article-content"><?= $article['content'] ?></p>
        <p class="article-author"><?= $article['firstname'] . ' ' . $article['lastname'] ?></p>
        
        <?php if ($currentUser) : ?>
        <section class="mb-5">
  <div class="card bg-light">
    <div class="card-body">
      <!-- Comment form-->
      <form action="/show-article.php<?= $id ? "?id=$id" : '' ?>" , method="POST" class="mb-4 d-flex">
        <textarea
          class="form-control"
          rows="3"
          name="commentaire"
          id="commentaire"
          placeholder="Laisse en commentaire ton avis !"
        ></textarea>
        <button class="btn btn-primary" type="submit">
        Commenter
        </button>
      </form>
        <?php foreach ($comments as $com) : ?>
          <?php if ($com['content']) : ?>
      <!-- Comment with nested comments-->
      <div class="d-flex mb-4">
        <!-- Parent comment-->
        <div class="flex-shrink-0">
          <img
            class="rounded-circle"
            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
            alt="..."
          />
        </div>
        <div class="ms-3">
          <div class="fw-bold"><?= $com['prenom'] ?> <?= $com['nom'] ?></div>
          <p class="article-content"><?= $com['content'] ?></p>
        </div>
      </div>
      <?php endif; ?>
      <?php endforeach; ?>
    </div>
 
  </div>
</section>
<?php endif; ?>





        <?php if ($currentUser && $currentUser['id'] === $article['author']) : ?>
          <div class="action">
            <a class="btn btn-secondary" href="/delete-article.php?id=<?= $article['id'] ?>">Supprimer</a>
            <a class="btn btn-primary" href="/form-article.php?id=<?= $article['id'] ?>">Editer l'article</a>
          </div>
        <?php endif; ?>
      </div>
    </div>
    <?php require_once 'includes/footer.php' ?>
  </div>

</body>

</html>

