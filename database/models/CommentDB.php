<?php
class CommentDB
{
    private PDOStatement $statementReadByArticle;
    private PDOStatement $statementCreateByArticle;

    function __construct(private PDO $pdo)
    {
        $this->statementReadByArticle = $pdo->prepare('
            SELECT comment.content, user.firstname prenom, user.lastname nom
            FROM comment
            LEFT JOIN user ON comment.id_author = user.id
            WHERE comment.id_article = :id_article
        ');

        $this->statementCreateByArticle = $pdo->prepare('
            INSERT INTO comment (id_article, id_author, content)
            VALUES (:id_article, :id_author, :content)
        ');
    }

    public function fetchByArticle(int $articleId): array
    {
        $this->statementReadByArticle->bindParam(':id_article', $articleId, PDO::PARAM_INT);
        $this->statementReadByArticle->execute();
        return $this->statementReadByArticle->fetchAll();
    }

    public function createComment(int $articleId, int $authorId, string $content): bool
    {
        $this->statementCreateByArticle->bindParam(':id_article', $articleId, PDO::PARAM_INT);
        $this->statementCreateByArticle->bindParam(':id_author', $authorId, PDO::PARAM_INT);
        $this->statementCreateByArticle->bindParam(':content', $content, PDO::PARAM_STR);

        return $this->statementCreateByArticle->execute();
    }
}

return new CommentDB($pdo);
