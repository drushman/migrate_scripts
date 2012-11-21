
<?php 
	//get values
	$fields = db_select('content_field_image','n')
				->fields('n', array('field_image_data', 'nid', 'field_image_fid'))
				->condition('field_image_data', 'NULL', '<>')
				->execute()
				->fetchAll(); 
	//update
	foreach ($fields as $field) { 
		$values = unserialize($field->field_image_data);
		if ($values['description'] != '') {
			db_update('field_data_field_image')
			  ->fields(array('field_image_alt' => $values['description']))
			  ->condition('entity_id', $field->nid)
			  ->condition('field_image_fid', $field->field_image_fid)
			  ->execute();

			db_update('field_revision_field_image')
			  ->fields(array('field_image_alt' => $values['description']))
			  ->condition('entity_id', $field->nid)
			  ->condition('field_image_fid', $field->field_image_fid)
			  ->execute();
		}
	}


