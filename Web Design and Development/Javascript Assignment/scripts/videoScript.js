//(videoScript.js, by Irfan Hanafi 17098640)

document.addEventListener ("DOMContentLoaded", handleWindowLoad);

function handleWindowLoad()
{
	
	var myVideo = document.querySelector ( "video" );
	var playButton = document.getElementById( "playPause" );
	var stopButton = document.getElementById( "stop" );
	var muteButton = document.getElementById( "mute" );
	var scrubSlider = document.getElementById( "seekBar" );
	var volumeSlider = document.getElementById( "volumeBar" ) ;
	var playbackSpeed = document.getElementById( "playbackSelect" );
	var fastForward = document.getElementById( "fastForward" );
	
	//Cursor Pointer Change
	playButton.addEventListener( "mouseover", cursorPointer );
	stopButton.addEventListener( "mouseover", cursorPointer );
	muteButton.addEventListener( "mouseover", cursorPointer );
	scrubSlider.addEventListener( "mouseover", cursorPointer );
	volumeSlider.addEventListener( "mouseover", cursorPointer );
	playbackSpeed.addEventListener ( "mouseover" , cursorPointer ) ;
	fastForward.addEventListener( "mouseover" , cursorPointer ) ;
	
	function cursorPointer()
	{
		this.style.cursor = "pointer";
	}
	
	//Video Controls
	playButton.addEventListener( "click", playPauseVideo );
	stopButton.addEventListener( "click", stopVideo );
	muteButton.addEventListener( "click", muteVideo );
	
	function playPauseVideo()
	{
		if (myVideo.paused === true)
		{
			myVideo.play();
			playButton.innerHTML = "Pause";
		}
		else
		{
			myVideo.pause();
			playButton.innerHTML = "Play";
		}
	}
	
	function stopVideo() //Assignment
	{
		myVideo.pause();
		myVideo.currentTime = 0; //seeks current time to 0
		playButton.innerHTML = "Play"; //video will not be playing so this needs to be reset to Play
	}
	
	function muteVideo()
	{
		if(myVideo.muted === false)
		{
			myVideo.muted = true;
			muteButton.innerHTML = "Un-Mute";
			volumeSlider.value = 0;
		}
		else
		{
			myVideo.muted = false;
			muteButton.innerHTML = "Mute";
			volumeSlider.value = 0.5;
		}
	}
	
	//Seek Slider
	scrubSlider.addEventListener( "input", scrubVideo );
	scrubSlider.addEventListener( "mousedown", pauseSlider) ;
	scrubSlider.addEventListener( "mouseup", resumeSlider) ;
	
	function scrubVideo()
	{
		var scrubTime = myVideo.duration * (scrubSlider.value / 100) ;
		myVideo.currentTime = scrubTime ;
	}
	
	function movePlaySlider()
	{
		if(myVideo.currentTime > 0)
		{
			scrubSlider.value = (myVideo.currentTime/myVideo.duration)* 100;
		}
		else
		{
			scrubSlider.value = 0;
		}
	}
	
	function pauseSlider()
	{
		myVideo.pause();
	}
	
	function resumeSlider ()
	{
		myVideo.play();
	}
	
	//Time Update
	myVideo.addEventListener( "timeupdate", movePlaySlider );
	myVideo.addEventListener ( "durationchange", displayDuration ) ;
	myVideo.addEventListener ( "timeupdate" , durationChange ) ;
	
	function displayDuration ()
	{
		var timeDisplay = document.getElementById ( "timeField" ) ;
		var durationDisplay = document.getElementById ( "durationField" ) ;
		var minutes = Math.floor ( myVideo.duration / 60 ) ;
		var seconds = Math.floor ( myVideo.duration % 60 ) ;
		// % takes the remainder of the division
		
		if (minutes < 10)
			minutes = "0" + minutes ;
		if (seconds < 10)
			seconds = "0" + seconds ;
		//adds 0 before the number if its less than 10
		
		timeDisplay.value = "00:00" ; //added because the box is blank when the video hasn't started
		durationDisplay.value = minutes + ":" + seconds;
	}
	
	function durationChange () // Assignment
	{
		var timeDisplay = document.getElementById ( "timeField" );
		var minutes = Math.floor ( myVideo.currentTime /60 ) ;
		var seconds = Math.floor ( myVideo.currentTime % 60 ) ;
		
		if (minutes < 10)
			minutes = "0" + minutes ;
		if (seconds < 10)
			seconds = "0" + seconds ;
		
		timeDisplay.value = minutes + ":" + seconds;
	}
	
	//Volume - Assignment
	volumeSlider.addEventListener( "input", scrubVolume );
	
		function scrubVolume()
	{
		myVideo.volume = volumeSlider.value ; //assigns slider value to volume value
		
		if (myVideo.volume === 0) // changes Mute button to respond to the change in value
		{
			muteButton.innerHTML = "Un-Mute";
		}
		else
		{
			muteButton.innerHTML = "Mute"  ;
		}
	}
	
	//Playback - Assignment
	playbackSpeed.addEventListener ( "change" , playbackChange ) ;
	
	function playbackChange()
	{
		myVideo.playbackRate = playbackSpeed.value ;
	}
	
	//Fast Forward - Assignment
	fastForward.addEventListener( "mousedown" , tripleFF ) ; //holding click
	fastForward.addEventListener( "mouseup" , doubleFF ) ; //release click
	fastForward.addEventListener( "dblclick", normalFF ) ; //double click
	
	function tripleFF()
	{
		myVideo.playbackRate = 3.0;
	}
	
	function doubleFF()
	{
		myVideo.playbackRate = 2.0;
	}
	
	function normalFF()
	{
		myVideo.playbackRate = 1.0 ;
	}
}

