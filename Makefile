project:
	tuist clean
	tuist fetch
	tuist generate --no-open && pod install && open Idea-Archive.xcworkspace
	
open:
	tuist generate --no-open && pod install && open Idea-Archive.xcworkspace
	
asset:
	tuist generate
	pod install
