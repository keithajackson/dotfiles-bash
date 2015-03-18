#!/bin/bash

echo "Configuring global OS X preferences..."

echo "- Disable window animations"
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

echo "- Prevent apps from saving new documents to iCloud"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "- Disable screenshot shadows"
defaults write com.apple.screencapture disable-shadow -bool true

echo "- Only show scroll bars when scrolling"
defaults write NSGlobalDomain AppleShowScrollBars -string 'WhenScrolling'

echo "- Disable \"natural\" scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "- Expand save/print panels by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "- Automatically quit printer app when print jobs complete"
defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true

echo "- Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "- Disable smart quotes/dashes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "- Display key press-and-hold in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "- Require password 5 minutes after sleep"
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 300

echo "- Disable .DS_Store creation on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Configuring Finder preferences..."

echo "- Set home folder as default location for new windows"
defaults write com.apple.finder NewWindowTarget 'PfHm'

echo "- Enable display of hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "- Enable text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "- Disable Finder status bar"
defaults write com.apple.finder ShowStatusBar -bool false

echo "- Search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

echo "- Disable warning upon changing file extensions"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "- Enable spring-loaded directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

echo "- Enable/disable drive icons on desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "- Set column view as preferred Finder view"
defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'

echo "Configuring Dock preferences..."

echo "- Minimize windows using scale effect"
defaults write com.apple.dock mineffect -string "scale"

echo "- Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "- Don't automatically rearrange Spaces"
defaults write com.apple.dock mru-spaces -bool false

echo "- Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "- Set bottom right hot corner to show/hide desktop"
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Configuring miscellaneous preferences..."

echo "- Enable Safari Develop menu and Web Inspector"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "- Prevent Time Machine from asking to use new drives as backup volumes"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "- Disable automatic emoji substitution in Messages"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo "- Make Help Viewer windows non-floating"
defaults write com.apple.helpviewer DevMode -bool true

echo "- Restarting necessary processes..."
killall Dock Finder SystemUIServer