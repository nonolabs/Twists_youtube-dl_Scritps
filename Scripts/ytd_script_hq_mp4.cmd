
::	  	Twist's Scripts for use with YouTube-dl. A free and open source download manager taht works on 
::			over 1000's websites. https://youtube-dl.org/	https://github.com/ytdl-org/youtube-dl
::
::		Purpose:
::			YouTube-dl Script to download High Quality MP4s from YouTube.com via manual selection
::			of the available files. Just copy this file to the same directory as the youtube-dl.exe file.
:: 
::		Upcoming:
::		  	There are more scripts coming for other vides and mp3s.
::		 	The descriptions of what the scripts will eventually move to a different file.
::			There is a noticeable download speed cap that needs to be looked into.
::			A script to run when you head off to work and come home and everything is done.


::		Sets the terminal screen so that its easier to see.

    @echo off
    cls
    color 07

::		Asks the user to paste the YouTube Link. It should look like this: https://www.youtube.com/watch?v=videoid
    
    set /p link="Paste the link to the YouTube video: "


::		Lists High Quality MP4 Files that are either (1920x1080 or 1280x720)
::		If either one resolution shows up or none it means that video format is unavailable for the selected video.

    cls
    @echo
    @echo   Available Files for the video you have selected.
    @echo 
    youtube-dl.exe -F %link% | findstr /i "1080 720" | findstr /i "mp4_dash"

::		Select the resolution and file size that fits you.

    set /p Qual="Enter the Quality Format Code on the very left: "


::		Switch							  Description
::		--no-overwries				If the file exists it wont overwrite it.
::		--force-ipv4				For compatilibity purposes
::		--add-metadata				Downloads and incorporates the videos medadata
::		--embed-thumbnail			Downloads and incorporates the videos thumbnail
::		 -f "[protocol^=http]"		Forces use of http over https to speed up the download
::		 -q							Don't show any output
::		--console-title				Shows a progress bar on the top title bar
::		 -o "%%(title)s.%%(ext)s"	Forces the filename of the file so that the videoid isn't included
::		 	
::		Command that downloads the file. 

	youtube-dl.exe --no-overwrites --force-ipv4 --add-metadata --embed-thumbnail -f "[protocol^=http]" -q --console-title -o "%%(title)s.%%(ext)s" %link%
