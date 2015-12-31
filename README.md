# ZhiDev-Tipulator
# Pre-work - Tipulator
==IGNORE THE EXTRA SWIFT FILES OUTSIDE. Im afraid i'll make everything explode again if i try to fix it so I'm leaving them there==

Tipulator is a tip calculator application for iOS.

Submitted by: Douglas

Time spent: ~9-10 hours spent in total

## User Stories

The following **required** functionality is complete:
* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [X] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- E-Mail functionality to remember where you've went and how much you paid or to track a friend down who still owes you money
- Users can set their own gratuity value 
- Changing color themes between a light and dark scheme
- User can only enter in numerical value or the backspace button into non-email portions of textViews (custom and billAmount)
- Delegate for the billField to keep the value looking like USD currency (ie no fringe cases of $231.4, $.9999, $01.32 etc. 
value entered keeps format of $x.xx or $x.xx)
- Groundwork for properly dividing up settings VC is layed out with dictionaries (lack of time to make sure its bug free)
- 


## Video Walkthrough 

Here's a walkthrough of implemented user stories:
<blockquote class="imgur-embed-pub" lang="en" data-id="gCXof50"><a href="//imgur.com/gCXof50">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
http://i.imgur.com/gCXof50.gif
<img src='i.imgur.com/gCXof50' title='Video Walkthrough' width='' alt='Video Walkthrough' />

http://imgur.com/gCXof50
Since the video walkthrough doesn't appear to be working

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- The biggest challenge is definitely making the github receive my most recent commits. I'm still not completely sure how I got it to work

- The second biggest hurdle was getting my money formatter to work for billAmounts since i required the UITextField function of shouldChangeCharactersInRange
to return true and my method returns false to fire off the edittingChanged event and I had to make adjustments. Overthought the solution
and started researching how to properly use observers in swift, but halfway through implementation I realized that there was a much 
simpler means of getting what I wanted done.

- Throughout the project I had to consistently fight back the urge to complete go back on the code and completely refactor everything.
There is multiple portions of the code I would've loved to refactor and make the code much neater and pristine but I learned about this
opportunity too late so I only went back and fixed the important bugs / minor details due to lack of time. Several notable spots of refactoring
is to not use a delegate and instead use NSUserDefaults, more proper and better usage of NSUserDefaults and reordering code & logic, 
far too many unnecasry calls that i could've delegated to a function or have better logic. Lots that could've been improved on, but and 
lots of functionality I would've loved to add but as a whole I feel satisfied I got so much done. Definitely could've been more efficient
but live and learn.

NOTABLE BUGS: 
- The E-Mail:
Doesnt work on simulator fully but works fine on iPhone, seems to be a common problem (source: Google)
-Custom Tip:
You can only enter a decimal(.) once, deemed a very minor bug that has a very easy work around (hit back, and hit custom tip again),
deemed it not worth the time to fix minor issue due to how stressed for time I am

Storyboards in mind:
- Using some persistance methods to keep a history of places the users been and keep a struct of the billamount, tips,total, rating, place etc.
probably piggybacking off my email VC
- More icons, pictures, characters, etc. make the app look prettier and less robotic (very high up there in gold plating, functionality to time
implemented was very low however)
- "Surprise me" , generate a random tip amount between 10-50% gratuity and hide the value on the segmented control. Probably piggy back
off of what I have implemented for custom tips. Hiding the value so you dont feel at a loss if you rolled bad (or good depending how you
look at it)

Final Words:
Overall I learned a lot about the swift language improving this app and I feel like I have a much more solid foundation and realize.
I regret not learning about this sooner as I'm sure I could've done a much better job without being under pressure to rush a decent project out
and probably save a lot more time laying things out properly instead of rushing in and fixing bugs due to sloppy framework

## License

    Copyright Douglas Li [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
