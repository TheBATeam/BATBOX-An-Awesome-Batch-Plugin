# BATBOX-An-Awesome-Batch-Plugin
This post will provide you with information on the usage of **Batbox** (BATBOX | BY DARKBATCHER) and our experience of using this **batch plugin** in our various batch projects.

![](https://i2.wp.com/www.thebateam.org/wp-content/uploads/2018/12/35-1-2-1.png?w=620&ssl=1)

# FEATURES OF BATBOX
The main feature of this plugin is that it can take **multiple parameters** in a single go. e.g. All the possible parameters it can take, we can execute them in just a single line. And it will execute them without any delay in the execution or printing/calculation. Let’s talk about the Basic usage of the **Batbox Plugin**. 

# HOW TO USE THE BATBOX BATCH PLUGIN?
**BatBox** is an external batch command that allows **graphical user interfaces** (GUI in Batch) and mouse input in the batch programs. It is a great utility that enables the printing of complex output on the **CMD console screen** in the instance of a second.

It allows making batch programs **dynamic** and can move the cursor at any location in just a **few milliseconds**. In simple words, Batbox allows managing the console screen in a program. We’ve also used Batbox in many of our great **batch projects**, just to dynamically manage the Code on the **console window**.

# SYNTAX TO USE BATBOX
There are two types of syntax that Batbox can understand. One is modern syntax and the other one is classical syntax. The modern one is shorter and more efficient than the classical one. So, let’s have a look at both syntaxes.  

## MODERN BATBOX SYNTAX

```
BATBOX [/d Text] [/g X Y] [/c Color] [/m] [/k[_]] [/a Character] [/w Duration] [/f State] [/s File] [/o OffsetX OffsetY] [/h Mode] [/p Mode] ...
```

## TRADITIONAL BATBOX SYNTAX
```
BATBOX [/disp text] [/goto X posY] [/color col] [/mouse] [/key[_]] ...
```
Following is the list of parameters it can take: (as shown above in the syntax)

* /d or /disp: Displays reqpdored text on the console. After printing the required text it doesn’t move the cursor to a new line as the **ECHO** command does. And it also does not displays special characters. It shows simple ASCII text on the console.
```
Batbox /d "This is simple Text"
```
* /g or /goto: Changes the **cursor position** to a required location on the console. Column and line numbers are starting from 0,0 from the top-left corner of the console window.
```
Batbox /g [PosX] [PosY]
```
* /c or /color: This parameter changes the color of the console locally, unlike the COLOR command, which changes the color of console globally. which means, the color of the text printed after this parameter will be changed only. But not for the whole text on the console.
```
Batbox /c 0x[ColorCode]
Batbox /c 0x0A             [For Green colored text on black bg]
```
* /m or /mouse: Gets a user click from the console. It waits for the user to click on the console and outputs the String like [X:Y:Type]. It needs to be used in FOR Loop in order for getting the proper and standard function of the plugin. Let’s see an example below:
```
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /m') DO (
SET _Click=%%C
SET _Y=%%B
SET _X=%%A
)
```
```
Type: has 4 possible values:
 1 : left click
 2 : right click
 3 : left double-click (returns first a left click)
 4 : right double-click (returns first a right-click)
 ```
* /k[_] or /key[_]: Gets a user **keystroke** from the console. It waits for the user keystroke from the keyboard and returns the result in the environment variable **‘%errorlevel%’**. If you use /k_ instead of the simple /k, then the console will not stop but will pass the control to the next code if no key is pressed as ‘‘. i.e. Errorlevel == 0.
```
Batbox /k
```
* /a: Similar to the /d switch or parameter, there we specify the string to print on the console, but here we can specify the ASCII Code of the character to print on the console.
```
Batbox /a 97          [Prints 'a' on the console]
```
* /w: Used for the delay in the program. It stops the program for a specified number of milliseconds.
```
Batbox /w 1000        [Stops console for 1 Sec.]
```
* /f: Allows to change the console’s window mode via a program. i.e. allows the programmer to make cmd fullscreen via the batch programming. we’ve noticed that this parameter is a little buggy in the plugin as it works fine in **Windows XP** and Windows 10 [Tested]. But it doesn’t seem to work in windows 7. So, keep this thing in mind while using it any of your batch programs.
```
Batbox /f [mode]
[Mode can have values either: 1: Full-screen / 2:Windowed]
```
* /s: Plays a wave file. You can simply play music simultaneously using **Multi-threading** tricks, as used by **Honguito98** in many of his Batch Games. but he used fn.dll for that purpose, instead of batbox.exe.
```
Batbox /s [Path of wav file]
```
* /o: Shifts console’s original origin (0,0) from **Top-Left** corner to any other specified point on the console. We’ve used this special **Batbox** switch in many of our **batch projects**. Especially in Plot Function, Typography Function, Box Function 3.0, etc. You can have a look to know its true Potential.
```
Batbox /o [OffsetX] [OffsetY]
```
* /h: **Hides or shows** the console **blinking cursor**. Very useful in **GUI programs**, where you don’t wanna prompt the user to type anything and then **blinking cursor** on the screen seems awkward. So, **Hiding** it is the only option for us.
```
Batbox /h [Mode]
[Mode can have values either: 0:Hidden / 1:Visible]
```
* /p: Changes **CMD windows** mode, similar to /f but different in functioning. This switch allows a programmer to minimize or maximize the console window via **programming**. It can take **multiple mode** values. Take a look at the following table.
```
Batbox /p [Mode]
```
```
[Mode can have following values:]
 0: Hides the window.

 1: Activate and show the window, restoring it to its original size. This value should not be used because it's reserved to the first call to show the window. You should use value 9 instead.

 2: Activate the window and minimizes it (show it in the taskbar).

 3: Activate the window and make it maximized.

 4: Shows the window restored to its original size. Same result as value 1, except that the window does not obtain focus.

 5: Activate the window without modifying it.

 6: Minimizes the window and activate another window.

 7: Minimizes the window. Same result as value 2 except that the window is not activated.

 8: Shows the window without modifying it. Same result as value 1, except that the window does not obtain focus.

 9: Activate the window and set its size and its position to the initial values if the window was either maximized or minimized.

 10: Show the windows and set its size and its position to the default values.

 11: Minimizes the windows, even if the command prompt does not respond. This value is not supposed to be used, as it would be surprising that BatBox continues running even if the command prompt does not respond.
 ```
 [Read Full Article](https://www.thebateam.org/2020/01/batbox-by-darkbatcher/)
