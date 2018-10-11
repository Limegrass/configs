# To check for packages
# Get-AppxPackage | Select Name, PackageFullName
# 3D Builder:
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
# Alarms and Clock:
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
# Calculator:
# Get-AppxPackage *windowscalculator* | Remove-AppxPackage
# Calendar and Mail:
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
# Camera:
Get-AppxPackage *windowscamera* | Remove-AppxPackage
# Get Office:
Get-AppxPackage *officehub* | Remove-AppxPackage
# Get Skype:
Get-AppxPackage *skypeapp* | Remove-AppxPackage
# Get Started:
Get-AppxPackage *getstarted* | Remove-AppxPackage
# Groove Music:
Get-AppxPackage *zunemusic* | Remove-AppxPackage
# Maps:
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
# Microsoft Solitaire Collection:
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
# Money:
Get-AppxPackage *bingfinance* | Remove-AppxPackage
# Movies & TV:
Get-AppxPackage *zunevideo* | Remove-AppxPackage
# News:
Get-AppxPackage *bingnews* | Remove-AppxPackage
# OneNote:
Get-AppxPackage *onenote* | Remove-AppxPackage
# People:
Get-AppxPackage *people* | Remove-AppxPackage
# Phone Companion:
Get-AppxPackage *windowsphone* | Remove-AppxPackage
# Photos:
# Get-AppxPackage *photos* | Remove-AppxPackage
# Store:
# Get-AppxPackage *windowsstore* | Remove-AppxPackage
# Sports:
Get-AppxPackage *bingsports* | Remove-AppxPackage
# Voice Recorder:
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
# Weather:
Get-AppxPackage *bingweather* | Remove-AppxPackage
# Xbox:
Get-AppxPackage *xboxapp* | Remove-AppxPackage
# Sticky notes:
Get-AppxPackage *StickyNotes* | Remove-AppxPackage

# Unresearched removals
# Engagement?
Get-AppxPackage *Engagement* | Remove-AppxPackage
# Advertising
Get-AppxPackage *Advertising* | Remove-AppxPackage
# All Xbox
Get-AppxPackage *Xbox* | Remove-AppxPackage
# Wallet
Get-AppxPackage *Wallet* | Remove-AppxPackage
# Messaging
Get-AppxPackage *Messaging* | Remove-AppxPackage
# GetHelp
Get-AppxPackage *GetHelp* | Remove-AppxPackage
