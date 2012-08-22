var media_events = new Array();

var video;

// was extracted from the spec in November 2011
media_events["loadstart"] = 0;
media_events["progress"] = 0;
media_events["suspend"] = 0;
media_events["abort"] = 0;
media_events["error"] = 0;
media_events["emptied"] = 0;
media_events["stalled"] = 0;
media_events["loadedmetadata"] = 0;
media_events["loadeddata"] = 0;
media_events["canplay"] = 0;
media_events["canplaythrough"] = 0;
media_events["playing"] = 0;
media_events["waiting"] = 0;
media_events["seeking"] = 0;
media_events["seeked"] = 0;
media_events["ended"] = 0;
media_events["durationchange"] = 0;
media_events["timeupdate"] = 0;
media_events["play"] = 0;
media_events["pause"] = 0;
media_events["ratechange"] = 0;
media_events["volumechange"] = 0;


function capture(event) {
  media_events[event.type] = media_events[event.type] + 1;
  
  if(event.type == 'loadstart')
  {
    //video.play();
    //console.log('Forced Play!');
  }
  
  //console.log(event.type);
}

function init_events() {
  video = document.getElementById("video");
  
  for (key in media_events) { 
    video.addEventListener(key, capture, false);
  }
}

function playvideo() {
  $('#video').get(0).play();
  
  //console.log ('clicked')
}
