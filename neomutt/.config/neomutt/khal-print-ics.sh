#!/bin/zsh

khal printics -f "
{blue}Title: {title}{repeat-symbol}{alarm-symbol}
Organiser: {organizer}{reset}
Attendees: {attendees}
Start date: {start-long}
End date: {end-long}
Status: {status}

Description: {description}
" $1
