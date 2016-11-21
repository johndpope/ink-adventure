//You have fled the experience in search of the code. Welcome. 

// FF and Militant
//inshallah god willing
//al-hamdulillah -- thanks be to god 
CONST NONE = ""
CONST Bigby_Image = "Bigby"
CONST Snow_Image = "Snow"
VAR Char_Image = NONE
~ Char_Image = Bigby_Image
//main variables

VAR povcharacter = "Penelope"
CONST PENELOPE = 1
CONST ODYSSEUS = 2
CONST TELEMACHUS = 3
CONST FREEDOMFIGHTER= 4
CONST MILITANT=5
CONST DOCTOR=6
CONST DESPOT=7
CONST REPORTER=8
CONST MERKEL=9
VAR charnum=1 
VAR currentcharacter= "Penelope"
VAR chardescription = "place holder text"
VAR currentcharacterdescription = "a person"
VAR charreveal = "the full tale of your plight."
VAR chatnum = PENELOPE
VAR penelopeLike = 5
VAR odysseusLike = 5
VAR telemachusLike = 5
VAR freedomfighterLike=5
VAR militantLike = 5
VAR doctorLike = 5 
VAR despotLike = 5
VAR reporterLike = 5
VAR merkelLike = 5
VAR hitpoints = 3
VAR currentlikevalue = 5
VAR morale=45
VAR possible_morale=45
VAR overallfeeling = 5
VAR passengers= 9 
VAR food = 90
VAR distance=8
VAR rafthealth=8
VAR penreveal=0 
VAR reveal = 0
VAR thisname = 0
VAR penrevealname = false 
VAR odrevealname = false
VAR telrevealname = false
VAR merkrevealname = false
VAR ffrevealname = false
VAR militantrevealname = false
VAR doctorrevealname = false
VAR despotrevealname = false
VAR reporterrevealname = false


//Despot: stories end sooner
//Reporter: stories crafted for more sympathy

 
// Use this to create a while loop, running through all the characters
// 1-9 
// If character 
The raft is not big enough for all the passengers, nor, you fear, strong enough to make the journey. The waters are inviting and seductively deadly.  You are lowest of the low in the age of nation states but citizen number one of the globe: a refugee.

->aboat

//Three persistant choices
// Interview, PUSH, LEAD, SACRIFICE, Reveal, LOOK AT ME
// Sacrifice offers your food to someone else, weakens you...you only have so many hit points. 

=== function get_character_name(characternum) ===
{      characternum:
      - PENELOPE: Penelope 
      - ODYSSEUS: Odysseus
      - MERKEL: Merkel
      - TELEMACHUS: Telemachus
      - FREEDOMFIGHTER: a freedom fighter
      - MILITANT: a militant
      - DOCTOR: a doctor
      - DESPOT: a despot
      - REPORTER: a reporter
  ~ return currentcharacter 
 } 
 
 // In the first place, we don't like to be called "refugees" -- Hannah Arendt. 
 
 
 //I need a description of them that is not their name
 
 // Can Penelope/Odyesseys/Telemachus all be on the boat --> I guess, but they aren't the same figures in each other's stories.
 //Perhaps: Odie, Penny, Mak. 


//=== function list_all_characters ===
//~ temp x = 0
//- (looppoint)
//  ~ {get_character_name(x)}
 // ~ x++
//-(x <= 9: -> looppoint)
//return


=== function get_character_nickname(characternum) ===
~ thisname = characternum + reveal 
{      characternum:
      - PENELOPE: {penrevealname==true: Penelope| the crying woman}
      - ODYSSEUS: {odrevealname==true: Odysseus| the homesick soldier}
      - MERKEL: {merkrevealname==true: Angela| the lost leader}
      - TELEMACHUS: {telrevealname==true: Telemachus| the searching son}
      - FREEDOMFIGHTER: {ffrevealname==true: the freedom fighter| the soldier in rags}
      - MILITANT: {militantrevealname==true: the militant| the soldier in fine clothes}
      - DOCTOR: {doctorrevealname==true: Asclepius| the doctor}
      - DESPOT: {despotrevealname==true: the despot| the man in tattered royal robes}
      - REPORTER: {reporterrevealname==true: the reporter |the reporter}
  ~ return 
 } 
 


=== aboat ===

You are   <>
{shuffle: 
    - Penelope.        -> PenelopeID
    - Odysseus.        -> OdysseusID
    - Telemachus.      -> TelemachusID
    - a freedom fighter. ->freedomfighterID
    - a militant loyalist. -> militantID
    - a doctor without borders. ->doctorID
    - a despot. ->despotID
    - a reporter. ->reporterID
    - Merkel. ->MerkelID
    
    }




   

//-> loopdeloop -> 



->somewhatlaterfirst
    
== PenelopeID ==
~ povcharacter="Penelope"
~ charnum = PENELOPE
~ despotLike--
~ militantLike--
// Merkel doesn't like Greeks
~ merkelLike-- 

~ chardescription = "your hands are worn and tired, your fingers poked and prodded, from your own needles, which you've been clicking and keeping time with them"
~ charreveal = "You are a long-suffering wife, whose husband is lost amidst the war. To stave off the thirsty suitors who have plagued you, you alternatively weave and unravel a massive cloth. Your name is Penelope. "


->somewhatlaterfirst

== penelope_gone == 
~ chatnum= PENELOPE
-> penelope_dead ->
{OdysseusID: This woman with whom you grapple, she could have been your very bride.}
{TelemachusID: In a flash before you make your move -- but she is the very age and likeness of my own mother.}
//this should affect how others see you, the like index should go down -- in morale
{not odysseus_gone: ->odysseusdisLike->}
{not telemachus_gone:->telemachusdisLike->}
{not doctor_gone: ->doctordislike->}
{not merkel_gone: ->MerkeldisLike->}
~passengers--
-> fightlogic
-> DONE

=== penelope_dead ===
~penelopeLike=0
- ->->

=== penelopechat===
~ chatnum= PENELOPE
You decide to chat with {get_character_nickname(PENELOPE)}, {penelopeLike<5: who seems to be scowling.| who smiles as you turn toward her.} You ask her some questions. She <>
~ penelopeLike++
{not OdysseusID: ->Odysseus_more_like->}
// Adds to a score, winning them over
 {OdysseusID: -> Penelope_reveal }
->DONE

=== Penelope_reveal === 
~chatnum = PENELOPE
~penelopeLike++
* {OdysseusID} [Tell her who you are] You have found her. 
->OdtellsPen->
* {TelemachusID} [Tell her you are her son] You are heartened to find your mother at last. 
->TeltellsPen->
* {doctorID}[Show her who you really are] You remove the magical mask that Athena gave you.
->DoctellsPen->
+ {not OdysseusID}{not TelemachusID} {not doctorID} [Tell her your story] You tell her your story...{charreveal}
- She listens to the tale thoughtfully, but memories sweep her sadness back to her.
~ charreveal = "the story of how you ended up on this raft. "
->somewhatlater
->DONE


= OdtellsPen
Your one true love, and she listens to your tale of sadness with care, knitting your worries into comfort.
~odysseusLike++
//~ penreveal= 9 
~ chatnum= PENELOPE
~ penrevealname = true
 - ->->

= TeltellsPen
She is here, safe, at least, from her throngs of thirsty suitors.
~telemachusLike++
//~ penreveal = 9 
~ penrevealname = true
//~ chatnum= PENELOPE + penreveal 
 - ->->
 
 = DoctellsPen
 Asclepius, she cries, it is I, Penelope! Surely you have some news of my lost husband, Odysseus!->doctortrue->
 {Odysseus_reveal: Yes, you reply.  He is here on this very boat.  He is the homesick soldier! Her look is one of shock and joy, her eyes pour forth tears and she rends her garments.  Soon she is embracing the homesick soldier who had also been hidden from her by Circe's magic.}
 {not Odysseus_reveal: No, you reply, but I am certain the gods will bring you two together soon, I trust, in the land of the living. The woman collapses in tears and returns to the strings in her hands, which she winds and unwinds absently.}
 //~ penreveal = 9
 - ->->
 
 === penelopemoreLike===
 ~ penelopeLike--
 - ->->

=== penelopedisLike===
~ penelopeLike--
- ->->


=== TelemachusID ===
~ povcharacter="Telemachus"
~ charnum = TELEMACHUS
~ doctorLike--
~ merkelLike--
~ chardescription= "your hands are forever stretching for something just out reach.  But until they do, they are strong and eager to strangle, to punch, to grab the throat of those who are snacking on your birthright"

->somewhatlaterfirst

=== telemachus_dead ===
~telemachusLike=0
- ->->

=== telemachus_gone ===
{OdysseusID: Right before you act you think, that boy, he could have been my son.}
~ chatnum=TELEMACHUS
{not odysseus_dead: ->odysseusdisLike->}
{not penelope_dead: ->penelopedisLike->}
~passengers--
-> telemachus_dead->
-> fightlogic
-> DONE

=== telemachuschat === 

You decide to chat with {get_character_nickname(TELEMACHUS)}, {telemachusLike<5: whose look draws grim as he turns toward you| whose eyes gladly meet your gaze}. You ask him some questions.  He does not seem to want to talk.  He <>
~ chatnum= TELEMACHUS
~ telemachusLike++
~ penelopeLike++
~ odysseusLike++
~ despotLike--
->DONE

=== telemachus_reveal ===
~ chatnum= TELEMACHUS
~ telemachusLike++
You tell him your story....{charreveal}
{doctorID:  And what, he asks, is this god of which you speak? Health Insurance? Sounds like a very wicked deity! But you have no answer.}
He listens attentively and thanks you. 
{PenelopeID: Rending his garments and nashing his teeth, the young soldier reveals himself to be your son, Telemachus, who had gone to find your dear Odysseus only to have the gods return him to you on this godforsaken raft. {Odysseus_reveal: Wicked fate, to place me here with my father as well! Olympus is jolly when attending the mixups of mortals. }{telemachusLike++} ->telemachustrue->}
{OdysseusID: How the gods must laugh, said the boy, to send me so far away only to come face to face with you, my father, here on this last place on earth. {Penelope_reveal: I did not recognize mother either.  But now we are all reunited! | I would not be surprised if mother were here as well!}{telemachusLike++}->telemachustrue->}
~charreveal= "the sad tale of the road that lead you here."
->somewhatlater

=== telemachustrue===
~ telrevealname = true
- ->->

=== telemachusdisLike===
~ telemachusLike--
- ->->

=== telemachusmoreLike===
~ telemachusLike++
- ->->

== OdysseusID ==
~ povcharacter="Odysseus"
~ charnum = ODYSSEUS
// Merkel doesn't like Greeks
~ merkelLike-- 
~ chardescription = "your hands are shadows of what they were, so too you oh mighty hero of Ithaca, now forced to cram on this boat with these refugees, desparately trying to get home"

->somewhatlaterfirst

== Odysseus_more_like ==
~ odysseusLike++
- ->->

=== odysseus_dead ===
~ odysseusLike=0 
- ->->

== odysseus_gone ==
-> odysseus_dead ->
~ chatnum= ODYSSEUS
{not telemachus_dead: ->telemachusdisLike->}
{not penelope_dead: -> penelopedisLike->}
~ passengers--
-> fightlogic
-> DONE


== odysseuschat ==
~chatnum=ODYSSEUS
You decide to chat with {get_character_nickname(ODYSSEUS)}, {odysseusLike<5:fierce in his brooding hostility toward you| who seems to regard you with good cheer}.  You ask him some questions and he <>
~ odysseusLike++
// Adds to a score, winning them over
->DONE

== Odysseus_reveal ==
~chatnum = ODYSSEUS
You begin your tale...{charreveal}
He listens intently. 
{ PenelopeID: You are overwhelmed to discover that he is Odysseus, your lost husband, the reason you set your fingers shuttling around your loom, and from this moment on, he is already home.{odysseusLike++}->Odysseustrue->}
{ TelemachusID: The gods life the veil from your eyes, and now, the object of your quest has been found. With streams of tears, you stand amazed to behold your father, Odysseus. You are over joyed, yet suddenly despondent, for joy cannot stay afloat long on this tenuous craft. {odysseusLike++} ->Odysseustrue-> }
// Odysseus just doesn't get modern things.

{ freedomfighterID: So, let me get this straight, he says, you are fighting against a despot in your country but at the same time fighting against another tribe who is backed by another country all the while you are getting your armor from another country? Are you trying to befuddle me?}

{militantID: Your war confounds me, says the warrior from another time.  You say you fight for a king whose people have turned against him on behalf of a nothern kingdom whose king does not like to wear clothing on his breast?}

{MerkelID: So, he says, you are a queen who has opened the gates of her kingdom to travelers like me.  I lay my sword at your feeet.}

{ reporterID: Ah, he says, so you are our Homer, here to turn our words and deeds into an epic song! Say, what do you think of the epithet Master of Beasts for me?}

{doctorID: It takes a moment for {get_character_nickname(ODYSSEUS)} to recognize you, then all at once, he cries, "Asclepius! You were so swift to tend to those who fell at Troy.  And now you are here for us.  I am heartened." You ask him not to tell anyone your secret. {odysseusLike++}->doctortrue-> }



{despotID: So, reflects the soldier, you are a foul king, incapable of unifying your people.  I see why you flee, as the gods have turned their smiles from you. }


-> somewhatlater

== Odysseustrue===
~ odrevealname = true
- ->->

=== odysseusdisLike===
~ odysseusLike--
- ->->


 


== freedomfighterID ==
~ povcharacter="freedom fighter"
~ charnum = FREEDOMFIGHTER
~ militantLike--
~ despotLike--
~ merkelLike++
// Give freedom fighter a name
~ chardescription = "your hands are searching hands, always ready to do what they can, to scramble for food, but above all they want to be freed, freed from forced labor, freed from covering your head with every loud noise, freed from polishing the boots of the tyrant, freed from sowing the land with the bodies of those you loved"
~ charreveal = "how you grew up in a refugee campin Turkey, about the lessons you received from the MobiStation, but the deeper lesson you learned as you watched your friends die, one by one, realizing you were spared only by chance.  And you knew what you had to do, whom you had to fight."
->somewhatlaterfirst



== freedomfighter_gone ==
-> freedomfighter_dead ->
~ chatnum= FREEDOMFIGHTER
~ passengers--
{not odysseus_dead:->odysseusdisLike->}
{not despot_dead: ->despotmoreLike->}
-> fightlogic
-> DONE

== freedomfighter_dead ==
~ freedomfighterLike=0 
- ->->

== freedomfighterchat
~chatnum=FREEDOMFIGHTER
Yes, {get_character_nickname(FREEDOMFIGHTER)} like someone with a story.  You ask questions and the soldier, who, {freedomfighterLike<5: tensing at the touch of your hand,| glad to spin you a tale,} <>
~ freedomfighterLike++
~ despotLike--
~ militantLike--

->DONE

=== freedomfighter_reveal ===
~chatnum = FREEDOMFIGHTER
You tell {get_character_nickname(FREEDOMFIGHTER)} your tale...{charreveal}
And {get_character_nickname(FREEDOMFIGHTER)} listens to the tale thoughtfully, but is soon distracted by concern and memory.
~charreveal="the grim tale of the choices that led you here. "
~ freedomfighterLike++
{ despotID: The soldier's face drains of all color as if recalling horrors and atrocities. This soldier -- clearly from the rebels -- had suspected that it was you but was not sure till you opened your mouth. And now the stockpiled vile and hate is about to erupt.->freedomfighter_gone }
// although perhaps there could be a peaceful outcome with the militant
{militantID: You suspected ever since you stepped foot on this pathetic raft, but now, having told your story, you are certain who this soldier is: your mortal enemy. -> militant_gone}


// alternate: He says he too is on your side, but you are not sure. 
->somewhatlater
->DONE

=== fftrue ===
~ ffrevealname = true
- ->->

=== ffdislike===
~ freedomfighterLike--
- ->->

=== ffmoreLike ===
~ freedomfighterLike++
- ->->



=== militantID ===
~ povcharacter="militant"
~ charnum = MILITANT
~ freedomfighterLike--
~ merkelLike++
~ doctorLike--
~ chardescription = "your hands are made for combat, worn weapons, five-fingered fighting tools uncomfortable in this collaboration with this collection of strangers, all of whom were once your people but who in their fleeing have taken on the banner of the enemy"

->somewhatlaterfirst

=== militant_chat ===
~chatnum=MILITANT
Ah, right, {get_character_nickname(MILITANT)} seems like someone with a story.  You ask questions and the soldier, who{militantLike<5: treats the interruption at first with some hostility| appears glad to be addressed}, <>
~ militantLike++
~ despotLike++
~ freedomfighterLike--

->DONE

== militant_gone ==
-> militant_dead ->
~ chatnum= MILITANT
~ passengers--
{not telemachus_dead: ->telemachusdisLike->}
{not despot_dead: ->despotdisLike->}
-> fightlogic
-> DONE

=== militant_dead ===
~ militantLike=0
- ->->

=== militant_reveal ===
~ chatnum= MILITANT
You tell {get_character_nickname(MILITANT)} your story....{charreveal}
{ freedomfighterID: The soldier smiles and nods, saying, "We are on the same side." But you are doubtful. No rebel's clothes remain so crisp.  This finely dressed soldier is either a coward or a liar. A sickening sweat chills you.{militantLike--} ->militanttrue->}
The soldier listens attentively and thanks you. 
~charreveal= "the sad tale of the road that lead you here."
{not freedomfighterID: {militantLike++}}
->somewhatlater

=== militanttrue ===
~ militantrevealname = true
- ->->

=== militantdisLike ===
~ militantLike--
- ->->

=== militantmoreLike ===
~ militantLike++
- ->->

=== doctorID ===
~ povcharacter="doctor"
~ charnum = DOCTOR
~ merkelLike++
~ chardescription = "your hands are healing hands, neither you nor they know any borders, any boundaries, any separation between you and the other, between your body and theirs, your health and theirs, your happiness and theirs.  Inside and out, fore and aft, port and starboard are foreign concepts to you, and that has been the secret to your powers"
// knows no personal boundaries either
//no sense of nation or self -- lotus eater
-> somewhatlaterfirst

=== doctor_reveal ===
~chatnum = DOCTOR
You reveal who you are...{charreveal}
{PenelopeID: "Asclepius, is that you?" you say, "For you are sure this was a man who they said tended the wounded during the war with Troy," but he does not seem to understand, and merely shakes his head sadly.->doctortrue->}
{OdysseusID: You show him your true face and his eyes fill with tears.  It is I, Odysseus, Asclepius. I was there with you on the battle fields of Troy. And you embrace this man, this healer of your fallen comrades. The gods are with you. ->doctortrue-> }
{not OdysseusID: {not PenelopeID: The doctor gets this story out of you merely by looking at you and placing a hand near enough to the hurt.}}
 ~ charreveal = "that sorry recollection of your dates with the Fates."
 ~ doctorLike++
-> somewhatlater

=== doctortrue ===
~ doctorrevealname = true
- ->->

=== doctor_chat ===
~chatnum=DOCTOR
The doctor, yes, seems like someone with a story.  You strike up a conversation with the doctor, {doctorLike<5:whose eyes will not meet yours, |turning a warm gaze on you, }<>
~ doctorLike++

->DONE

=== doctor_gone ===
~ chatnum= DOCTOR
-> doctor_dead ->
~ passengers--
-> fightlogic
{not penelope_dead: ->penelopedisLike->}
{not merkel_dead: -> MerkeldisLike->}
{not reporter_dead: -> reporter_dislike->}
//this should affect how others see you, the like index should go down -- in morale
-> DONE

=== doctor_dead===
~ doctorLike=0 
- ->->

=== doctordislike ===
~doctorLike--
- ->->

=== doctormorelike===
~doctorLike++
- ->->

->somewhatlaterfirst

=== despotID ===
~ povcharacter="despot"
//give despot a name
~ charnum = DESPOT
~ freedomfighterLike--
~ doctorLike--
~ penelopeLike--
~ chardescription ="your hands are soft as babies from a lifetime of pampering, yet they are not above signaling for the wringing of a few infant necks"

-> somewhatlater

=== despot_gone ===
~ chatnum= DESPOT
-> despot_dead ->
{not militant_dead: -> militantdisLike->}
~ passengers--
-> fightlogic

//this should affect how others see you, the like index should go down -- in morale
-> DONE

=== despot_gonereveal ===
~ chatnum= DESPOT
-> despot_dead ->
{not militant_dead: -> militantdisLike ->}
{not merkel_dead: ->MerkelmoreLike->}
~ passengers--
{charnum<chatnum: -> fight_goododds}
{charnum>chatnum: -> fight_badodds}

//this should affect how others see you, the like index should go down -- in morale

-> DONE
 

=== despot_dead ===
~ despotLike=0 
- ->->

=== despot_reveal ===
~ chatnum= DESPOT
-> despot_revealed->
You tell him your story....{charreveal}
{freedomfighterID: Something about your story displeases {get_character_nickname(DESPOT)}.  He is angry and begins to push and shove you. -> despot_gone}
{militantID: The man in tattered royal robes reveals himself to be the despot that you served.  He thanks you for your service with handshake that is cold as the water the encircles the raft. ->despot_revealed -> }
//{charnum<chatnum: But you get the upper hand. -> fight_goododds | You have pushed the man in tattered robes off the boat. ->fight_badodds}}
{not freedomfighterID: He listens with a grim smile on his face.}
->somewhatlater

=== despot_revealed ===
~despotrevealname=true
~despotLike++
- ->->


== despot_fightwin ==
// if you defeat the despot
You have pushed {get_character_nickname(DESPOT)} off the boat. 
-> despot_dead->
-> stayon

== despot_fightlose==
// if you lose to the despot
-> falloff

=== despottrue===
~ despotrevealname = true
- ->->

=== despotdisLike===
~ despotLike--
- ->->

=== despotmoreLike===
~ despotLike++
- ->->


=== reporterID ===
~ povcharacter="reporter"
~ charnum = REPORTER
~ merkelLike--
~ chardescription = "blind scribe, your hands are tired from tirelessly tapping away at a keyboard, shooting newsbulletins form the front, firing off updates, slashing portraits of heartbreak and lost lives down to the 500-word maximum"

->somewhatlaterfirst

=== reporter_chat===
~chatnum=REPORTER
Indeed, {get_character_nickname(REPORTER)} seems like someone with a story.  You ask questions and {get_character_nickname(REPORTER)}, {reporterLike<5: bristling at your disruption, |glad to be addressed by you, }<>
~ reporterLike++

->DONE

=== reporter_gone ===
-> reporter_dead ->
~ chatnum= REPORTER
~ passengers--
{not doctor_dead: ->doctordislike->}
{not merkel_dead: ->MerkeldisLike->}
-> fightlogic
-> DONE

=== reporter_dead ===
~ reporterLike=0
- ->->

=== reporter_reveal ===
~ chatnum= REPORTER
You tell your story....{charreveal}
The reporter taps out copious notes.
~charreveal= "the saga of your steps here."
->somewhatlater

=== reportertrue ===
~ reporterrevealname = true
- ->->

=== reporter_dislike ===
~ reporterLike--
- ->->

=== reportermoreLike ===
~ reporterLike++
- ->->

=== MerkelID ===
~ povcharacter="Merkel"
~ despotLike--
~ charnum = MERKEL
~ chardescription = "your hands are worrying hands, wrestling with each other tirelessly, picking at the opposing callusses"

->somewhatlaterfirst

=== Merkel_chat ===
~ chatnum= MERKEL
You are right, {get_character_nickname(MERKEL)} seems like someone with a story.  You greet her and she <>
~ merkelLike++
~ despotLike--

->DONE

=== merkel_gone ===
-> merkel_gone ->
~ chatnum= MERKEL
~ passengers--
{not penelope_dead:->penelopedisLike->}
{not doctor_dead: ->doctordislike->}
{not despot_dead: ->despotmoreLike->}
-> fightlogic
-> DONE

=== merkel_dead===
~ merkelLike=0
- ->->

=== Merkel_reveal ===
~ chatnum= TELEMACHUS
You tell her your story....{charreveal}
She listens attentively and thanks you. 
~charreveal= "the testimony of your path to the raft."
->somewhatlater
    
=== Merkeltrue ===
~ merkrevealname = true
- ->->

=== MerkeldisLike===
~ merkelLike--
- ->->

=== MerkelmoreLike===
~ merkelLike++
- ->->
    
== death ==

// Need to check if the person is still living, then needs to check if the person is the main character 
It was <>
// 

{shuffle: 
      -  {get_character_nickname(PENELOPE )}. {penelope_dead: -no - -> death} {charnum == PENELOPE: It was you. -> falloff | -> penelope_dead ->}
      - {get_character_nickname(ODYSSEUS)}. {odysseus_dead: -no - -> death}{charnum == ODYSSEUS: It was you. -> falloff | -> odysseus_dead ->}
      - {get_character_nickname(MERKEL)}. {merkel_dead: -no - -> death} {charnum == MERKEL: It was you. -> falloff |-> merkel_dead ->}
      - {get_character_nickname(TELEMACHUS)}.{telemachus_dead: -no - -> death}{charnum == TELEMACHUS: It was you. -> falloff |-> telemachus_dead ->}
      - {get_character_nickname( FREEDOMFIGHTER )}. {freedomfighter_dead: -no - -> death}{charnum == FREEDOMFIGHTER: you. -> falloff |-> freedomfighter_dead ->}
      - {get_character_nickname(MILITANT)}. {militant_dead: -no - -> death}{charnum == MILITANT: It was you. -> falloff |-> militant_dead ->}
      - {get_character_nickname(DOCTOR )}. {doctor_dead:-no - -> death} {charnum == DOCTOR: It was you. -> falloff |-> doctor_dead ->}
      - {get_character_nickname(DESPOT)}. {despot_dead: -no - -> death}{charnum == DESPOT: It was you. -> falloff |-> despot_dead ->}
      - {get_character_nickname(REPORTER)}. {reporter_dead: -no - -> death} {charnum == REPORTER: It was you. -> falloff |-> reporter_dead ->}
    }
<> {~ As tactfully as you can, you send the body to its rest. | In haste, the body is dumped into the water. | Before you can secure the body, the hand of the ocean draws the body to her breast. | Panicking, someone shoves the body into the turbulent water.}
~ passengers--
-> somewhatlater 
    
=== somewhatlaterfirst === 

You see a boat full of people, including<>
 ~ temp x = 0
- (looppoint) 
{  x == charnum:
    you, <>
   ~ x++
-else:
//if they are gone it should not list them
 ~get_character_nickname(x)
 <>, <>
 ~ x++ 
 } 
-{x <= 9: -> looppoint}
and the aged raft will not last long. <>
->somewhatlater

//  Here is th main scen that we keep returning too.



=== somewhatlater===
//Need to add several hundred of the subsequent lines...
~ distance--
~ rafthealth--
{rafthealth == 0: -> raftsinks}
~ food = food - passengers 
{ food < 1 : -> nomorefood}

// Add being blown off course.  

{ ~ The ocean is turbulent. | Rosy-fingered dawn is fingering the dawn rosily. |  Night is falling on the wine-dark sea. | The raft overnight has aged and frayed. -> lessrafthealth | A favorable wind picks up from the east. ->lessdistance | Silence is beginning to settle into your throat. | Home seems so far away. | The first drops of rain begin to fall. | A bag of food has gone rancid. ->lessfood | A storm of unyielding ferocity is engulfing the raft.->moredistance | Earth-shaker Poseidon is feeling irritable, so he has sent the raft whirling for several sickening hours.->moredistance | The raft is sinking.->lessrafthealth | Overnight the gods have somehow strengthened your raft->morerafthealth | Someone has died. -> death | Storm clouds overhead, you spend the day cast over by a grey pall. | -> hades | The boat has passed through a school of fish that you all manage to snatch right from the water for a rare fresh meal! ->morefood  |{not despotID: {not despot_dead:  Without warning,  {get_character_nickname(DESPOT)} becomes enraged or terrified -- you do not have time to distinguish -- and begins to grapple with you. -> fightlogicdespot | You wonder if the drowned man in robes really was the depot. Would that leave this journey pointless? }| You slip a few extra rations on your plate.-> lessfood} | You notice a bag almost bursting full of breeze. -> AeolianWinds}


// Add this to sinking ->sink 
//{ Someone has died. -> death ->| Someone has not died}

// Someone has died -> death

->somewhatlaternext

=== somewhatlaternext ===
~ morale= (penelopeLike+odysseusLike+telemachusLike+merkelLike+freedomfighterLike+militantLike+doctorLike+despotLike+reporterLike)/passengers+overallfeeling
~ possible_morale = 10

{ morale <= possible_morale: The passengers are not on your side.  | The passengers are on your side. } 
<> ({morale}/{possible_morale})  
<> 
There are {food} tins of food. { food <=50: It cannot sustain the passengers much longer.} { passengers >= 8 : With this many mouths, it will not last. } {distance >=4: You have leagues and leagues to sail. | {You are maybe 3 days out at most! | The coast can only be a few days further. | Your desination is almost within view. | You can smell the shore it is so close.} }
{ hitpoints==1: <>You are so weak that any fighting or sacrificing will likely do you in.}

So, {povcharacter}, what will you do?
    * {distance<=1}{morale>=10} Lead
    -> lead
    * Look at me
    -> lookatme
    + Talk with someone
    -> interview
    + Push and shove
    -> pushandshove
    + Reveal
    -> revelation
    + Sacrifice
    -> sacrifice
    + See who's here
    -> examine_boat
    //Add the ability To Lead, which checks the sum of all your likability points
    // if the sum is greater than 10, you can lead the boat
    
    - And here it goes back to together
    -> END
    
== lessfood ==
~food=food-5
-> somewhatlaternext

== morefood==
~ food=food+5
-> somewhatlaternext

== moredistance==
~distance++
-> somewhatlaternext

== lessdistance ==
~distance--
-> somewhatlaternext

== lessrafthealth==
~rafthealth--
-> somewhatlaternext

== morerafthealth==
~rafthealth++
-> somewhatlaternext


    
=== sacrifice ===
{not OdysseusID: {not PenelopeID: {not TelemachusID: {~ Though it weakens you, you graciously let the others take your daily rations. | Pretending not to notice it, you let the rations plate pass you by. | Feigning illness, you let others eat your rations. | Without calling attention to it, you slip your rations onto someone else's pile. | Today is a good day, you say, and share your portion with the others. }| ->sacrifice_greek}|->sacrifice_greek}| ->sacrifice_greek}
<> {not OdysseusID: {not PenelopeID: {not TelemachusID:{ You feel your strength slipping. | You are weaker for the loss. You may not survive another sacrifice.}}}}

~ hitpoints--
{ hitpoints<1: -> perish}
~ food = food++
~ overallfeeling++
+ {not OdysseusID}{not PenelopeID}{not TelemachusID} [Rest]-> somewhatlater
-> DONE


=== sacrifice_greek ===
{~ Rather than eat, you send today's portion to slacken the resentment of the gods.| While the others cast strange and suspicious looks at you, you set flame to your rations to appease the eternal gods. | Your hunger is great, but the gods are greater.  The gods of the sky will need to be satisfied before the god of your belly.}
<>{~The loss of a meal has weakened you. | You feel a wave of fatigue cresting over you. |  Your limbs feel heavy, and your head is throbbing. | With exhaustion sweeping over you, you wonder if the gods pay any mind to a rufugee.}
~ hitpoints--
{ hitpoints<1: -> perish}
~ food = food--
~ overallfeeling--
-> somewhatlater
->DONE
    
=== interview===
// might not need the gone exception if it leads to dead
* {not odysseus_gone}{not OdysseusID} {not odysseus_dead}[{get_character_nickname(ODYSSEUS)}]
<-odysseuschat
* {not penelope_dead}{not PenelopeID} {not penelope_dead}  [ {get_character_nickname(PENELOPE)}]  
<-penelopechat
* {not telemachus_gone}{not TelemachusID} {not telemachus_dead}[{get_character_nickname(TELEMACHUS)}]
<-telemachuschat
* {not merkel_dead}{not MerkelID}[{get_character_nickname(MERKEL)}]
<- Merkel_chat
* {not militant_dead}{not militantID}[{get_character_nickname(MILITANT)}]
<- militant_chat
* {not freedomfighterID}{not freedomfighter_dead} [{get_character_nickname(FREEDOMFIGHTER)}]
<- freedomfighterchat
* {not reporter_dead}{not reporterID} [{get_character_nickname(REPORTER)}]
<- reporter_chat
* {not doctorID}{not doctor_dead}[{get_character_nickname(DOCTOR)}]
<- doctor_chat
* {not despotID} {not despot_dead}[{get_character_nickname(DESPOT)}] As it turns out, {get_character_nickname(DESPOT)} will not speak with you. -> somewhatlater
+ [] There's no one left to talk with.->somewhatlater


- tells you <>
{ shuffle:
 - {not LotusEaters: this story,->LotusEaters}
 - {not Circe: that story,->Circe}
 - {not Cyclops: the other story,->Cyclops}
 - {not ScyllandCharib: the harrowing story,-> ScyllandCharib}
 - {not Sirens: the frustrating story,-> Sirens}
 - {not Calypso: the dreamlike story,->Calypso}
 - {not Laestrygonians: the nauseating story, ->Laestrygonians }
  - {not HeliosCattle: the mouth-watering story, ->HeliosCattle }
 }


// - PENELOPE: Penelope
 //     - ODYSSEUS: Odysseus
 //     - TELEMACHUS: Telemachus
  //    - FREEDOMFIGHTER: a freedom fighter
//      - MILITANT: a militant
  //    - DOCTOR: a doctor
    //  - DESPOT: a despot
      //- REPORTER: a reporter
     // - MERKEL: Merkel
     //-> DONE
     
    -> DONE
    
    
=== lead ===

{MerkelID: Wir schaffen das! you cry.}

* Row to Greece
->ending_greece
* Row to Turkey
->ending_turkey
* Row back to Syria
->ending_syria
* Pray to the gods 
-> ending_pray
* Fight the Gods
-> ending_fightgods
-
-> DONE
    
=== pushandshove ===
You've had enough. There's not enough room.  You're going crazy. It's time to push someone off the boat.

Who?

// perhaps there's a die roll to see if this actually works

* {not odysseus_gone}{not OdysseusID}  [the homesick soldier] Sure. Why not push the homesick soldier?
->odysseus_gone
* {not penelope_dead}{not PenelopeID}  [the crying woman]  Of course, you shove the crying woman.
->penelope_gone
* {not telemachus_dead}{not TelemachusID} [the searching son] There's something dangerous about that fatherless boy. 
->telemachus_gone
* {not freedomfighter_dead}{not freedomfighterID} [the soldier in rags] The soldier seems ever ready to fight.
-> freedomfighter_gone
* {not militant_dead}{not militantID} [the soldier in fine clothes] The soldier has been been bristling for a fight.
-> militant_gone
* {not merkel_dead}{not MerkelID} [the lost leader] Does this boat really need another leader?
-> merkel_gone
* {not reporter_dead}{not reporterID} [the reporter] You don't really want someone recording these terrible times.
-> reporter_gone
* {not doctor_dead}{not doctorID} [the doctor] This doctor only reminds you of those who have perished.
-> doctor_gone
* {not despot_gone}{not despot_gonereveal}{not despotID} [The man in tattered robes] Yes, this man does not seem so innocent. 
-> despot_gone
+ Try something else
-> somewhatlater




== fightlogic == 
// work hitpoints into fight logic
{charnum+hitpoints<=chatnum+2: -> fight_goododds}
{charnum+hitpoints>=chatnum+2: -> fight_badodds}
-> DONE

== fightlogicdespot == 
// work hitpoints into fight logic
//Workaround for a shortcoming in INK
~ chatnum = DESPOT
{charnum+hitpoints<=chatnum+2: -> fight_goododds}
{charnum+hitpoints>=chatnum+2: -> fight_badodds}
-> DONE

 == fight_badodds ==
  
  {~ Pushing is not as easy as it looks. Your opponent catches you off balance -- and haven't you been feeling that since you stepped on this raft? -> falloff| You feel weaker than you expected. You engage in a mighty battle but are easily bested. -> falloff | You have succeeded in throwing them overboard. -> stayon}
  
  -> DONE
  
  
  == fight_goododds ==
  {PenelopeID: No one could have suspected the chinups and burpees you were racking up while they thought you were sitting meekly at your loom.}
  { ~ The gods must be with you because you easily overpower your opponent. -> stayon | No one could have expected the force you have displayed -- though now they look on in horror.  You have won this battle. -> stayon | You easily win this tussle. -> stayon | Despite all of your force, you have been overpowered. -> falloff }
  
  
  
  -> DONE


=== stayon ===
As you watch, {get_character_nickname(chatnum)}{ ~ is soon eaten by sharks| is later rescued by an NGO| is carried away by a tide of tears}.

The boat is now lighter by one, which means {~ there are fewer people who can help save the boat. | you will have to try harder to convince others to follow you. | you are facing a bit of an image problem. | the food may stretch a bit further.}
-- 
~ hitpoints--
~ passengers--
~ overallfeeling--
{not doctorID: -> doctordislike ->}
{not doctorID: {not doctor_dead: The doctor turns away in disgust.}}
{not reporterID: {not reporter_dead: <> Tapping out tiny bumps furiously, the reporter will immortalize this battle.}}

+ Calm down
-> somewhatlater

//=== function chat_anyone (who) ===
//{ "ask <>
 //  {charnum(who)}"

//return 
//}

=== revelation ===

Who would you like to reveal yourself to? 
* {not odysseus_gone}{not OdysseusID}{not Odysseus_reveal} [{get_character_nickname(ODYSSEUS)}] Okay, the homesick soldier. 
->Odysseus_reveal
* {not penelope_dead}{not PenelopeID} {not Penelope_reveal}[{get_character_nickname(PENELOPE)}] Okay, the crying woman.
->Penelope_reveal
* {not telemachus_dead}{not TelemachusID}{not telemachus_reveal}[{get_character_nickname(TELEMACHUS)}] Sure, the searching son.
-> telemachus_reveal
* {not merkel_dead}{not MerkelID}{not Merkel_reveal}[{get_character_nickname(MERKEL)}] Yes, the lost leader. 
-> Merkel_reveal
* {not freedomfighter_dead}{not freedomfighterID}{not freedomfighter_reveal} [{get_character_nickname(FREEDOMFIGHTER)}] Good, the soldier in rags.
-> freedomfighter_reveal
* {not militant_dead}{not militantID}{not militant_reveal}[{get_character_nickname(MILITANT)}] Okay, the soldier in fine clothes.
-> militant_reveal
* {not doctor_dead}{not doctorID}{not doctor_reveal}[{get_character_nickname(DOCTOR)}]  All right, the doctor.
->doctor_reveal
* {not despot_dead}{not despotID}{not despot_reveal} [{get_character_nickname(DESPOT)}] Yes, the man in tattered robes. 
-> despot_reveal
* {not reporter_dead}{not reporterID}{not reporter_reveal}[{get_character_nickname(REPORTER)}] Yes, the reporter. 
+ No one, really

- Okay. 
->somewhatlater
-> DONE


===examine_boat ===
You look around the boat. Still on the boat, you see
{not odysseus_dead:{not OdysseusID:...{get_character_nickname(ODYSSEUS)}}}{not penelope_dead:{not PenelopeID:...{get_character_nickname(PENELOPE)}}}{not merkel_dead:{not MerkelID:...{get_character_nickname(MERKEL)}}}{ not telemachus_dead:{not TelemachusID:...{get_character_nickname(TELEMACHUS)}}}{not freedomfighter_dead:{not freedomfighterID:...{get_character_nickname(FREEDOMFIGHTER)}}}{not militant_dead:{not militantID:...{get_character_nickname(MILITANT)}}}{not doctor_dead:{not doctorID:...{get_character_nickname(DOCTOR)}}}{not despot_dead:{not despotID: ...{get_character_nickname(DESPOT)}}}{not reporter_dead:{not reporterID:...{get_character_nickname(REPORTER)}}}
// List rest of characters once the _gones are made for each
-> somewhatlater

    
=== lookatme ===
You look down at yourself and see {chardescription}.
* What's next?
->somewhatlater

    === supadupa ===
    You made it to Supadupa
    
  ->END  
    === theWeave ===
    <-lumberjack
    <-makingeggs
  ->DONE
  
  // The Stories -- here begin the stories characters will tell you.
  
  === LotusEaters ===
the story of the Lotus Eaters.  Before coming on the boat, {get_character_nickname(chatnum)} was hanging out in an Internet cafe in Demascus. 

 {chatnum==PENELOPE: A suitor apporached me with a sly look and a cup in his hand.  I turned my face away but soon his lips were at my ear, whispering Pumpkin Spice.  I dismissed him, but several of my handmaids took him up on his offer.}
 
  {chatnum==ODYSSEUS: A man approached me with a sly look and his hand tucked into his pocket. I gave him a curt nod and he whispered Lotus in my ear.  I dismissed him, but some in my group took him up on his offer. }
  
   {chatnum==TELEMACHUS: A man approached me with a sly look and his hand tucked into his pocket. I gave him a curt nod and he whispered Captagon in my ear, withdrawing a bag of pills.  I dismissed him, but some in my group took him up on his offer. }
   

  {chatnum==MILITANT: A man approached me with a sly look and his hand tucked into his pocket. I gave him a curt nod and he whispered Captagon in my ear, withdrawing a bag of pills.  I dismissed him, but some in my group took him up on his offer. }
  
  {chatnum==FREEDOMFIGHTER: A man approached me with a sly look and his hand tucked into his pocket. I gave him a curt nod and he whispered Captagon in my ear, withdrawing a bag of pills.  I dismissed him, but some in my group took him up on his offer. }
  
  {chatnum == MERKEL: A woman approached me, taking out a bottle from a shopping bag.  I could not read the label, but she whispered Shiraz in my ear, opening the bottle and pouring it.  I turned it down since it was not properly airated, but some in my number were not so judicious.}
  
  {chatnum == REPORTER: A gentlemen from the state-run news agency (Tyrant News Network) approached me and took out a lengthy document.  I gave a look, and he whispered "Nightly News Program" in my ear.  'No more reporting from the frontlines,' no more danger of getting my head blown off. I resisted his offer, but several of my colleagues traded their reporters credentials for comfy desk chairs and a steady stream of celebrity guests.} 
  
  { chatnum == DOCTOR: A woman dressed in a surgical gown, spattered in blood approached me and said wouldn't I rather be anywhere but here, stitching up the wounded so they'd be full when the undertaker came to collect them.  They don't call them undertakers, I was about to correct her, when she whispered in my ears, Private Practice in a Wealthy Suburb.  I was able to decline her offer, but several in our unit clearly saw the temptation.}
  
  At first it seemed as magic.  They did not need to eat or sleep.  
  
{chatnum == ODYSSEUS: They became sluggish and distracted.  They linked arms and left me. }
    
{chatnum == PENELOPE: They became instantly relaxed upon sipping the drink.  They took each others' arms and left me. }

  {chatnum == TELEMACHUS: They became zealous to join the fight.  They took up arms and left me. }
        
  {chatnum == MERKEL: They became eager to find some matching cheese.  They took up glasses and plates and legft me. }
  
  {chatnum == MILITANT: They became zealous to join the fight.  They took up arms and left me. }
  
  {chatnum == FREEDOMFIGHTER: They became zealous to join the fight.  They took up arms and left me. }
  
  {chatnum == REPORTER: They got their shows and were there till the tyrant pulled the plug.}
  
  {chatnum == DOCTOR: They opened shop in comfy quarters and settled down. }
  
  
  I assume they are all dead.  I was able to grab a few others and drag them off, though they shook and cried.  <>
  
   Eventually, I had to leave them behind as well. 
   
   
      * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  -> END
  
  === Sirens ===
  // Different for each listener
  the story of the Sirens. You notice {get_character_nickname(chatnum)} start to sweat a bit at the start of this tale. 
  
  A refugee will eat even dog meat as steak, but before I became one, I had the strength to say no.  
  
  //PENELOPE
  
  {PenelopeID: You see, I was surrounded by suitors of my own, when we were back in the land of eternal conflict, all vying for my affections, to replace my one true love.  Most were as undesirable as their throbbing want, but one, one caught my eye.}
  
  {PenelopeID: Strong and fair, with skin like alibaster, he was sure and true.  Unlike the sheepish men of our age, he was not afraid to make the first move. He offered me shelter and protection in the house he called Rossiya.}
  
  {PenelopeID: Rossiya, to be sheltered by a strong leader.  The surrogate, the substitute, is a siren song that soothes one who is clinging to the mast of a vow to dream that seems as indefinite as the wind.  Wouldn't that tempt you also? }
  
  //
  
  // Odysseus 
  
  {OdysseusID: On my way back home, I came across those beguiling Sirens, surely you know them, perhaps you've even hear them, enough to tempt anyone to follow them and forget all sense of home. }
  
  {OdysseusID: Bound by me friends, I was protected from that irresistable urge, and yet their song still tugs at my ear.}

  {OdysseusID: Desire, to be blanketed in want and fantasy.  The song of the sirens is enough to make one forgt home, and perhaps in listening to it, we have in some small part already succomed.}
 
  
  // TELEMACHUS 
  {TelemachusID: The thought suddenly struck me that all this fighting and struggling could end if I just stopped.  Okay, by striking me, I mean there was this friend of mine, who had me by the ear, pouring honeyed wine over my lips and down my throat. I was being used as a tool. Why not stop the hoeing, so to speak.}
  
  {TelemachusID:  But as my friend was stroking my hair with long, delicate fingers, I remembered what I was fighting for, and saw the greedy grubby hands of the ones who would take my place, their sweaty self-satisfied hands, and I arose and flung off the garments of silk and satin, cast of the petals in my hair, and blew the smell of incense forom my nose.}
  
  {TelemachusID: Apathy, to be able to just concede and release the tension tired muscles. Intransience, the siren song of the one who has been struggling with no end in sight. But resting fills muscles that need to be in tension with acids and the pain of idolness. Wouldn't that tempt you also? }
  
  
  // MERKEL
  {MerkelID: I received the opportunity to sit at a table and negotiate a truce -- ah, yes, little me -- to broker a deal with between Zeus and Poseidon. To establish a treaty in my name that would go down in history.}
  
  {MerkelID: But when I read the conditions of the peace, I could see that it gave too much away, all lands, all language, all moneys, and even people would be traded for a shakey piece that placed all power back in the hands of the capricious gods.}
  
  {MerkelID: The peace broker, to be the one who can end a brutal conflict and to be celebrated by bards in books in ballads, a siren song that tempts the wouldbe leader with aspirations of nobility. Wouldn't that tempt you also?}
  
  // FF
  
  {freedomfighterID: I received an offer to go to Switzerland, don't ask me how -- yes, chocolate, wine, cheese, Luzerne, I believe it was, or was it Zurich.  They'd send me an endless stream of texts -- photos of placid lakes, serene mountains, and everywhere the smiles of carefree people.}
  
  {freedomfighterID: But when I reached the airport, I found myself tied up in customs, unable to set foot on a plane.  The agents' ears were stopped up as if by beeswax.   And I was left to scroll through photos and texts until my fingers bled and my phone ran out of battery. } 
  
  {freedomfighterID: Switzerland, to be posting to Facebook at a cafe.  Neutrality is a siren song that singes my mind with the fierce heat of its impossibility for my current life. Wouldn't that tempt you also? }
  
  // MILITANT
  
 {militantID: I was approached by a friend who had just come back from {chatnum==TELEMACHUS:a place called }{chatnum==PENELOPE:a place called }{chatnum==ODYSSEUS:a place called }Dubai.  Oh, you would have thought it was paradise.  The endless shopping malls, the air conditioning, the towering skyscrapers that tickle the feet of {chatnum==TELEMACHUS:Zeus himself}{chatnum==PENELOPE:Zeus himself}{chatnum==ODYSSEUS:Zeus himself}{chatnum==MILITANT:Allah}{chatnum==FREEDOMFIGHTER:Allah}{chatnum==REPORTER:of Allah}{chatnum==DOCTOR:of the angels}{chatnum==MERKEL:of God}. Oh, and she had a place for me to stay.}
 
 {militantID: But when I was heading to the airport, I had to pass a square and my feet and roller bag got caught in this muck -- it was too my horror that I looked down and saw not trash, but fallen soldiers.  We were within feet of the holiest mosque.}
 
 {militantID: Escape, to trade the violence of struggle for the security of credit cards and shopping bags. Prosperity is the siren song that weakens my faith in my fatherland. Wouldn't that tempt you also?}
  
  // DOCTOR
  
  {doctorID: I received a call from a friend in the United States, who had crafted a deal on the 8th hole and practically sealed it before a bogey on the 18th.  Apparenty, one of the players had a comfy space to set up shop in Beverly Hills. Endless days of comfort and mountains of gold lay in those hills.}
  
  {doctorID: To trade all of this for steady, regular work, for a home and a family, to trade these tired tools for golf clubs and tennis raquets. But when I went to call him back, my phone couldn't get a signal, couldn't find a satellite, imagine.}
  
  {doctorID: The comfortable life, the steady job, in the lap of commerce.  Stability is a siren song that massages my temples when the blood is spilling to fast. Wouldn't that tempt you also?} 
  
  // REPORTER
  
  {reporterID: I was approached by a man who said he knew of a story that could end the war, yes, an inside scoop, juiciest of rumours, too good to be true.  When I asked his name, he just said Hermes.}
  
  {reporterID: The tale he wove, dripping with scandal and deception like plump ewe on the spit, made my heart race and my knees tremble.  But at the same time, it was all too perfect, too tidy, and I knew despite the way it tickled my ear like a secret lover, it could not possibly be true. }
  
  {reporterID: The succulent scoop, to hold in your hands the story that could change the world.  The perfect story is a siren song that temps every teller of tales who wants to rock the world from its slumber. Wouldn't that tempt you also? }
  
  // despotID
  
  {despotID: It seems {get_character_nickname(chatnum)} would prefer not to tell a story for you, for fear of who you are and how you might respond.}
  
      * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  -> END
  
  
  === ScyllandCharib===
  the story of Scylla and Charibdis. In a previous attempt to flee, {get_character_nickname(chatnum)} managed to secure a spot on an ill-fated vessel...
 
 We sailed three days till we reached a window where we'd have to make a choice, but oh, what a choice it was.
  
  To the west, lay Italy, land of art and song and wine, her legacy of cultures mashed under foot by all, from Atruscans to the Roma gypsies.  But in the heel of that great boat, one will find every kind of theif, a many-headed predatory beast, ready to slit your throat, to sell you out, to snatch you up in its jaws and spit out your bones onto ornamented ceramic.
  
  To the east lay Turkey, land of dance and sweet meats and healing balms, his colorful cultures tightly woven together like a beautiful rug under the prayers of Islam.  But upon that rug now treads a tyrant, ready to supress whomever appears to threaten his majestic rule.  A whirlpool of fear gives rise to a surge of suspicion, secret forces sucking down the forgotten until they are disappeared.
  
  Half our ship wished to take their chances in the west.  The other half to brave the rising tyrany in the east.  A struggle insued until the boat could bear no more, and capsizing sent us all into the immortal salt sea.
  
  I barely made it back alive, forever divided, forever caught in the teeth of decisions, unable to choose, lost in the shoals of imaginary consequences.
  
 
      * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  -> END
  
  === Circe ===
the Story of Circe.
{chatnum == TELEMACHUS: -> Circe_Cruise}

  // Should return to the main boat scene that has so many randomized elements
  // it seems like a different main scene
  // though it leads to the same basic choices:
  
  Before arriving at the boat, {get_character_nickname(chatnum)} discovered a house, a mansion really, which was neither on the side of {chatnum==MILITANT: our President or the rebels | {chatnum==DESPOT: our people's side nor the rebels' | the tyrant nor freedom forces}}, a gaudy scarlet banner hung before it.  {get_character_nickname(chatnum)} recounts...
  
    Inside, my crew was greeted by a woman who was all smiles and lace, lounging like the royalty in American rap videos.  She offered our group a feast, {food<=81: roasted meats dripping their blood, the sweetest grapes, and cheeses drizzled in honey,} but a text from {chatnum==MERKEL: Seehofer | my friend} warned me not to join in -- I had "checked in" on my Hermes app. My group, quickly fell into a haze of Netflix and Chill-ing, the war far from their minds.
    
    { passengers <=9: Bana, Liliane, Amena, Yana, Adnan, Mohammed, Johnny... I can see them all, sloshing through the filfth of decadent repose.}
    
   {not despotID: Our host invited me up to her pleasure chamber, showed me every comfort.  "Let's take a little rest together," refugee, she said.  It was all very Hotel California. | And it ended as soon as it started.}
    
    {not despotID: I fled, dragging my crew with me, but they would not come, so now I am here, alone. | <> But you know how that goes...(What's this? Do they suspect who you are?)} 
    
    * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  ->END
  
  === Circe_Cruise ===
 
  In previous attempt to leave that war-reddened land, {get_character_nickname(chatnum)} was on another doomed watercraft, barely floating across the Mediterranean...
  
  When on the waters appeared a ship, wide and tall as Olympus, gladly cruising along the waves.  It so happened that this ship, this wondercraft was headed directly in our path, and we fell to weeping and shouting, waving our weary arms to gain its attention.
  
  At last we reached the side of the ship to discover its capson, a bright-smiling woman of tan skin, golden locks, and a uniform like alabaster.
  
  She helped us all aboard and set out for us what she called the breakfast Love and Locks and buffet, but which to us seemed a feast fit only for the gods.  I alone and Elpinor resisted.
  
  Soon, our members had feasted full to bursting, when I noticed a change in their appearance.  Where once there weeds were tattered, now they wore flowered shirts and loose fitting dresses, glittering dark glass shields for their eyes, and jewels about their necks.  They fell to lounge chairs, reclining on the deck, commenting about time-shares and Rick Steves, leather shoes and unstrenuous day trips.
  
  I made it out barely with my life.  Elpenor dove from a balcony into the Pool of Hookups. Fleeing back to the raft, I saw none of them ever again.
  
     * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
   -> somewhatlater
  
  ->END
  
  
  === Calypso === 
  the story of Calypso.
It is clear {get_character_nickname(chatnum)} is fond of this story -- no, not the story, the memory, the taste of honeyed wine on the lips.

Early on the path out of the country, I found myself the guest of a sahir named Calypso.  Of course, I did not know she was a sahir at first.  She took me in to a gorgeous home, with a floor of painted tile, and adjacent every room a bath, which is why she walked around in a loose wrap, that covered her body like an open secret. 

The town was Palmyra and it might have been Palm Springs or something out of a Dubai developer's dream.  {food<71: Cafes and gourmet eateries drew foodies from all nations | Golf courses. Shopping malls.}  Towering edifices, like Babel, surrounding the Lion of Al-Lat, the Temple of Bell, and other treasures.   We drove through town in a golf cart, sipping nectar from champagne flutes.

{passengers<5: Of course, my entourage were not there, but I could not yet understand that they were all dead. | It was just me.  I assumed my entourage were out enjoying the spoils of the spoiled.}

Until one evening, at sahar, some rumbling, bombing actually, tore the veil from my eyes, and I could see Calypso and her tent of secrets and the town for what it was -- ruins.  The battling forces took no pity on history.   When I left, all was in ruins, and I knew I must flee Syria. 

* [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
  
  -> somewhatlater
     
  
  ->END
  
 
  
  === Cyclops === 
  the Story of Cyclops.
  
  When we were in Damascus, the cyclops was there.  When we were in Hama, he was there, too. Homs, An-Nabak, Latakia.  Always he was there watching us.  Not always close up in our faces.  Sometimes just from above.  A single eye funneling our images out into the great cerebral cortex of the Earth.
  
  What happened to the images once it reached there?  Only Allah knows.  {morale<45: (You hear them grumbling, don't you? Don't turn your back on any of them!)}
  
  Some looked down.  Some looked away.  Some leaned in, squinting, to get a better sense of what was going on, but cyclopian vision is a very one-dimensional kind of thing.
  
  {despotID: And then that was basically it. | So I got to thinking.  Maybe the way to get away is to give it what it wants.  One afternoon, after a bombing, as it came close to me, climbing over the dead dogs and children, because the bombers had mistaken in their myopia a school for a military training base, as it came right up to me and asked me my name, I said. I'm whom ever you expect me to be.} 
  
 {despotID: And the tale ends there. <> | That instant my image went out, and there was -- what would you expect -- outrage, disgust.}
 
 {despotID: With that, {get_character_nickname(chatnum)} turns away toward the sea. | And as I fled, the people hollered for my head:  Go get that one! And when others asked, Which one? there could only be one reply.  That one who was what we expected.} 
  
  
     * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  ->END
  
  
  === Laestrygonians ===
  the story of the Laestrygonians.
  
  {not despotID:{chatnum == DOCTOR: -> despot_agamemnon}}
  
'Well, you think we're hungry,'  {get_character_nickname(chatnum)} says, dabbing at a forehead dropping with sweat.  'We didn't know how hungry a person could be until we met the Laestrygonians.'

We found our way to a great building -- a factory, with high smoke stacks that cast long shadows all the way down to the sea.  There, they made tennis shoes, I think, named after a great hero of Olympus.

Inside, we found a conveyor belt that we were asked to stand upon.  Woe to the men and women who did.  'Don't worry,' assured the foreman, 'You are just what we were hoping to find.' Many of us cheered, imagining we had just won jobs in the great globalized market place...

But we had another thing coming to us.  For low and behold, we were not the perfect workers for this new post-industrial factory, but instead we were the raw materials, and the great, never-satisfied machines were ready to devour us. Many a man and woman were converted into vertical boost for basketball shoes.  Some were relegated to the heels.

Only I managed to escape, though not without these, and {get_character_nickname(chatnum)} shows you a shining pair of water-logged sneaks.
  

  
     * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  ->END
  
  === despot_agamemnon ===
  ~ chatnum = DESPOT
  <> -- but before he can even utter his first word, {get_character_nickname(chatnum)} interrupts him.
  
  Despot they call those who keep chaos at bay through the strategic exercise of a firm hand.  Tyrant they curse -- but was not poor Oediupus likewise called a tyrant? And I never dabbled in such patricide or mater-mony.  
  
  Why must we leaders be judged wrongly for using whatever means the gods put at our disposal?  How do the gods of the western mount become so righteous when they sharpen blades far more deadly and hand them out at their will?
  
  Did you not see what happened to my brother tyrant Agamemnon when the rotten blooms of that Arab spring bloomed in his oilly land?   Did not his love, Clytemnestra, whom he had served up so many riches, turn to the coward Aegisthus and plot his usurpation?  What kind of a spring heralds such a fall?
  
  And did they raise statues of nobel Agamemnon in the city square, or did they instead lop off his capital rule. 
  
  A leader does what he {MerkelID: or she} must. 
  
  You recognize the man in tattered robes in the despot who ruled the country you have just fled. 
  
   ~ despotrevealname = true
      * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  ->END
  
  === HeliosCattle ===
  the story of the Cattle of Helios.
  // Going to Paris and eating the food?
  //Militant -- LEbanon
  //Freedom Fighter- Paris
  //Doctor -- Kayla Mueller -- refused to negotiate
  //Reporter-- State Corruption
  // Odysseus -- the sheep of Helios
  // Penelope -- The weaving and unweaving
  // Telemachus -- 
  // Merkel -- the good will of the Germans 
  
  Looking off to sea, {get_character_nickname(chatnum)} gets a strange smile and shares a story of an early excape tha led <> 
  
  {freedomfighterID: to Paris.}
  
  {freedomfighterID:When we arrived in Paris, it was like Wow -- the city of lights! How could we go from a war zone to the top of the Eiffel Tower?  I soon learned that Paris is lined with sewers.  Les Mesirables, they call us.}
  
  {freedomfighterID: But you can survive on the stale bagettes and moldy cheese if you're not surrounded by gun fire.}
  
  {freedomfighterID:Then the attacks hapened.  Suddenly, even moldy cheese was too much for a sewer rat.  Our names, our hijabs were bright flags announcing our terrorist leanings. L'affaire du voile  } 
  
{freedomfighterID: If you're a muslem, you do not feast on the crumbs of Paris.} 
  
  {not freedomfighterID: to Thrinacia.}
  
  {not freedomfighterID: When we arrived at Thrinacia, we saw the magnificent cattle of Helios.  I ordered my crew not to bother them, for I had received warnings.}
  
 {not freedomfighterID: But men can only follow rules for so long when they are starving. So they slaughtered and roasted them.}
  
  {not freedomfighterID:Then Helios complained to the gods, threatening to leave the sky of the living to light the days of the dead.  That spelled out doom.}
  
  {not freedomfighterID:If you're a mortal, you do not feast on the cattle of the gods. }
  
 
  
  
      * [Thanks for the tale] You thank {get_character_nickname(chatnum)} for the tale.
    
    
  -> somewhatlater
  
  ->END
  
  
  === AeolianWinds ===
  {not AeolianWindsOpen: Where did it come from?}
 * Open the bag of wind. ->AeolianWindsOpen
 + Try to forget about the bag -> somewhatlaternext
  ->DONE
  
  === AeolianWindsOpen===
  {despotID: You| The despot} had given out Aeolian bags of wind to  {despotID:your |his }people in a gesture that seemed downright eponymous.  And now here it is before you.  With excited hands you open it, but before you can even get it all the way untied, the noxious fumes make you light headed.
  
  It's chlorine, "Cast it away!" somebody cries. 
  
  Athena, pitying your plight, pleads with her father, 'You promised not to let him perish by poisoned wind.  Zeus, in turn, explains that unfortunately gas in a bag does not count as poisonous wind.
  
  But Poseidon seeing an opportunity, casts his waves to their spray blows the murdurous gas away, at once also blowing the raft off course.  You are glad to be alive, but sickened by your ill-fate. 
  
  ~distance++
 ~overallfeeling--
  
  
   *  Give up on wind bags.
  -> somewhatlater
  
  === hades === 
  To the port side of the boat, you hear what sounds like singing...
  
  * [See where the singing is coming from.] -> hades_examine
  + [Try not to look.] You keep your eyes starboard, ignoring the haunting song. -> somewhatlaternext
  ->DONE
  
  === hades_examine===
  // Customize Hades for each character -- that they might see relevant dead
  
  Casting an eye warily to that side, you catch a glimpse of a scene that chills you.  There, amidst the waves, are dozens of bobbing logs -- no, not logs, the fog is playing tricks with your eyes -- these are heads, now shoulders, arms, and hands, and as the fog clears -- or thickens -- you realize they are clusters of people, clusters of the dead.
  
 {PenelopeID: Some mutilated, some beaten, some starved, all of them women.  These are the women of Achea, who have died or been murdered by those warrior men who deem them possessions. Some took their own lives, seeing no escape.  }
 
 {PenelopeID: Semele, Niobe, Timycha of Sparta, Antigone,  Not to mention the countless nameless women who died in child birth, bearing sons and daughters as a final gift of life. So the gods deem the fate of women. {odrevealname==false: It strikes you that your own husbands absence has only spelt a metaphorical death for you.}}
  
 {TelemachusID: All of the noble warriors of Achea, here strewn across the sea. Were but you of age, you might have been among them. {odrevealname==false: You strain your eyes to see if your lost father is among their number, but cannot make out his mighty frame.}}
  
  {MerkelID: Who are these emaciated souls?  Their heads are shaved their bodies pale. And then it becomes clear.  They are the victims of the Holocaust.  They are the ones who haunt your dreams and even now drive you to make Deutschkand uber allis in its generosity and hospitality.}
  
  {doctorID: So many bodies, such a sea of humanity. And then you recognize them.  These are patients you have lost.  Back home, before you joined these borderless doctors.  These are the ghosts that haunt your hands as you work to sew up the living.  These are the ones whose faces drove you here.}
  
  {OdysseusID: How did these brave soldier who fought with you in war-torn Troy find their way hear.  Why do they look on you with such plaintive looks? Was it not a noble cause for which you fought?}
  
  {OdysseusID: But the first of these is Elpenor, who explains that he had drunk to much at the party at Circe's and well mistook the the ladder for a Lay-Z-Boy. Yes, if you ever get to shore, you promise, you will give him a funeral fitting such a dope.}
  
  
  {freedomfighterID: This mass of bodies is indistinguishable to you but you recognize them as fighters all.  From the resistance, from the supporters of the despot.  Stripped of the uniforms, their bodies torn and tangled, there are no signs of their allegiance, just markers of the descretation that was their murder in a jihad devoid of religious purpose.}
  
   {militantID: This mass of bodies is indistinguishable to you but you recognize them as fighters all.  From the rebels, from the loyalists.  Stripped of the uniforms, their bodies torn and tangled, there are no signs of their allegiance, just markers of the descretation that was their murder in a jihad devoid of religious purpose.}
  
  
  {reporterID: How many have gone below on their perilous journey seeking refuge? Enough to create a bridge over the Mediterranean sea.}  
  
 {reporterID:  At first, you recognize no one, but as the boat makes it way past them, you make out the face of a child, hair now tangled with briny seaweed, face now drained of color, a child you saw get on the raft that left just before yours.}
  
  {despotID: Why did these people flee? Could they not have stayed in their own land and merely obeyed?  Their deaths were meaningless now that you have had to take refuge in this godsforsaken raft. Pity. -> somewhatlater }
  
  {not PenelopeID: {not penelope_dead: The crying woman is speaking their names into the water. How she knows them, the gods can only say. Later you will learn that she receives these names through the string she knots and unknots.}}
  
  They disappear into the fog as fast as they appeared. 
  
  * Look back to the ship.
  -> somewhatlater
  
  
  === nomorefood ===
  It is a sad day. Tragic, after all of this work. You hunt through the cans of rations, moldy and rancid though they were, but there is not enough to go on.
  
  -> END
  
  === odysseusend ===
  You recognize from a smell, a scent, that despite the disfigurement of her face, this is your lovely bride, to whom you were so desperate to return. 
  

  
  She <>
  
  ->END
  
 
 === perish ===
 // the ending when hitpoints goes to zero.
  
  {~ You have wasted away to nothing, and your story has come to an end. | Refugees pay their way from their homeland with pieces of themselves until they are no more. You are spent.}
  
  -> END
  
  === falloff ===
  //Many fall off endings -- 25?
   You fall off the raft and <>
  {~ are quickly drowned.| die a watery death.| are grabbed by a Russian submarine ship only to return years later as a track and field star with limbs of godly proportions but a strong likelihood you will not be allowed to compete in the Olympic games. | die.  However, when some tourists on a cruise find your corpse photobombing their selfies, you become a shortlived Internet meme.| sink to the bottom of the see, where you meet Poseidon and the Sea Witch. Poseidon is very glad to see you, since he'd been creating havoc for years just to get you back.  The Sea Witch, after hearing you sing, is nonplussed.| perish, though not before seeing a fishing vessel on a course toward the raft, sending out some small boats to come and rescue everyone --  well, everyone but you. | are soon dead.  However, a journalist in a passing helicopter catches a shot of you, and after a cover story in Der Spiegel, you -- or your corpse -- become the symbol for the seneseless slaughter that is this war.  Nonetheless, Middle Eastern politics are too messy for the general public to care too much about for too long, and you are soon forgotten thanks to some tabloid headlines about weight loss miracle drugs hidden where you'd least expect them. }
  
  ->END
  
  === raftsinks ===
  This storm-battered craft can sustain no more floating.
  
  { ~ The raft sinks into the water, and you think just before you also are overcome by waves, that you hear a voice cry "Freedom!"| As the raft begins to founder, you find yourself tuggged by the hands of greedy nymphs. They want you for their underwater kingdom and giggle to see that you are not fitted with proper gills. | As the raft sinks into the depths, you see Poseidon frowning, for though he will finally see your demise, he will also have to tolerate your company in his underwater kingdom.}
  
  { ~ Athena appears as a broad-lipped fish, saying, "Next time try to win over your fellow refugees!" |  Athena appears as a water-logged Mentor and says, "Next time try to earn the chance to Lead." | Athena appears as water bubbles and writes out, "Talking to the other characters is almost always wise." | Athena appears a woman trapped in seaweed, holding up a sign that says, "Perhaps you should have sacrificed a portion of your food to win the favor of your fellow travelers.}
  
  
  //{ ~ With tears in your eyes, you make out the outlines of boats at the great port.  It is the land you thought you'd never see.  | Today, you are greeted by an imposing military craft, full of armed men.  No, they are not hostile, but they are also not the welcome wagon. These swift and purposeful vessels have been specially deployed to redirect all watercraft to Turkey. Welcome to your new home. }
  
  ->END
  
  
  === ending_greece ===
  
    You convince the passengers to row with all their might till you reach land, Greece! 
  

  
  //{not odysseus_dead}{not penelope_dead}{not telemachus_dead}: No one could be happier than a wanderer from Ithaca.
  
  {OdysseusID: Ithaca, O, Ithica! With tears in your eyes, you makeout the outlines of boats at the great port.  It is the land you thought you'd never see. {Penelope_reveal: And your wife, your true home, is found. {penelope_dead: But at the same time she is lost.}} But, as you can see, there was never just one war.} 
  
 {PenelopeID: There is only one word for where you find yourself: Home. {Odysseus_reveal: {odysseus_dead: Though you have lost the one whom you thought would bring restore home to you. | And you are accompanied by the one you had been waiting for.}}} 
 
 {TelemachusID:  You are home. {Odysseus_reveal: You have found the missing father you were seeking.} {Penelope_reveal:You discovered your mother along the way.} But now that you know how many fatherless sons there are, what will you do?}
 
 {doctorID: But one land is the same as the next, for the doctor without borders, and you know the sickness will be no less, only fewer shrapnel wounds, hopefully or hopelessly, depending on your mood.}
 
 {despotID: But the gods have been waiting for you, hanging around, playing dice, getting a nose full of crispy burnt sacrifice, and they have plans for you that they have been dreaming up that make sisyphus look like he's taking a holiday.}
 
 {MerkelID: Now, how will you get back to Germany? Why doesn't anyone recognize you? You chew on the pita bread they handed you when you disembarked -- if you can call it that. Soon you will be led to a dention camp -- although they call it something else -- where you will sleep side-by-side with women poorer than you can imagine, one of whom becomes your Soul Schwester -- your blood sister. She will not survive.}
  
 {freedomfighterID: {not militant_dead: You have arrived in a new land, al-hamdulillah, where you may eat the scraps off another man's table.  You will never be fully welcome here, you know.  But maybe, inshallah, your children, or their children.  The soldier in fine clothes stands at your shoulder with an inscrutable smile on his face.  Let us go and make peace with our new countrymen but his words sink like a stone in your gut. What snake have you brought into this refuge. | You have made it to a new home, al-hamdulillah, thanks be to God. Here you can make a new life while watching on the television your homeland crumbling, your people suffering. However, just before reaching the Greek port, you are greeted by an imposing military craft, full of armed men.  No, they are not hostile, but they are also not the welcome wagon. These swift and purposeful vessels have been specially deployed to redirect all watercraft to Turkey. Welcome to your new home. }}
  
 {militantID: A dream! Here you will find a welcoming people who will not question as you infiltrate its culture before it infiltrates you.}
 
 {reporterID: Your eyes are wide open.  Surely, this is not the story you sought, but here are the endless tales you have found.  }
  
  ->END
  
  === ending_turkey ===
  You convince the passengers to row with all their might till you reach land, Turkey. 
  
 Turkey is ready to receive you with open arms.  
 {not despotID: {not despot_dead: The despot seems strangely happy with your choice. Perhaps he has friends here.}}
 
 {not OdysseusID: {not odysseus_dead: {not Odysseus_reveal: And the homesick soldier seems a bit on edge. | And Odysseus seems a bit apprehensive at returning to the land where he saw so much bloodshed.}}}
 
 {OdysseusID: But the nearer you get, the more your heart sinks within you.  For this Turkey, as they call it, is none other than the city where you lost so many of your comrades.  It is the birthplace of sorrow, the land of Troy. The journey you thought was done, has once again begun. -> aboat}   
 
 {PenelopeID: {not Odysseus_reveal: Turkey?  Turkey?  What sort of ruse is this?  For surely thinky veiled in this welcoming country of Turkey is the war-torn country of Troy.  The only source of your hope is that perhaps now you will at last find your missing husband. | They call it Turkey and welcome you, but you and your husband know a thing or two about traps disguised as gifts.  But you are happily together and after stopping for some take a tour of the rug shops before stopping to sea a beautiful dance, the tale of the White Rose, whose sadness brings you both to a torrent of tears that is releasing just a few liters of pain from your twenty years of separation. }}
 
 {TelemachusID: Here is a safe haven, or so they say, this Turkey as they call it, though you remember it by another name.  But you soon learn that Turkey is backing the rebels, not to topple the despot, but to push back the Kurds, who are supporting the state in its fight against terrorists and your head begins to spin.  War was easier when you were hiding in wooden horses.}
 
 {freedomfighterID: Seeing the unwelcoming look in the eyes of those who watch your approach from the dock, you realize that in seeking refuge, you have traded the uneasy bed of a noble fight for the borrowed mat of another's home.  Here you are the interloper, you are the unwelcomed suitor here to court someone else's motherland. How easy will you rest, in a land where you eat someone else's fruit?}
 
 {militantID: As your raft arrives, the Turks look on you with suspicion. Not every place here is safe for you, but you will be more likely to blend in and so to complete your larger mission. {not despot_dead: Here, you know, there are many pockets of support for the despot.| When the new leader takes the place of the despot, you will find support for him here, you are sure.} Until then, you can blend in, lay low, have some tea and perhaps a piece or two of Turkish delight. A war is not only the frontlines, you tell yourself. The jihad is lifelong.}
 
 {MerkelID: At first, people treet you like any other refugee -- though the style of yoru hair, your complexion, your German-ness draw a particular kind of confused looks and sideways soto voce conversations.  Then, some when recognizes you. When he learns of your arrival, President Erdoğan, Reis-i Cumhur, President of the People, comes out to greet you.  You do not know if you can trust this man.  Yet, you cannot afford to let him know that.  Suddenly, you realize your back on that raft.  You have always been so. }
 
 {doctorID: When you are brought to the refugee camp, one truth is clear, as you survey the malnourished, the wounded, the ill, who are overwhelming the medical staff not because of any fault on the part of Turkey, but only by their sheer numbers: Suffering knows no borders.}
 
 {reporterID: Turkey has just as many stories as anywhere else, you think to yourself, but presenting your press credentials to the coordinators of the refugee camp triggers whispered conversations with increasingly more official and serious-looking people, all the way up the chain of command until your are ushered into a van that you are told is bringing you to the press control room.  It is not yet clear what kind of control is to be exerted there, but you are fairly certain the object of that control is you. }
 
 {despotID:  While Turkey has not always been the biggest ally of your reign, they did help you deal with those pesky Kurds.  No doubt negotiations can be struck over some fine Turkish delight.  Only the officials at this camp do not believe you are who you say you are, although, it appears some in the camp do, and the smiles of their face look like scimitars. "I am the despot," you cry.  But your voice is soon drowned out by a sea of voices, saying, "I'm the despot."  And soon your are encircled as if by rings of hungry sharks.}
  
  -> END
  
  
  === ending_syria===
  You convince the remaining passengers to turn the boat around and head for Syria, whose military are only too happy to receive you.
  
  {OdysseusID: Assyria. Why have the gods blown us back here again? {Penelope_reveal: At lest you have found your wife. {not penelope_dead: And she is here by your side | Though she has perished in your odyssey.} } }
  
  {PenelopeID: The gods have frowned upon you -- cursed you for venturing forward to seek the one you'd lost -- or are they calling you out to find your way through this warring land, leaving suitors old and new behind?}
  
  {TelemachusID: Son of a warrior back in a waring land.  That is fine, O, warrior of afar, your name is your destiny. }
  
  {militantID: Though you had to abort your overall mission, you can rejoin the fight for your home country, albeit at a lower rank, still impoverished.  Still, with you to defend them, at least you can be the one with the rifle, trying to keep your family safe. }
  
  {despotID: The general does not ask where you've been or why you had stepped on to the raft, nor will he step down from his new position of commander-in-chief-and-in-total.}
  
  {freedomfighterID: {not militant_dead:  The soldier in fine clothes has just placed a large knife between your ribs.| This is your destiny.  Your fight must continue here.}}
  
  {MerkelID: The people surround you.  They are not your people, yet they ask you, demanding, what can you do for us?  I have done all that I can, you argue, but they are not sure that hospitality is enough. }
  
  {reporterID: Back to the frontlines, to report, to witness.  That is fine with you.  There are stories that must be told, though you may have to give your life in the telling. }
  
  -> END
  
  === ending_pray ===
  There is no way to safety through force of will. 
  {~You pray to the gods and as far as you can tell, they have shrugged. | You offer a sacrifice to the gods, tossing all your smartphones into the sea, and they answer with the static of waves, a sound that will lull you into your final sleep. |  The gods smile upon you as you find yourself merely a character in a story. }
  
  -> END 
  
  
 === ending_fightgods ===
 You convince the other passengers that it is time to take on the very gods who put you in this plight. 
 
 {odysseus_dead: Perhaps, if the homesick soldier were still alive, there would be some hope of overcoming the gods, but with out him, you are Od man out.| You rage against the gods, not just with words and shaking fists, but with every weapon in your arsenal. Of course, the homesick soldier turns out to have a special power with the gods. The battle lasts for days until you defeat all of Olympus.  Now, these once mighty overlords are left to flounder in the sea, as you ascend to the heavens and play dice with their lives.}
 
 
 -> END 
 
 === sink ===
 
 {~ Despit the courageous effort, the ship has sunk. | Sailing in these waters can be difficult. In a poorly patched and fraying raft, it is impossible.  This raft could not last.}
 
 ->END
  
  ===lumberjack===
  I'm a lumberjack and that's okay
  I sleep all night and I work all day.
  * Sing some more ->lumberjack
  * No more singing-> endscript
 
  ===makingeggs===
  First, I crack the eggs.
  Then, I put them in the pan
  Next, I scramble them like crazy!
  * Keep cooking
  ->makingeggs
  * Finish cooking
  
  ->endscript
  
  === loopdeloop ==
  
  Here's my loopdeloop text. 
 - ->->
 
 
 
 
  
  === endscript ===
  
 

CONST HALLWAY = 1
CONST OFFICE = 2

VAR player_location = HALLWAY
VAR generals_location = HALLWAY 
VAR doctors_location = OFFICE
-> run_player_location

== run_player_location
    { 
        - player_location == HALLWAY: -> hallway 
    }

== hallway ==   
    <- characters_present(OFFICE)
    *   [Drawers]   -> examine_drawers
    *   [Wardrobe] -> examine_wardrobe
    *  [Go to Office]   -> go_office
    -   -> run_player_location  
    


= examine_drawers 
  Looking in drawers 
  ->hallway
 
 = examine_wardrobe
  Looking in drawers
  ->hallway
  
== go_office==
Here we are in the Office
->DONE

// Here's the thread, which mixes in dialogue for characters you share the room with at the moment.

== characters_present(room)
    { generals_location == player_location:
        <- general_conversation
    }
    { doctors_location == room:
        <- doctor_conversation
    }

== general_conversation 
    *   [Ask the General about the bloodied knife]
        "It's a bad business, I can tell you."
    -   -> run_player_location

== doctor_conversation 
    *   [Ask the Doctor about the bloodied knife]
        "There's nothing strange about blood, is there?"
    -   -> run_player_location 
    
    // === interviewsomone===
    // ask someone a question//
    // checks if the people are there 
    // then offers a chance to interview any of the people
    // interviewing sends somone into one of the story offshoots
    // sends number of the person being interviewed
    // shuffles the destinations?
    
    -> END
    
    