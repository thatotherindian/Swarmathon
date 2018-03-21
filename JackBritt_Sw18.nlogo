;----------------------------------------------------------------------------------------------
 ;; COMPETITION SUBMISSION FILE
;----------------------------------------------------------------------------------------------
 ;; Elizabeth E. Esterly
 ;; elizabeth@cs.unm.edu
 ;; The University of New Mexico
 ;; Swarmathon 5: Competition
 ;; version 1.0
 ;; Last Revision 01/13/2017
;----------------------------------------------------------------------------------------------
  ;;
  ;; 
  ;;Jack Britt High School
  ;;Mrs. Kerry Humphrey 
  ;;Rithvik Annamaneni, Emmanuel Boitey, Nathaniel Wellborn, Caleb Hancock, Leonie Brown, Alex Field, Walter Kirkland, Jessica Muniz
;---------------------------------------------------------------------------------------------- 
 
;------------------------------------------------------------------------------------
;::::::::::::::::::::!!!!!!!!!   REQUIRED CODE  !!!!!!!!!::::::::::::::::::::
;------------------------------------------------------------------------------------
 ;;Use the bitmap extension.
 extensions[bitmap]

  patches-own [
     baseColor
     ;;You may add additional patches-own variables below this comment.
     rredsaveheading     ; the heading it was at when it sensed a rock       ;unless the robot is the purple one they all have the same functions as well as their variables the only differences between them is the distances they travel in their pattern
     rredsavedistance    ; the distance from 0,0 when it sensed a rock       ;so we because we made each robot(except purple) the same the red one has most of the comments. the purpleone has some too
     rredsavestation     ;if a location is saved
     rorangesaveheading
     rorangesavedistance
     rorangesavestation
     ryellowsaveheading
     ryellowsavedistance
     ryellowsavestation
     rgreensaveheading
     rgreensavedistance
     rgreensavestation
     rbluesaveheading
     rbluesavedistance
     rbluesavestation
    ]  
  globals 
  [
  ]
  breed [rred robot]            ;making robot breeds
  breed [rorange robot]
  breed [ryellow robot]
  breed [rgreen robot]
  breed [rblue robot]
  breed [rpurple robot]
  rred-own
  [
    rredspiral    ; when a robot is going in a spiral
    rredlength    ;length of the current line on a robots spiral
    rredsteps     ;basically the distance a robot has moved in one line
    rredskipper   ;a numerical equivaent of the direction in turns in
    rredskip      ;the first large increase in r(color)length
    rredskip2     ;the second large increase in r(color)length
    rredturncounter   ;counts the amount of turns of a robot
    rredcollect      ;when a robot has sensed a robot
    rredpatchx       ;the saved location after a rock is sensed
    rredpatchy
    rredpatchxl
    rredpatchyl
    rredreturning         ;when a robots bringing a rock to base
    rredsavepoint         ; when a robot has a point saved
    rreddirection         ;the direction of a robot
  ]
  rorange-own
  [
    rorangespiral
    rorangelength
    rorangesteps
    rorangeskipper
    rorangeskip
    rorangeskip2
    rorangeturncounter
    rorangecollect
    rorangepatchx
    rorangepatchy
    rorangepatchxl
    rorangepatchyl
    rorangereturning
    rorangesavepoint
    rorangedirection
  ]
  ryellow-own
  [
    ryellowspiral
    ryellowlength
    ryellowsteps
    ryellowskipper
    ryellowskip
    ryellowskip2
    ryellowturncounter
    ryellowcollect
    ryellowpatchx
    ryellowpatchy
    ryellowpatchxl
    ryellowpatchyl
    ryellowreturning
    ryellowsavepoint
    ryellowdirection
  ]
  rgreen-own
  [
    rgreenspiral
    rgreenlength
    rgreensteps
    rgreenskipper
    rgreenskip
    rgreenskip2
    rgreenturncounter
    rgreencollect
    rgreenpatchx
    rgreenpatchy
    rgreenpatchxl
    rgreenpatchyl
    rgreenreturning
    rgreensavepoint
    rgreendirection
  ]
  rblue-own
  [
    rbluespiral
    rbluelength
    rbluesteps
    rblueskipper
    rblueskip
    rblueskip2
    rblueturncounter
    rbluecollect
    rbluepatchx
    rbluepatchy
    rbluepatchxl
    rbluepatchyl
    rbluereturning
    rbluesavepoint
    rbluedirection
  ]
  rpurple-own
  [
    rpurpledeadendcounter     ;the times a robot has run into a wall
    rpurplewalk               ; when it is walking
    rpurpledeadend            ;when a robot has reached a wall
    rpurplerecover1           ;when it just returned home
    rpurplerecover2
    rpurplecollect            ;when it sensed a rock
    rpurplereturning          ;bringing a  rock home
     purpleprocessingList?     
     purplereturning?
     purplerockLocations
     purplelocX 
     purplelocY
     purpleinitialHeading
  ]
 
;------------------------------------------------------------------------------------
;::::::::::::::::::::!!!!!!!!!   REQUIRED CODE  !!!!!!!!!::::::::::::::::::::
;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------
 ;;;;;;;;;;;;;;;;;;
 ;;    setup     ;; : MAIN PROCEDURE
 ;;;;;;;;;;;;;;;;;;
 ;------------------------------------------------------------------------------------
;;Write the setup procedure.
to setup
  file-config
   ;;You may add additional setup commands below this comment.
  reset-ticks ;sets ticks back to 0
birth-rred              ; births robots
birth-rorange
birth-ryellow
birth-rgreen
birth-rblue
birth-rpurple
ask patches
[
  set rredsavestation false             ;turn off the save station for these patches
  set rorangesavestation false
  set ryellowsavestation false
  set rbluesavestation false
  set rgreensavestation false
]
end


            ;------------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make rred   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-rred
             create-rred 1
             [
              set size 5 ;create turtle with size 5
              set shape "robot" ;make turtle a robot
              set color red ;make robot appear red
              set heading 90 ;tell robot to head towards 90 degree angle from base
              set label "dark plagueis the wise" ;name robot rred
              set label-color red ;make label appear red
              set rredspiral true ;tell red robot to move in a spiral
              set rredlength 1 ;set spiral line length to 1
              set rredsteps rredlength ;set step number to line length
              set rredskipper 4        ; set the turn "timer"
              set rredskip false       ; set the long line settings off
              set rredskip2 false
              set rredturncounter 1        ;start the turn counter off
              set rredcollect false          ;set the collecting mode off
              set rredreturning false     ;set the returning mode off
              set rredsavepoint false   ;set the returning to save point mode off
              set rredsaveheading 90        ;starting heading
             ]
           end
           ;------------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make rorange   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-rorange
             create-rorange 1 
             [
              set size 5
              set shape "robot"
              set color orange
              set heading 90
              set label "euchlid"
              set label-color orange
              set rorangespiral true
              set rorangelength 6
              set rorangesteps rorangelength
              set rorangeskipper 4
              set rorangeskip false
              set rorangeskip2 false
              set rorangeturncounter 1
              set rorangecollect false
              set rorangereturning false
              set rorangesavepoint false
              set rorangesaveheading 90
             ]
           end
           ;------------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make ryellow   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-ryellow
             create-ryellow 1 
             [
              set size 5
              set shape "robot"
              set color yellow
              set heading 90
              set label "kevin"
              set label-color yellow
              set ryellowspiral true
              set ryellowlength 11
              set ryellowsteps ryellowlength
              set ryellowskipper 4
              set ryellowskip false
              set ryellowskip2 false
              set ryellowturncounter 1
              set ryellowcollect false
              set ryellowreturning false
              set ryellowsavepoint false
              set ryellowsaveheading 90
             ]
           end
           ;------------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make rgreen   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-rgreen
             create-rgreen 1 
             [
              set size 5
              set shape "robot"
              set color green
              set heading 90
              set label "peanut"
              set label-color green
              set rgreenspiral true
              set rgreenlength 16
              set rgreensteps rgreenlength
              set rgreenskipper 4
              set rgreenskip false
              set rgreenskip2 false
              set rgreenturncounter 1
              set rgreencollect false
              set rgreenreturning false
              set rgreensavepoint false
              set rgreensaveheading 90
             ]
           end;------------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make rblue   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-rblue
             create-rblue 1 
             [
              set size 5
              set shape "robot"
              set color blue
              set heading 90
              set label "sanic"
              set label-color blue
              set rbluespiral true
              set rbluelength 21
              set rbluesteps rbluelength
              set rblueskipper 4
              set rblueskip false
              set rblueskip2 false
              set rblueturncounter 1
              set rbluecollect false
              set rbluereturning false
              set rbluesavepoint false
              set rbluesaveheading 90
             ]
           end
           ;--------------------------------------------------------------------------------
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;    make rpurple   ;; :  
           ;;;;;;;;;;;;;;;;;;;;;;;;;
           ;------------------------------------------------------------------------------------
           to birth-rpurple
             create-rpurple 1 
             [
              set size 5
              set shape "robot"
              set color violet
              set heading 225
              set label "becky"
              set label-color violet
              set rpurpledeadendcounter 0   ;set the counter to 0
              set rpurplewalk true
              
              ;sets all of these robot modes to false to ensure the robot starts with a "clean slate" and can proceed out to collect rocks
              set rpurpledeadend false
              set rpurplerecover1 false
              set rpurplerecover2 false
              set rpurplecollect false             ;
              set rpurplereturning false     
              
              ;the following variables are for the DFS portion of the robot    
               set purpleprocessingList? false    
               set purplereturning? false      ;stops the robot from returning back to base immeadiately
               set purplerockLocations []    ;emptys the list of rock locations
               ;sets the locX and Y to 0
               set purplelocX 0
               set purplelocY 0
             
               set purpleinitialHeading heading
             ]
           end
 
;------------------------------------------------------------------------------------
;::::::::::::::::::::!!!!!!!!!   REQUIRED CODE  !!!!!!!!!::::::::::::::::::::
;------------------------------------------------------------------------------------
 ;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;    ROBOT CONTROL    ;; : MAIN PROCEDURE
 ;;;;;;;;;;;;;;;;;;;;;;;;;
 ;------------------------------------------------------------------------------------
 ;;Write the robot-control procedure.
to robot-control
  
  
  if ticks = 3600 [stop]
  
  
 ask rred
 [ 
   if rredsavepoint [rredsave]
   if rredcollect [rred-collect]    ;choses which prgram to run
   if rredspiral [rred-go]
   if rredreturning [rredreturn]

 ;  ask patches in-radius 2 [if pcolor != green [set pcolor red]]
 ]
 ask rorange
 [ 
      if rorangesavepoint [rorangesave]
   if rorangecollect [rorange-collect]
   if rorangespiral [rorange-go]
   if rorangereturning [rorangereturn]

   
;   ask patches in-radius 2 [if pcolor != green  [set pcolor orange]]
 ]
 ask ryellow
 [
      if ryellowsavepoint [ryellowsave]
   if ryellowcollect [ryellow-collect] 
   if ryellowspiral [ryellow-go]
   if ryellowreturning [ryellowreturn]

;   ask patches in-radius 2 [if pcolor != green  [set pcolor violet]]
 ]
 ask rgreen
 [   if rgreensavepoint [rgreensave]
   if rgreencollect [rgreen-collect] 
   if rgreenspiral [rgreen-go]
   if rgreenreturning [rgreenreturn]

;   ask patches in-radius 2 [if pcolor != green  [set pcolor cyan]]
 ]
 ask rblue
 [
      if rbluesavepoint [rbluesave]
   if rbluecollect [rblue-collect] 
   if rbluespiral [rblue-go]
   if rbluereturning [rbluereturn]

;   ask patches in-radius 2 [if pcolor != green [set pcolor blue]]
 ]
 ask rpurple
 [ ;sets the commands for the 2 modes of this robot
    if rpurpledeadendcounter < 5[
   if rpurplewalk     [rpurple-go]
   if rpurplecollect [rpurple-collect] 
   if rpurplereturning [rpurple-returning]
   if rpurpledeadend [rpurple-deadend]
   ]
    if rpurpledeadendcounter > 4 [rpurpleDFS]
   
;   ask patches in-radius 2 [if pcolor != green [set pcolor violet] ]
 ]
  ;;tick needs to come last in your robot-control procedure.
  ;------------------------------------------------------------------------------------
   tick 
end



;------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;
;;    make go   ;; :  
;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;          rred     ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rred-go
                   ifelse not any? patches with [pcolor = yellow] in-radius 2 or (rredturncounter = 1) 
                   ;if there are any resources in range it set the robot up for them to be collected
                   ;if there are not any it makes the robot follow its "spiral" pattern
                   [
              fd 1
              ifelse rredskipper = 0
              [
               set rredsteps (rredlength + 20)
               set rredlength (rredlength + 20)
               set rredskipper 4
               set rredskip true
              ]
              [
               ifelse rredsteps = 0 
               [ 
                 left 90
                 set rredturncounter (rredturncounter + 1)
                 set rredskipper (rredskipper - 1)
                 set rredlength (rredlength + 2)
                 if rredturncounter = 8
                 [
                   set rredlength (rredlength - 23 )
                 ]
                 if rredskip2 = true
                 [
                   set rredlength (rredlength + 22)
                   set rredskip2 false
                 ]
       ;          if rredturncounter = 3
        ;         [
         ;          set rredlength (rredlength + 5) <----------------------------------------
          ;       ]
                 if rredskip = true
                 [
                   set rredskip2 true
                 ]
                 set rredsteps rredlength
                  
               ] 
               [ 
                 set rredsteps (rredsteps - 1) 
               ]
              ]
              ]
              [
                set rredspiral false
                set rredcollect true
              ask rred
              [
                set rredpatchxl [pxcor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                set rredpatchyl [pycor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                ;of patches with [pcolor = yellow])
                set rredpatchx rredpatchxl
                set rredpatchy rredpatchyl
                set rreddirection heading
                ask patch 0 0
                [
                  ask myself 
                  [
                    if (pxcor != xcor) and (pycor != ycor)
                  [
                    ask patch 0 0
                    [
                  
                    set rredsaveheading towards myself
                    ]
                    ]
                  ]
                  set rredsavedistance distance myself
                ]
                ask patch-here
                [
                  set rredsavestation true
                  set plabel "+"
                ]
              ]
              rred-collect
              ]
              
         
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    make rorange   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rorange-go
              ifelse not any? patches with [pcolor = yellow] in-radius 2 or (rorangeturncounter = 1)
                   [
              fd 1
              ifelse rorangeskipper = 0
              [
               set rorangesteps (rorangelength + 20)
               set rorangelength (rorangelength + 20)
               set rorangeskipper 4
               set rorangeskip true
              ]
              [
               ifelse rorangesteps = 0 
               [ 
                 left 90
                 set rorangeturncounter (rorangeturncounter + 1)
                 set rorangeskipper (rorangeskipper - 1)
                 set rorangelength (rorangelength + 2)
                 if rorangeturncounter = 8
                 [
                   set rorangelength (rorangelength - 23 )
                 ]
                 if rorangeskip2 = true
                 [
                   set rorangelength (rorangelength + 22)
                   set rorangeskip2 false
                 ]
                 if rorangeturncounter = 3
                 [
                   set rorangelength (rorangelength + 5) 
                 ]
                 if rorangeskip = true
                 [
                   set rorangeskip2 true
                 ]
                 set rorangesteps rorangelength
                  
               ] 
               [ 
                 set rorangesteps (rorangesteps - 1) 
               ]
              ]
              ]
              [
                set rorangespiral false
                set rorangecollect true
              ask rorange
              [
                set rorangepatchxl [pxcor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                set rorangepatchyl [pycor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                ;of patches with [pcolor = yellow])
                set rorangepatchx rorangepatchxl
                set rorangepatchy rorangepatchyl
                set rorangedirection heading
                ask patch 0 0
                [
                  ask myself 
                  [
                    if (pxcor != xcor) and (pycor != ycor)
                  [
                    ask patch 0 0
                    [
                  
                    set rorangesaveheading towards myself
                    ]
                    ]
                  ]
                  set rorangesavedistance distance myself
                ]
                ask patch-here
                [
                  set rorangesavestation true
                  set plabel "+"
                ]
              ]
              rorange-collect
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    make ryellow   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to ryellow-go
              ifelse not any? patches with [pcolor = yellow] in-radius 2 or (ryellowturncounter = 1)
                   [
              fd 1
              ifelse ryellowskipper = 0
              [
               set ryellowsteps (ryellowlength + 20)
               set ryellowlength (ryellowlength + 20)
               set ryellowskipper 4
               set ryellowskip true
              ]
              [
               ifelse ryellowsteps = 0 
               [ 
                 left 90
                 set ryellowturncounter (ryellowturncounter + 1)
                 set ryellowskipper (ryellowskipper - 1)
                 set ryellowlength (ryellowlength + 2)
                 if ryellowturncounter = 8
                 [
                   set ryellowlength (ryellowlength - 23 )
                 ]
                 if ryellowskip2 = true
                 [
                   set ryellowlength (ryellowlength + 22)
                   set ryellowskip2 false
                 ]
                 if ryellowturncounter = 3
                 [
                   set ryellowlength (ryellowlength + 10) 
                 ]
                 if ryellowskip = true
                 [
                   set ryellowskip2 true
                 ]
                 set ryellowsteps ryellowlength
                  
               ] 
               [ 
                 set ryellowsteps (ryellowsteps - 1) 
               ]
              ]
              ]
              [
                set ryellowspiral false
                set ryellowcollect true
              ask ryellow
              [
                set ryellowpatchxl [pxcor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                set ryellowpatchyl [pycor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                ;of patches with [pcolor = yellow])
                set ryellowpatchx ryellowpatchxl
                set ryellowpatchy ryellowpatchyl
                set ryellowdirection heading
                ask patch 0 0
                [
                  ask myself 
                  [
                    if (pxcor != xcor) and (pycor != ycor)
                  [
                    ask patch 0 0
                    [
                  
                    set ryellowsaveheading towards myself
                    ]
                    ]
                  ]
                  set ryellowsavedistance distance myself
                ]
                ask patch-here
                [
                  set ryellowsavestation true
                  set plabel "+"
                ]
              ]
              ryellow-collect
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    make rgreen   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rgreen-go
              ifelse not any? patches with [pcolor = yellow] in-radius 2 or (rgreenturncounter = 1)
                   [
              fd 1
              ifelse rgreenskipper = 0
              [
               set rgreensteps (rgreenlength + 20)
               set rgreenlength (rgreenlength + 20)
               set rgreenskipper 4
               set rgreenskip true
              ]
              [
               ifelse rgreensteps = 0 
               [ 
                 left 90
                 set rgreenturncounter (rgreenturncounter + 1)
                 set rgreenskipper (rgreenskipper - 1)
                 set rgreenlength (rgreenlength + 2)
                 if rgreenturncounter = 8
                 [
                   set rgreenlength (rgreenlength - 23 )
                 ]
                 if rgreenskip2 = true
                 [
                   set rgreenlength (rgreenlength + 22)
                   set rgreenskip2 false
                 ]
                 if rgreenturncounter = 3
                 [
                   set rgreenlength (rgreenlength + 15) 
                 ]
                 if rgreenskip = true
                 [
                   set rgreenskip2 true
                 ]
                 set rgreensteps rgreenlength
                  
               ] 
               [ 
                 set rgreensteps (rgreensteps - 1) 
               ]
              ]
              ]
              [
                set rgreenspiral false
                set rgreencollect true
              ask rgreen
              [
                set rgreenpatchxl [pxcor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                set rgreenpatchyl [pycor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                ;of patches with [pcolor = yellow])
                set rgreenpatchx rgreenpatchxl
                set rgreenpatchy rgreenpatchyl
                set rgreendirection heading
                ask patch 0 0
                [
                  ask myself 
                  [
                    if (pxcor != xcor) and (pycor != ycor)
                  [
                    ask patch 0 0
                    [
                  
                    set rgreensaveheading towards myself
                    ]
                    ]
                  ]
                  set rgreensavedistance distance myself
                ]
                ask patch-here
                [
                  set rgreensavestation true
                  set plabel "+"
                ]
              ]
              rgreen-collect
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    make rblue   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rblue-go
        ifelse not any? patches with [pcolor = yellow] in-radius 2 or (rblueturncounter = 1)
                   [
              fd 1
              ifelse rblueskipper = 0
              [
               set rbluesteps (rbluelength + 20)
               set rbluelength (rbluelength + 20)
               set rblueskipper 4
               set rblueskip true
              ]
              [
               ifelse rbluesteps = 0 
               [ 
                 left 90
                 set rblueturncounter (rblueturncounter + 1)
                 set rblueskipper (rblueskipper - 1)
                 set rbluelength (rbluelength + 2)
                 if rblueturncounter = 8
                 [
                   set rbluelength (rbluelength - 23 )
                 ]
                 if rblueskip2 = true
                 [
                   set rbluelength (rbluelength + 22)
                   set rblueskip2 false
                 ]
                 if rblueturncounter = 3
                 [
                   set rbluelength (rbluelength + 20) 
                 ]
                 if rblueskip = true
                 [
                   set rblueskip2 true
                 ]
                 set rbluesteps rbluelength
                  
               ] 
               [ 
                 set rbluesteps (rbluesteps - 1) 
               ]
              ]
              ]
              [
                set rbluespiral false
                set rbluecollect true
              ask rblue
              [
                set rbluepatchxl [pxcor] of (patches with [pcolor = yellow] with-min [distance myself] in-radius 2) 
                set rbluepatchyl [pycor] of (patches with [pcolor = yellow] with-min [distance myself]) 
                ;of patches with [pcolor = yellow])
                set rbluepatchx rbluepatchxl
                set rbluepatchy rbluepatchyl
                set rbluedirection heading
                ask patch 0 0
                [
                  ask myself 
                  [
                    if (pxcor != xcor) and (pycor != ycor)
                  [
                    ask patch 0 0
                    [
                  
                    set rbluesaveheading towards myself
                    ]
                    ]
                  ]
                  set rbluesavedistance distance myself
                ]
                ask patch-here
                [
                  set rbluesavestation true
                  set plabel "+"
                ]
              ]
              rblue-collect
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    make rpurple   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rpurple-go                           ;this is the first part of purples searching pattern
              ifelse can-move? 1
              [
                if rpurpledeadendcounter = 0
                [ 
                  set rpurplerecover1 false
                  facexy -50 -50
                ]
                
                if rpurpledeadendcounter = 1
                [ 
                  set rpurplerecover1 false
                  facexy -50 49
                ]
                if rpurpledeadendcounter = 2
                [
                  facexy 50 50
                  set rpurplerecover2 false
                ]
                if rpurpledeadendcounter = 3
                [
                  ifelse pxcor = 23 and pycor = 0
                  [
                    facexy 39 -16
                    set rpurpledeadendcounter (rpurpledeadendcounter + 1)
                  ]
                  [
                    facexy 23 0
                  ]
                ]
                if rpurpledeadendcounter = 4 
                [
                  ifelse (pycor = -16) and (pxcor = 39)
                  
                  [
                    set rpurpledeadendcounter (rpurpledeadendcounter + 1)
                    facexy 0 0
                   
                  ]
                  [
                    facexy 39 -16
                  ]
                ]
                if any? patches with [pcolor = yellow] in-radius 2
                [ set rpurplecollect true
                  set rpurplewalk false
                ]
                  
                
                  
                fd 1
              ]
              [
                set rpurpledeadendcounter (rpurpledeadendcounter + 1)
                set rpurpledeadend true
                set rpurplewalk false
                rpurple-deadend
              ]

              
            end


;------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;
;;    sensed-rocks   ;; :  
;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------

            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rredcollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rred-collect
              ifelse (pcolor = yellow)
              ;it will face a resource until it is on that patch and then pick it up an prepare to return it to base
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set rredreturning true
                set rredcollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
              ;  facexy (first rredpatchx) (first rredpatchy)
               face one-of (patches with [pcolor = yellow] with-min [distance myself]) 
               
                fd 1
              ]
              
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rorangecollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rorange-collect
              ifelse (pcolor = yellow)
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set rorangereturning true
                set rorangecollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
                face one-of (patches with [pcolor = yellow] with-min [distance myself]) 
                fd 1
              ]
              
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    ryellowcollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to ryellow-collect
              ifelse (pcolor = yellow)
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set ryellowreturning true
                set ryellowcollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
                face one-of (patches with [pcolor = yellow] with-min [distance myself]) 
                fd 1
              ]
              
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rgreencollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rgreen-collect
              ifelse (pcolor = yellow)
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set rgreenreturning true
                set rgreencollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
                face one-of (patches with [pcolor = yellow] with-min [distance myself]) 
                fd 1
              ]
              
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rbluecollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rblue-collect
              if rbluecollect = true[
                
              ifelse (pcolor = yellow)
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set rbluereturning true
                set rbluecollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
                face one-of (patches with [pcolor = yellow] with-min [distance myself] in-radius 2) 
                fd 1
              ]
              ]
              
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rpurplecollect   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rpurple-collect                      ;this is when it has sensed a rock and is looking for it
              ifelse (pcolor = yellow)
              [
                ask patch-here
                [
                  set pcolor basecolor
                ]
                set rpurplereturning true
                set rpurplecollect false
                set shape "robot with rock"
                facexy 0 0
              ]
              [
                face one-of (patches with [pcolor = yellow] with-min [distance myself]) 
                fd 1
              ]
              
              
            end

;------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;
;;    returning   ;; :  
;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------

            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rredreturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rredreturn
              
              ifelse (pcolor = green)
              ;it will facce home until it reaches home and then prepare to return
              [
                set shape "robot"
                set rredsavepoint true
                set rredreturning false
                set heading rredsaveheading
                facexy 0 0
                fd distance patch 0 0
               
              ]
              [
                facexy 0 0
                fd 1
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rorangereturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rorangereturn
              ifelse (pcolor = green)
              [
                set shape "robot"
                set rorangesavepoint true
                set rorangereturning false
                set heading rorangesaveheading
                facexy 0 0
                fd distance patch 0 0
              ]
              [
                facexy 0 0
                fd 1
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    ryellowreturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to ryellowreturn
              ifelse (pcolor = green)
              [
                set shape "robot"
                set ryellowsavepoint true
                set ryellowreturning false
                set heading ryellowsaveheading
                facexy 0 0
                fd distance patch 0 0
              ]
              [
                facexy 0 0
                fd 1
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rgreenreturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rgreenreturn
              ifelse (pcolor = green)
              [
                set shape "robot"
                set rgreensavepoint true
                set rgreenreturning false
                set heading rgreensaveheading
                facexy 0 0
                fd distance patch 0 0
              ]
              [
                facexy 0 0
                fd 1
              ]
              
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rbluereturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rbluereturn
              ifelse (pcolor = green)
              [
                set shape "robot"
                set rbluesavepoint true
                set rbluereturning false
                set heading rbluesaveheading
                facexy 0 0
                fd distance patch 0 0
              ]
              [
                facexy 0 0
                fd 1
              ]
              
            end
           
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rpurplereturning  ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rpurple-returning              ;codes for the robot to return to base with a rock
              ifelse (pcolor = green)          ;if the patch it is on is green: do the following
              [
                set shape "robot"              ;sets shape as a plain robot
                set rpurplewalk true          ;truns on the mode for walking
                set rpurplereturning false     ;turns off the mode for returning home

                
              ]
              [
                facexy 0 0
                fd 1                   ;forward 1
              ]
              
            end
        
;------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;
;;    savepoint   ;; :  
;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------

            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rredsave ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rredsave
              ifelse (patch-here = one-of patches with [rredsavestation ]) ;a robot will return to the point where it sensed a resource
              [
                ask patch-here
                [
                  set rredsavestation false
                ]
                set rredsavepoint false
                set heading rreddirection
                set rredspiral true
              ]
              [ 

                  face one-of patches with [rredsavestation = true]
                  ifelse (patch-ahead 1 = one-of patches with [rredsavestation = true])
                  [
                    fd distance (one-of patches with [rredsavestation = true])
                  ]
                  [
                    fd 1
                  ]

              ]
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rorangesave ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rorangesave
              ifelse (patch-here = one-of patches with [rorangesavestation ])
              [
                ask patch-here
                [
                  set rorangesavestation false
                ]
                set rorangesavepoint false
                set heading rorangedirection
                set rorangespiral true
              ]
              [ 

                  face one-of patches with [rorangesavestation = true]
                  ifelse (patch-ahead 1 = one-of patches with [rorangesavestation = true])
                  [
                    fd distance (one-of patches with [rorangesavestation = true])
                  ]
                  [
                    fd 1
                  ]
  
              ]
            end
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    ryellowsave ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to ryellowsave
              ifelse (patch-here = one-of patches with [ryellowsavestation ])
              [
                ask patch-here
                [
                  set ryellowsavestation false
                ]
                set ryellowsavepoint false
                set heading ryellowdirection
                set ryellowspiral true
              ]
              [ 

                  face one-of patches with [ryellowsavestation = true]
                  ifelse (patch-ahead 1 = one-of patches with [ryellowsavestation = true])
                  [
                    fd distance (one-of patches with [ryellowsavestation = true])
                  ]
                  [
                    fd 1
                  ]

              ]
            end;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rgreensave ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rgreensave
              ifelse (patch-here = one-of patches with [rgreensavestation ])
              [
                ask patch-here
                [
                  set rgreensavestation false
                ]
                set rgreensavepoint false
                set heading rgreendirection
                set rgreenspiral true
              ]
              [ 
 
                  face one-of patches with [rgreensavestation = true]
                  ifelse (patch-ahead 1 = one-of patches with [rgreensavestation = true])
                  [
                    fd distance (one-of patches with [rgreensavestation = true])
                  ]
                  [
                    fd 1
                  ]
  
              ]
            end
            
            
            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rbluesave ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rbluesave
              ifelse (patch-here = one-of patches with [rbluesavestation ])
              [
                ask patch-here
                [
                  set rbluesavestation false
                ]
                set rbluesavepoint false
                set heading rbluedirection
                set rbluespiral true
              ]
              [ 
 
                  face one-of patches with [rbluesavestation = true]
                  ifelse (patch-ahead 1 = one-of patches with [rbluesavestation = true])
                  [
                    fd distance (one-of patches with [rbluesavestation = true])
                  ]
                  [
                    fd 1
                  ]

              ]
            end


;------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;
;;    dead-ends   ;; :  
;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------





            ;------------------------------------------------------------------------------------
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;    rpurple dead-end   ;; :  
            ;;;;;;;;;;;;;;;;;;;;;;;;;
            ;------------------------------------------------------------------------------------
            to rpurple-deadend
              ifelse pcolor = green          
              [
                set rpurpledeadend false
                set rpurplewalk true                 ; calls to the section that codes the direction and movement of the purple robot
                if rpurpledeadendcounter = 1      ;starts the if statement with the condition that the deadendcounter is at 1
                [
                  set rpurplerecover1 true 
                ]
                if rpurpledeadendcounter = 2     ;starts the if statement with the condition that the deadendcounter is at 2
                [
                  set heading 0                   ;faces the heading of 0
                  fd 1                          ;moves forward
                  set rpurplerecover2 true     
                ]
                
              ]
              
              [
                facexy 0 0     ;faces the origin and moves
                fd 1
              ]
            end
              
           










;;;;;;;;;;;;
;;;;DFS;;;;;
;;;;;;;;;;;;
;-------------------------------------------------------------------------------------------------
to rpurpleDFS 
  
 
  if count patches with [pcolor = yellow] = 0 [stop]    ;;Put the exit condition first. Stop when no yellow patches (rocks) remain.
 
  ask rpurple[     ;;ask the DFS-robots

   if not can-move? 1[       ;;If the robot can't move, it must've reached a boundary.
     purpledo-DFS
     ifelse not empty? purplerockLocations  ; if theres anythingin out list, turn on the processinglist 
     [set purpleprocessingList? true]
     [set purplereturning? true]                 ;;else go home to reset our search angle.
   ]
      if purpleprocessingList? and not purplereturning? [purpleprocess-list]
      if purplereturning? [purplereturn-to-base]       ;;If returning mode is on, the robots should return-to-base.
      if not purpleprocessingList? and not purplereturning? [purpledo-DFS]
  ]
end

;;;;;;;;;;;;;;;;
;;Process-list;;
;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------
to purpleprocess-list
  

  ifelse not empty? purplerockLocations[    ;if the robots list is not empty....
    if purplelocX = 0 and purplelocY = 0 [   ; if the purplelocx and purplelocy are set to o 
      purplereset-target-coords
    ]
    purplemove-to-location
  ]
  [set purpleprocessingList? false]
  fd 1
  
end

;;;;;;;;;;;;;;;;;;;;;;;
;;reset-target-coords;;
;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------
to purplereset-target-coords
 

  if not empty? purplerockLocations[   ;if the rocklocations list is not empty....
       let loc first purplerockLocations    ;takes the first in the list of locations
       set purplelocX first loc    ;sets robots to the x
       set purplelocY last loc     ;sets the robots to the y
       set purplerockLocations but-first purplerockLocations
  ]
       
end


;;;;;;;;;;;;;;;;;;;;;
;;move-to-locations;;
;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------

to purplemove-to-location
  

  ifelse (pxcor = purplelocX and pycor = purplelocY)[
       set shape "robot with rock"  ;changes the shape of the robot to one of that holding a rock
       ask patch-here[ set pcolor baseColor] ; asks the patch to return to its basecolor
       set purplereturning? true ;turns on the mode returning?
  ]
  [facexy purplelocX purplelocY]
  
 end




;------------------------------------------------------------------------------------
;;;;;;;;;;;     
;;purple;;     
;;;;;;;;;;;
 to purplereturn-to-base
   
 ifelse pxcor = 0 and pycor = 0[     ;if we are the origin, we are at the base
   set shape "robot"
   set purplereturning? false
   set purplelocX 0  ;sets the variable locx of purple as 0
   set purplelocY 0  ;sets the variable locy of purple as 0
   if not purpleprocessingList?[
     set purpleinitialHeading purpleinitialHeading + searchAngle  ;if it does not find anything on the angle, it moves on the the next one. 
     set heading purpleinitialHeading
   ]
 ]
                       
 [ facexy 0 0 ] ;faces origin 
 

 fd 1 ;moves forward 1
 
 end
 
 
 
 
 ;------------------------------------------------------------------------------------------------------------ 
 
;;;;;;;;;;;     
;;;;purple;;;;     
;;;;;;;;;;;

to purpledo-DFS
  ask patch-here[
     if pcolor = yellow[  ;Starts an if statement with the condition of the patch being yellow
      let purplelocation (list pxcor pycor) ;adds the coords of the rock we're on
      ;adds these coords to the front of the their list of rock locations amd removes dupicates
         ask myself[ set purplerockLocations remove-duplicates (fput purplelocation purplerockLocations)] 

     ]
  ]

  fd 1
  
end




























;;KEEP THE FOLLOWING CODE AT THE BOTTOM OF YOUR FILE.
;------------------------------------------------------------------------------------
;::::::::::::::::::::!!!!!!!!!   REQUIRED CODE  !!!!!!!!!::::::::::::::::::::
;------------------------------------------------------------------------------------
 ;;;;;;;;;;;;;;;;;;;;;;;
 ;;   file-config     ;; 
 ;;;;;;;;;;;;;;;;;;;;;;;
 ;------------------------------------------------------------------------------------
;;
 to file-config
  ca ;clear all
  cp ;clear patches
  bitmap:copy-to-pcolors bitmap:import "parkingLot.jpg" true
  reset-ticks ;keep track of simulation runtime
  make-rocks
  make-base
 end
 

;------------------------------------------------------------------------------------
to make-rocks
   ask patches [ set baseColor pcolor]
   
   if distribution = "cross" or distribution = "random + cross" or distribution = "large clusters + cross"
   or distribution = "clusters + cross" or distribution = "random + clusters + cross" 
   or distribution = "random + clusters + large clusters + cross"[make-cross]
   
   if distribution = "random" or distribution = "random + cross" or distribution = "random + clusters"
   or distribution = "random + large clusters" or distribution = "random + clusters + cross" 
   or distribution = "random + clusters + large clusters + cross" or distribution = "random + clusters + large clusters" [make-random]
   
   if distribution = "clusters" or distribution = "clusters + cross" or distribution = "random + clusters"
   or distribution = "clusters + large clusters" or distribution = "random + clusters + cross" 
   or distribution = "random + clusters + large clusters + cross" or distribution = "random + clusters + large clusters" [make-clusters]
   
   if distribution = "large clusters" or distribution = "large clusters + cross"
   or distribution = "random + large clusters"  or distribution = "clusters + large clusters" 
   or distribution = "random + clusters + large clusters + cross" or distribution = "random + clusters + large clusters" [make-large-clusters]
   
end

;------------------------------------------------------------------------------------
;;Place rocks in a cross formation.
to make-cross
  ask patches [           
    ;;Set up the cross by taking the max coordinate value, doubling it, then only setting a rock if the
    ;;x or y coord is evenly divisible by that value. 
    ;;NOTE: This technique assumes a square layout.                  
    let doublemax max-pxcor * 2 
    if pxcor mod doublemax = 0 or pycor mod doublemax = 0 [ set pcolor yellow ]  
    
  ]                   
end

;------------------------------------------------------------------------------------
;;Place rocks randomly.
to make-random
   let targetPatches singleRocks
     while [targetPatches > 0][
       ask one-of patches[
         if pcolor != yellow[
           set pcolor yellow
           set targetPatches targetPatches - 1
         ]
       ]
     ]
end

;------------------------------------------------------------------------------------
;;Place rocks in clusters.
to make-clusters
   let targetClusters clusterRocks
     while [targetClusters > 0][
       ask one-of patches[
         if pcolor != yellow and [pcolor] of neighbors4 != yellow[
           set pcolor yellow
           ask neighbors4[ set pcolor yellow ]
           set targetClusters targetClusters - 1
         ]
       ]
     ]
end

;------------------------------------------------------------------------------------
;;Place rocks in large clusters.
to make-large-clusters
   let targetLargeClusters largeClusterRocks
   while [targetLargeClusters > 0][
     ask one-of patches[
       if pcolor != yellow and [pcolor] of patches in-radius 3 != yellow[
         set pcolor yellow
         ask patches in-radius 3 [set pcolor yellow]
         set targetLargeClusters targetLargeClusters - 1
       ]
     ]
     ]
end

;------------------------------------------------------------------------------------
;Make a base at the origin.
to make-base
  ask patches[
    if distancexy 0 0 = 0 [set pcolor green]
  ]
end
 
@#$#@#$#@
GRAPHICS-WINDOW
235
13
750
549
50
50
5.0
1
10
1
1
1
0
0
0
1
-50
50
-50
50
0
0
1
ticks
5.0

BUTTON
14
10
81
44
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
89
11
207
45
robot-control
robot-control
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
15
60
129
105
rocks remaining
count patches with [pcolor = yellow]
17
1
11

CHOOSER
15
323
232
368
distribution
distribution
"cross" "random" "clusters" "large clusters" "random + cross" "clusters + cross" "clusters + large clusters" "large clusters + cross" "random + clusters" "random + large clusters" "random + clusters + cross" "random + clusters + large clusters + cross" "random + clusters + large clusters"
12

SLIDER
17
199
189
232
singleRocks
singleRocks
0
500
500
1
1
NIL
HORIZONTAL

SLIDER
17
237
189
270
clusterRocks
clusterRocks
0
50
0
5
1
NIL
HORIZONTAL

SLIDER
17
278
189
311
largeClusterRocks
largeClusterRocks
0
20
0
1
1
NIL
HORIZONTAL

BUTTON
21
503
84
536
NIL
pd\n
T
1
T
TURTLE
NIL
NIL
NIL
NIL
1

BUTTON
92
504
155
537
NIL
pu
NIL
1
T
TURTLE
NIL
NIL
NIL
NIL
1

SLIDER
45
383
217
416
searchAngle
searchAngle
0
100
61
1
1
NIL
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

robot
true
1
Polygon -16777216 true false 75 60 105 15 135 15 90 75 75 60
Polygon -16777216 true false 225 60 195 15 165 15 210 75 225 60
Rectangle -16777216 true false 30 105 75 165
Rectangle -16777216 true false 30 210 75 270
Rectangle -16777216 true false 75 120 225 255
Rectangle -16777216 true false 225 210 270 270
Rectangle -16777216 true false 225 105 270 165
Rectangle -16777216 true false 90 120 210 195
Rectangle -2674135 true true 120 120 180 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 120 60 180 90
Rectangle -16777216 true false 135 90 165 120
Polygon -2674135 true true 180 75 210 90 210 105 180 90 180 75
Polygon -2674135 true true 120 75 90 90 90 105 120 90 120 75
Rectangle -7500403 true false 75 105 225 120
Line -2674135 true 90 120 90 240
Line -2674135 true 210 120 210 240
Line -2674135 true 135 90 165 90
Line -16777216 false 75 165 225 165
Line -16777216 false 75 180 225 180
Rectangle -7500403 true false 75 240 225 255

robot with rock
true
1
Rectangle -1184463 true false 120 0 180 45
Polygon -16777216 true false 75 60 105 15 135 15 90 75 75 60
Polygon -16777216 true false 225 60 195 15 165 15 210 75 225 60
Rectangle -16777216 true false 30 105 75 165
Rectangle -16777216 true false 30 210 75 270
Rectangle -16777216 true false 75 120 225 255
Rectangle -16777216 true false 225 210 270 270
Rectangle -16777216 true false 225 105 270 165
Rectangle -16777216 true false 90 120 210 195
Rectangle -2674135 true true 120 120 180 240
Rectangle -16777216 true false 120 60 180 90
Rectangle -16777216 true false 135 90 165 120
Polygon -2674135 true true 180 75 210 90 210 105 180 90 180 75
Polygon -2674135 true true 120 75 90 90 90 105 120 90 120 75
Rectangle -7500403 true false 75 105 225 120
Line -2674135 true 75 240 225 240
Line -2674135 true 90 120 90 240
Line -2674135 true 210 120 210 240
Line -2674135 true 135 90 165 90
Line -16777216 false 75 165 225 165
Line -16777216 false 75 180 225 180
Rectangle -7500403 true false 75 240 225 255

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
