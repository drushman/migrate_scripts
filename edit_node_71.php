<?php
	$filename = 'sites/all/migrate_scripts/content_node_71.php';
	$content = trim(file_get_contents($filename));
	$node = node_load(71);
	$node->body['und'][0]['value'] = $content;
	node_save($node);

	
	global $base_url;
	// update block
	$block_content = "<div style='padding-top: 10px;'>";
	$block_content .= "<img src='{$base_url}" ."/sites/default/files/ontheair.png' alt='On the air' style='float: right;' />";
	$block_content .= "<a href='http://www.hcam.tv/live-stream' style='float: right;'>";
	$block_content .= "<img src='{$base_url}" ."/sites/default/files/online.png' alt='On-line' />";
	$block_content .= "</a></div>";
	$block_content .= "<div style='clear: both;'><!-- --></div>";
	
	db_update('block_custom') // Table name no longer needs {}
	  ->fields(array(
		'body' => $block_content,
	  ))
	  ->condition('bid', 2)
	  ->execute();