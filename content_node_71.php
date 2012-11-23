<?php
// PLEASE DO NOT EDIT THIS
$node = node_load(array('nid' => 70));
global $base_url;
$baseUrl = $base_url . '/';
$videoUrl = $baseUrl . $node->field_video['und'][0]['url'];
$imageUrl = file_create_url($node->field_image['und'][0]['uri']);

?>

<table style="border: 0;">
  <tr>
    <td style="border: 0; padding: 0 15px 0 0;">
      <img src="sites/default/files/HCAMNews-SM.jpg" alt="HCAM News" />
      <p>Welcome to Hopkinton's half-hour news program, airing Monday, Wednesday and Friday evenings at 6:00 PM. Catch the latest episode on the right, or visit our archives <a href="http://www.hcam.tv/news">here</a>.<br>
<hr>
<table border="0" cellpadding="3" cellspacing="0">
<tr>
<td align="left" valign="top"><img src="http://www.hcam.tv/images/michelle.png" align="left" border="0" height="34" width="24"><font size="1"><b> Michelle Murdock</b><br>
<i> News Director</i></font></td>
<td align="left" valign="top"><font size="1"><b><img border="0" src="http://www.hcam.tv/images/stephanie.png" width="24" height="33" align="left"> Stephanie Kane</b><br>
<i> News Producer</i></font></td>
</tr>
<tr>
<td align="left" valign="top"></td>
<td align="left" valign="top"></td>
</tr>
<tr>
<td align="left" valign="top"></td>
<td align="left" valign="top"></td>
</tr>
<tr>
<td align="left" valign="top"></td>
<td align="left" valign="top"></td>
    </tr>
</table>
</td>
<td style="border: 0; padding: 0;">
<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="530" height="380">
<param name="movie" value="<?php print $baseUrl; ?>sites/default/themes/hcamtv/mediaplayer/player.swf" />
<param name="allowfullscreen" value="true" />
<param name="allowscriptaccess" value="always" />
<param name="wmode" value="transparent" />
     <param name="flashvars" value="file=<?php print $videoUrl; ?>&image=<?php print $imageUrl; ?>&skin=<?php print $baseUrl; ?>sites/default/themes/hcamtv/mediaplayer/skins/beelden/beelden.xml&autostart=false&volume=100" />
<embed type="application/x-shockwave-flash" id="player2" wmode="transparent" name="player2" src="<?php print $baseUrl; ?>sites/default/themes/hcamtv/mediaplayer/player.swf" width="530" height="380" allowscriptaccess="always" allowfullscreen="true" flashvars="file=<?php print $videoUrl; ?>&image=<?php print $imageUrl; ?>&skin=<?php print $baseUrl; ?>sites/default/themes/hcamtv/mediaplayer/skins/beelden/beelden.xml&autostart=false&volume=100" />
</object>
</td>
  </tr>
</table>