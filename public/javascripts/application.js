// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function set_stylesheet(styletitle){
	var links=document.getElementsByTagName("link");
	var found=false;
	for(var i=0;i<links.length;i++)
	{
		var rel=links[i].getAttribute("rel");
		var title=links[i].getAttribute("title");
		if(rel.indexOf("style")!=-1&&title)
		{
			links[i].disabled=true; // IE needs this to work. IE needs to die.
			if(styletitle==title) { links[i].disabled=false; found=true; }
		}
	}
	//if(!found) set_preferred_stylesheet();
}

function insert_emoticon(text){
  $('leaf[content]').value = $('leaf[content]').value+text;
}

function show_smiley_helper(){
  $('smiley_helper').toggle();
}
