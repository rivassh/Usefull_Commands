# run a command in ubuntu
* ctrl+alt+T to open a terminal
* alt+F2 to execute a command without terminal

* update url of wordpress
* best way to replace all in editor

```	
	sed -i -e 's/http\:\/\/url\.com/http\:\/\/localhost\:port/g' hello.txt 
```	
* or update database

```
	update wp_options set option_value = 'url:port' where option_name = 'siteurl';
	update wp_options set option_value = 'url:port' where option_name = 'home';
	UPDATE wp_links SET link_image = REPLACE(link_image,'old_url','');
	UPDATE wp_links SET link_url = REPLACE(link_url,'old_url','');
	UPDATE wp_posts SET post_content = REPLACE(post_content,'old_url','');
	UPDATE wp_postmeta SET meta_value = REPLACE(meta_value,'old_url','');
```

# split a movie
	ffmpeg -ss 00:00:00 -t 00:46:00 -i inputfile outputfile
* in error with : 

```
	ffmpeg -ss 00:00:00 -t 00:46:00 -i inputfile -max_muxing_queue_size 400 outputfile
```

# find last change files
	find /<directory> -newermt "-24 hours" -ls
