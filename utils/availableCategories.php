<?php
$availableCategories = ['Urbain', 'Mer', 'Terre'];
$coll = collator_create('fr_FR');
uasort($availableCategories, fn ($a, $b) => collator_compare($coll, $a, $b));

return $availableCategories;
