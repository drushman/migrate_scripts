<?php define('DRUPAL_ROOT', getcwd()); require_once DRUPAL_ROOT . '/includes/bootstrap.inc'; drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL); 
///////////////////////////////////////////////// 
function imagecache_preset_actions($preset, $reset = FALSE) {
  $actions_cache = array();
    $result = db_query('SELECT * FROM {imagecache_action} where presetid = '.$preset['presetid'].' order by weight' );
    foreach ($result as $row ) {
    $row=(array)$row;
      $row['data'] = unserialize($row['data']);
      $actions_cache[$preset['presetid']][] = $row;
    }
  return isset($actions_cache[$preset['presetid']]) ? $actions_cache[$preset['presetid']] : array();
}
///////////////////////////////////////////////// ///////////////////////////////////////////////// 
function imagecache_presets() {
  $presets = array();
    $normal_presets = array();
    $result = db_query('SELECT * FROM {imagecache_preset} ORDER BY presetname');
    
    foreach ($result as $preset) {
      $preset=(array)$preset;
      $presets[$preset['presetid']] = $preset;
      $presets[$preset['presetid']]['actions'] = imagecache_preset_actions($preset);
      $presets[$preset['presetid']]['storage'] = 0;
      // Collect normal preset names so we can skip defaults and mark overrides accordingly
      $normal_presets[$preset['presetname']] = $preset['presetid'];
    }
  return $presets;
}
///////////////////////////////////////////////// ///////////////////////////////////////////////// 
$styles_cnt=0; $effects_new_cnt=0; 
$effects_ext_cnt=0; $presets=imagecache_presets(); foreach($presets as $preset)
    {
    $styles_cnt++;// inc styles
    
    $style=image_style_load($preset['presetname']);
    
    $style['name']=$preset['presetname'];
    $style=image_style_save($style);
    if(!isset($style['effects']))
        {
        $style['effects']=array();
        }
    foreach($preset['actions'] as $action)
        {
        $action['action']=str_replace('imagecache','image',$action['action']);
        $action['module']=str_replace('imagecache','image',$action['module']);
        
        $effect_ieid=FALSE;// effect not exists
        foreach($style['effects'] as $effect)
            {
            if($effect['name'] == $action['action'] &&
                $effect['module'] == $action['module'] &&
                $effect['weight'] == $action['weight'] &&
                $effect['data'] == $action['data'] )
                {
                $effect_ieid=$effect['ieid'];// effect exists
                }
            }
        $effect=array();
        if($effect_ieid)
            {
            $effects_ext_cnt++;// inc exists
            $effect=image_effect_load($effect_ieid,$style['name']);
            }
        else
            {
            $effects_new_cnt++;// inc new
            $effect=image_effect_definition_load($action['action']);
            }
        
        $effect['isid'] = $style['isid'];
            
        $effect['name'] = $action['action'];
        $effect['module'] == $action['module'];
        $effect['weight'] = $action['weight'];
        $effect['data'] = $action['data'];
        $effect = image_effect_save($effect);
        $style['effects'][$effect['ieid']] = $effect;
        }
    $style=image_style_save($style);
    }
print "Styles: $styles_cnt, Effects new: $effects_new_cnt, Effects exists: $effects_ext_cnt \n";
?>
