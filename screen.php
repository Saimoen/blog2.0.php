<?php

class AuthDB
{
  private PDOStatement $statementRegister;

  function __construct(private PDO $pdo)
    {
      // Préparation de la requête SQL
      $this->statementRegister = $pdo->prepare('INSERT INTO user VALUES (
      DEFAULT,
      :firstname,
      :lastname,
      :email,
      :password
    )');
    }

    function register(array $user): ?string
    {
        // Encryptage du mot de passe
        $hashedPassword = password_hash($user['password'], PASSWORD_ARGON2I);
        // Récupération des valeurs des champs de saisie
        $this->statementRegister->bindValue(':firstname', $user['firstname']);
        $this->statementRegister->bindValue(':lastname', $user['lastname']);
        $this->statementRegister->bindValue(':email', $user['email']);
        $this->statementRegister->bindValue(':password', $hashedPassword);
        $this->statementRegister->execute();
        return 'Vous êtes désormais membre !';
    }
}

return new AuthDB($pdo);