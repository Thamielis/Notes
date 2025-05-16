 

I have had problems in my very long scripts with Write-Progress. When writing the script you add in several Write-Progress statements and give them a percentage, the problem is that the percentage you give it is likely a number that you are typing in and hard coding. This is a problem because if you add to the code or move the code around you have to go back and change every one of these items.

In a recent script I wrote that was just over 300 lines I had to repeat this process 5 times which was really frustrating, so I thought up a way to make sure I don’t have to do it again.

Now, I should state beforehand that this process only works if each write-progress is executed once and only once. Any changes to that means you may need to add some other intelligence, but in general I think this is a good starting point.

The first thing you want to do is read the script file that you are executing to get a count of the number of lines with a “Write-Progress” in them. Then store a tracking number as a global variable so that all functions can see it. Do this at the start of the script.

Here is my single line to do all of the above:

$ProgressIndicators \= $($Global:I\=0; $(GC $MyInvocation.InvocationName | ? {[$\_][1] \-Match "Write-Progress"}).count \-1)

So, there is a whole lot of learning packed into a small area here. Let me cover the confusing sections. First naming a variable `$Global:I` will create a global variable called “I” that is accessible from all PowerShell scopes. As well, there is a “;” after this portion to execute this as a separate line of code. Since there is no output, this will not become part of the variable when run like this. For more information on scopes visit [http://technet.microsoft.com/en-us/library/dd315289.aspx][2].

The command `GC` is a built-in alias for `Get-Content`.

The object property “`$MyInvocation.InvocationName` will provide the file path of the script that is currently being executed. So, in effect, we are reading the entire script that is currently running.

Then we pipe the script contents to `?` which is a built-in alias for `Where-Object`. Then we look for a match on “Write-Progress”. You’ll notice that this whole section is surrounded in `$()` which “Instantiates” a variable for this this output. Then we can find the number of lines with the .count property. After that, I subtract 1 so it doesn’t count itself.

All of this means that the variable `$ProgressIndicators` will now contain the number of times “Write-Progress” appears in the script, no matter what script you place it in.

So now all we need is for `Write-Progress` to read these two values when it run and increment our global tracking variable.

Write-Progress \-Activity "Making Progress" \-Status "Test 1" \-PercentComplete $($($Global:I++;$Global:I) / $ProgressIndicators \* 100)  
Sleep 1  
Write-Progress \-Activity "Making Progress" \-Status "Test 2" \-PercentComplete $($($Global:I++;$Global:I) / $ProgressIndicators \* 100)  
Sleep 1  
Write-Progress \-Activity "Making Progress" \-Status "Test 3" \-PercentComplete $($($Global:I++;$Global:I) / $ProgressIndicators \* 100)  
Sleep 1

So, as you can see I use the same techniques described above to increment the variable and then do some basic match to get a percentage of total progress.

You can throw this code into any script to give you a dynamically updating progress indicator. There are two things to keep in mind. If you have a loop that runs a `write-progress` command over and over then it will continue to increment and break this. You could remove the `$Global:I++` portion or make a sub progress bar to correctly display the progress of the loop. Also, you might skip a `write-progress` line due to an `IF` statement. If so maybe you could increment the value of `$Global:I` in an `ELSE` statement.

[1]: about:blank
[2]: http://technet.microsoft.com/en-us/library/dd315289.aspx