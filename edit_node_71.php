<?php
	$filename = 'sites/all/migrate_scripts/content_node_71.php';
	$content = trim(file_get_contents($filename));
	$node = node_load(71);
	$node->body['und'][0]['value'] = $content;
	node_save($node);
