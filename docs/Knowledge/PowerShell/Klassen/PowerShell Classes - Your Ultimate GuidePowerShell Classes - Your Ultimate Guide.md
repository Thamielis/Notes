---
created: 2024-09-09T14:43:28 (UTC +02:00)
tags: []
source: https://petri.com/
author: 
---

# PowerShell Classes - Your Ultimate Guide - Petri IT Knowledgebase

---
PowerShell 5.0 introduced the concept of being able to create classes directly from within PowerShell. Prior to version 5.0, you needed to define a class in C# and compile it, or use some pretty complicated PowerShell to create one.

For PowerShell scripters without a programming background, you may be wondering what all the fuss around classes is about.  You may also be thinking, “so what?” You may feel intimidated on getting started with classes.  This article intends to take the fear out of using classes in your PowerShell programming.

## **What Is a PowerShell Class, Exactly?**

Wikipedia states, “[In object-oriented programming, a class is an extensible program-code-template for creating objects, providing initial values for state (member variables), and implementation of behavior (member functions of methods)](https://en.wikipedia.org/wiki/Class_(computer_programming)).” Huh? Well, wait a second.  First, a **class** is a template for creating **objects**. You have been using PowerShell to create and manipulate objects all along. Next, the class template provides initial values for its **members**. PowerShell objects have members too, properties and methods, and you can provide values for the properties. Lastly, the class implements behavior via **methods**. So does PowerShell!

## **You Have Been Using Classes All Along**

Take a moment to reflect on what happens when a PowerShell cmdlet runs. For example, when the get-service command runs, it returns an object. By running get-service and then piping it to get-member, we find out that the output of get-service is an object of type System.ServiceProcess.ServiceController. A quick MSDN lookup reveals that [ServiceController](https://msdn.microsoft.com/en-us/library/system.serviceprocess.servicecontroller(v=vs.110).aspx) is a .Net class. Likewise, for many PowerShell cmdlets, they return an instance of a class.

## **Functions, Classes, What Is the Difference?**

Microsoft invented PowerShell for Windows administrators to simplify and automate administrative tasks. Its intent was to be user-friendly for everyone, regardless of previous programming experience. In addition, it simplifies the transition from using the GUI to using code with its easy-to-read language. However, PowerShell classes appeal to programmers who already have experience using classes in other languages. That is, Microsoft is expanding the intended audience of developers to admins. For the admins already using PowerShell, classes can ease them from “scripter/admin” to “developer” by investigating and understanding the similarities between the two.

## **How Do I Start Building a Class?**

I am going to start building a sample class called “Rock”. Think of an item you find in your yard or on the street. Where to start? Remember writing your first function? You simply used the Function {} keyword and then built the function from there. Building a class just uses a different keyword, the Class {} keyword.

## **Adding Properties to your Class**

 ![Rocks](https://petri.com/wp-content/uploads/petri-imported-images/Rocks.jpg)

I do not know much about rocks, so I first started contemplating the properties of rocks. Rocks can be different colors, shapes, and sizes. Beyond that, I used my google-fu to find out more about the [properties of rocks](https://www.reference.com/science/five-properties-rocks-b95d53ee9301702c). I included color, luster, shape, texture, and pattern from the linked reference. I also added size and location as more information I would like to have on an instance of a rock. I am going to use strings for the type of each of these properties except for the location property. I am defining the location property as an integer, distance from the person holding the rock, perhaps.

```powershell
class Rock {
  [string]$Color  
  [string]$Luster  
  [string]$Shape  
  [string]$Texture  
  [string]$Pattern  
  [string]$Size  
  [int]$Location  
}
```

## **Class Properties — Similar to Function Parameters**

For a programming comparison, maybe you are creating a SMBShare class. You do not need to Google or Bing to know that a SMBShare has a name, a path, and permissions. If you were creating a function to manipulate an SMBShare object, these would be the parameters you would define. Thus, **properties** of a class loosely translate to **parameters** of a function.

## **Big Words, Coming Up!**

Programming books like to use big words to talk about how to create a class. The first word you will see often is **instantiation** but let’s break this word down. Instantiation is the noun form of the verb “instantiate,” which means “to create an instance of.” You can even see the root word “instance” in both instantiate and instantiation. To instantiate an object of the rock class, I am merely creating an instance of a rock.

## **Creating the Instance of the Object**

It is time to instantiate a Rock object. To do so, I need to introduce the second big word, **constructor**. A constructor is a “[special type of subroutine that is called to create an object](https://en.wikipedia.org/wiki/Constructor_(object-oriented_programming)).” The constructor is named the same as the class. You use the new() operator to create (or instantiate!) a new rock object. Programmatically, it looks like this:

```powershell
$rock = [rock]::New()
```

I am creating a new object of the \[rock\] class and storing it in the variable $Rock. From there, I can display the contents of $Rock or pipe $Rock to get-member to check out its type, properties, and methods.  ![Classes1](https://petri.com/wp-content/uploads/petri-imported-images/Classes1.png)

 ![Classes2](https://petri.com/wp-content/uploads/petri-imported-images/Classes2.png)

## **Overcoming Your Fear of Using Classes**

I have not written any code, yet. So far, I have just designed what my Rock class should look like, what its properties are, and created a new instance of a Rock using the constructor. Now that I have $Rock, I assign values to each of the properties just like I would in any ordinary PowerShell function.  ![Classes3](https://petri.com/wp-content/uploads/petri-imported-images/Classes3.png) There are not any new, special words to describe this action. I am simply assigning values to the properties as I would in creating an SMBShare or gathering information using WMI and creating a custom object with the properties I want. And although I introduced a couple of new programming concepts, there are not a ton of differences between creating a Rock from a class definition and creating a custom object.  I hope you will challenge yourself and give it a try.

I am going to expand on the “Rock” class by defining allowed values for a few properties using an enumerated type or simply called an enum.

## **Revisiting the Rock Class**

To recap, the Rock class definition contained 7 properties: Color, Luster, Shape, Texture, Pattern, Size, and Location. The first 6 properties were String properties and Location was an integer or a distance between some arbitrary point and the rock itself.

```powershell
class Rock {  
\[string\]$Color  
\[string\]$Luster  
\[string\]$Shape  
\[string\]$Texture  
\[string\]$Pattern  
\[string\]$Size  
\[int\]$Location  
}
```

In addition, I also used the New() constructor to create an instance of the rock and once I had an instance of the rock defined ($Rock), I could assign properties to it.

```powershell
$Rock = \[rock\]::New()  
$Rock.Color = Silver  
$Rock.Size = HUGE
```

## **Limiting Allowed Values using an Enum**

Using string types for the rock properties will allow for an endless combination of possible property values. For example, I could define an instance of a rock’s size to be “HUGE” (as in the example above) or I could define it to be “VeryVeryLarge”. Conversely, I could define it as “teeny-tiny” or crumb-sized”. In this case, I want to limit the possible values for size to be only sizes that I have defined, like the shirt sizes of small, medium, and large. In order to accomplish this, I can use an enumerated type (also known as an enum) or [a set of named values](https://en.wikipedia.org/wiki/Enumerated_type) to define those possible values. Notice that the phrase is “enumerated type”. I am defining a custom type named “Size”.

```powershell
enum Size {  
Small  
Medium  
Large  
}
```

## **Code Placement for Enums**

When writing the code, place the enum definition outside the class definition or in its own file. I placed this Size enum in a file named C:PowerShellSizeEnum.ps1. That way, I can dot-source the enum. Why would I want to do this? If I place the enum in its own file, I can dot-source it for any class or function. That is right, enums are not just for PowerShell classes. I can use it to define custom types for functions as well, as shown in the function below.

```powershell
function CasinoWinnings {  
param (  
\[int\]$Amt  
)

. ‘C:\\PowerShell\\SizeEnum.ps1’

if ($Amt -lt 500) {  
$Result = \[size\]::Small  
}  
elseif (($Amt -ge 500) -and ($Amt -lt 1000)) {  
$Result = \[size\]::Medium  
}  
else {  
$Result = \[size\]::Large  
}  
Write-Output $Result  
}
```

## **PowerShell Death Match: Enums vs. ValidateSet**

ValidateSet is an incredibly useful parameter validation attribute used in advanced functions to limit the possible input values for a given parameter. In comparison to an enum, ValidateSet does not define a custom type. It only limits the possible values of a parameter. As a result, the benefit of using ValidateSet is being able to use the methods of the defined parameter type. For example, a string type with a ValidateSet allows me to manipulate the string values using string methods. However, the downside of ValidateSet is that the set must be redefined each time you want to use it.

## **One Reason to Use ValidateSet**

Consider the following function: it contains a parameter named Size and uses ValidateSet. However, notice that the parameter type is still \[string\]. In this simple example, I am taking the Size parameter and returning the 1<sup>st</sup> character as output.

```powershell
function CasinoTaxes {  
param (  
\[parameter(Mandatory=$True)\]  
\[ValidateSet(“Small”,”Medium”,”Large”)\]  
\[string\]$TaxSize  
)

Write-Output $Size\[0\]  
}
```

 ![ClassesPt2 1](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt2_1.png)

This same function would not work using the Size enum:

```powershell
function CasinoTaxes {  
param (  
\[parameter(Mandatory=$True)\]  
\[size\]$CurrentTaxSize  
)

Write-Output $CurrentTaxSize\[0\]  
}
```

 ![ClassesPt2 2](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt2_2.png)

## **Enums Make Sense for Custom Types**

ValidateSet makes sense in the situation seen above when the methods of the underlying type need to be accessed. If you are going to do string manipulation on the values, it makes sense to keep the parameters as strings.

I prefer ValidateSet for functions. This, along with all the other Validate\* parameter attributes, is listed in the PowerShell help under about\_Functions\_advanced\_parameters. The about\_Classes help file, however, specifically states that the PowerShell language is adding support for classes and other user-defined types.

This is the key here and the reason why I would choose an enum over a ValidateSet. This is the best route if I want the property or parameter to be of a custom type and limited to specific values.

## **Enums and Reuse**

In conclusion, reuse enumerated types whenever possible to simplify the code and parameter declarations. Since the enum is valid for the life of the session, classes or functions that go together and make use of the same or similar parameters can all use the same enum definition. This is the case whether it be at the beginning of the class module, in a module that contains functions, or in its own file and dot-sourced into the module containing the code. Lastly, simplify the code using an enum rather than having to declare multiple validateSets.

## **Instantiate the Rock**

No, not “[The Rock](https://en.wikipedia.org/wiki/Dwayne_Johnson)”.  First, I am going to instantiate or create an instance of a rock using the Rock class definition above. Then, I will assign some properties to the rock.

 ![ClassesPt3 1](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_1.png)

## **Rock Class Methods**

Next, I am going to define some methods for the class. A method is an action that is performed on an object. I asked myself, “What can I do to a rock? Or what can I do with a rock?” And the answers that came to mind are “ThrowRock” and “SmashRock”. I am going to define methods that accomplish these two actions. I am also going to define a method called “ShowRockLocation”. I will use the Location property, which is an integer value, to graphically show how “far” the rock is away from a fixed point. (In this case, it is the cursor location on the screen.) When I call the “ThrowRock” method, I will be able to visually show how far I threw the rock.

## **Defining the Method**

A class method is just as easy to define as a PowerShell function. However, there is one big difference. I need figure out if the method is going to return a value and specify the returned value’s type on the method definition. If a method is not going to return a value, the return value type is \[void\]. Starting out with the “ShowRockLocation” method, the method definition looks like this:

```powershell
\[void\]ShowRockLocation () {  
}
```

From there I am simply using PowerShell to add the code that will graphically show me a location:

```powershell
\[void\]ShowRockLocation () {  
$Filler = ‘ ‘  
for ($i=0;$i -lt $This.Location;$i++) {  
$filler += ‘ ‘  
}  
write-host “$($Filler)\*”  
}
```

Notice that in the “for” loop, I am using the variable $This. When I call the ShowRockLocation method, I will be calling it for the instance of rock that I created earlier ($Rock). $This is a special variable that means, “This instance of the Rock class”. To show the location, I am going to add white space (Filler) for each unit of the location property of the rock, then graphically show the rock with an asterisk.

## **Invoking the ShowRockLocation Method**

To invoke the ShowRockLocation method, I take my instance of Rock ($Rock) and call the ShowRockLocation method as shown below. I see the asterisk depicting the location of the rock.

 ![ClassesPt3 2](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_2.png)

## **Creating and Invoking a Method with an Argument**

Next, I would like to create the ThrowRock method. ThrowRock is going to take an argument, such as the distance in which to throw the rock, using an integer type. The variable $arg represents the distance.

```powershell
\[void\]ThrowRock (\[int\]$arg) {

$This.Location += $arg

}
```

After defining the method, I invoke ThrowRock using the same call as ShowRockLocation, but I provide the argument for the distance. Next, I call ShowRockLocation to see that the location has changed, and indeed, the asterisk has moved, presumably 28 spaces.

 ![ClassesPt3 3](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_3.png)

## **Method and Enums**

Lastly, I am going to create the SmashRock method. Looking back at the class definition, I used an enum definition for the Size property, specifically so I could limit the values of Size to the sizes I want for this method. If the SmashRock method is called upon an instance of a rock that is Large, the method will change it to Medium. If I call SmashRock on a Medium rock, it will change to Small. If I call SmashRock on a Small rock, I will simply write a message to the screen saying the rock is already small.

```powershell
\[void\]SmashRock () {  
if ($This.Size -eq “Large”) {  
$This.Size = “Medium”  
}  
elseif ($This.Size -eq “Medium”) {  
$This.Size = “Small”  
}  
else {  
write-host “The rock size is already too small to smash.”  
}  
}

$rock = \[rock\]::New()  
$Rock.Color = “Red”  
$Rock.Location = 28  
$Rock.Size = “Large”  
$Rock.Luster = “Waxy”
```

 ![ClassesPt3 4](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_4.png)

##  **One Last Word on the Enum**

Finally, notice that I would not have been able to write the SmashRock method without using either an Enum or a ValidateSet. In that case, there would be no way to account for the infinite variations of a string value for Size. If I had chosen to use a string and then decided to write this method, I could always go back and redefine the Size property to use an enum instead of a string value.

## **Method Recap**

To conclude, methods perform an action against an instance of a class object. It accepts one or more arguments and can return a value as output. Methods perform an action against the current instance of the object using the $This variable. Finally, it is similar to the PowerShell function, in that a function takes certain input (parameters) and can return output but a function does not require an instance of a class nor an object to be called.

Now that you’re familiar with PowerShell classes, as well as its programming concepts and terminology, it is time to show you some other benefits to using PowerShell classes. In this article, I’m going to talk about constructors and how you can use different constructors to create instances of classes with different members. I’m also going to introduce another new concept for classes called inheritance, along with showing some practical examples.

## Default Constructors

In the previous articles, I have already shown how to use the default constructor to create an instance of a class. But what does “constructor” mean? A constructor is a method named the same name as the class. If no constructors are specified within the class, it automatically gets a default constructor with no parameters that I can use to create an instance of a class, like seen in the previous article.

For example, I created an instance of a Rock by using the following:

 ![classesPt4 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_1.png)

This creates an instance of a Rock. I am using the default constructor because I have not yet defined any constructors in my class. The instantiation occurs when I call the new() method with no parameters and I will get an instance of a rock with unassigned or default properties.

 ![classesPt4 2](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_2.png)

## Overloading constructors

I can create an overload for the constructor. The overload allows me to set default values for properties right in the new method itself. This spares me one or more lines of code in assigning properties later. If I want to continue using the constructor with no parameters also, I need to explicitly define it in the class.

```powershell
Rock(){}
```

In the next example, I am creating an overload for a constructor of the Rock class that has one parameter, Size.

```powershell
Rock(\[size\]$Size){  
$this.Size = $size  
}
```

What exactly does this mean? It means that if I instantiate a class of Rock with one parameter, that one parameter must be the Size parameter than it must be of type Size. A successful instantiation looks like this:

 ![classesPt4 3](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_3.png)  
What happens if I try to give it a different parameter, maybe a color instead? When I do that, I receive an error saying that the string is not contained in the enum “Size”. This is also another good argument for using enums! If I had used a string type for Size, “Red” would have been acceptable.

 ![classesPt4 4](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_4.png)

## **Adding Additional Overloads**

Conversely, what happens if I wanted to assign both Size and Color? With the current constructors I have defined, I would also receive an error trying to create this instance. Notice that it is an error about the overload itself. In this case, it is looking for an overload that accepts two arguments. However, I have not created one that accepts two arguments yet.  ![classesPt4 5](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20272'%3E%3C/svg%3E) Here is the constructor for a Rock class that accepts two arguments:

```powershell
Rock(\[size\]$Size,\[string\]$Color){  
$This.Size = $Size  
$This.Color = $Color  
}
```

Now, I can create instances of Rocks with zero, one, or two parameters:

 ![classesPt4 6](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20297'%3E%3C/svg%3E)  
However, for the 2-parameter overload, the parameters must be defined in that exact order – size first, then color. By reversing them, PowerShell will attempt to assign “Red” to Size and I receive the same error that I received in one of the previous examples.

 ![classesPt4 7](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20346'%3E%3C/svg%3E)

## What Is Inheritance?

Classes in PowerShell, just like in other object-oriented programming languages, can be hierarchical. This means that I can build a subclass from a parent class and allow the subclass to inherit the properties and members from the parent class. For example, if I had a parent class named “ConstructionMaterials”, that class would contain some properties, likely some of the same properties of the Rock class.

A rock is a specific type of construction material, so it inherits the properties from the ConstructionMaterials class. It can also have its own properties. Likewise, I could create other subclasses from ConstructionMaterials, like Brick and Wood. In the following example, I have taken the Rock class and created a ConstructionMaterials class, minimizing the properties.

```powershell
enum Size {

Small

Medium

Large

}

class ConstructionMaterial {

    \[string\]$Color

    \[string\]$Shape

    \[Size\]$Size

    \[int\]$Location

    \[void\]ShowLocation () {

         $Filler \= ‘ ‘

         for ($i\=0;$i \-lt $This.Location;$i++) {

              $filler += ‘ ‘

              }

         write-host “$($Filler)\*”

         }

    \[void\]ThrowIt(\[int\]$arg) {

         $This.Location += $arg

         }

    \[void\]SmashIt () {

         if ($This.Size \-eq “Large”) {

              $This.Size \= “Medium”

         }

         elseif ($This.Size \-eq “Medium”) {

              $This.Size \= “Small”

              }

         }

   }
```

Then, I will create a Rock class that is a subclass of ConstructionMaterial using the syntax:

<em>class</em> subclassName : baseClassName{}

Lastly, I will verify that the Rock class is a subclass of ConstructionMaterial.

 ![classesPt4 8](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20462'%3E%3C/svg%3E)

## Adding Additional Properties to a Subclass

Perhaps, I want the Rock subclass to also have the Luster, Texture, and Pattern properties that I defined in the original rock class. In order to accomplish that, we need to load the enum for the values for Luster into memory by either dot-sourcing it or adding it directly to the class file. Next, we create a new Rock class that contains the additional properties.

```powershell
class Rock : ConstructionMaterial{  
\[string\]$Texture  
\[string\]$Pattern  
\[Luster\]$Luster  
}
```

If I create an instance of a Rock, it contains the properties of the base class (Color, Shape, Size, and Location). In addition, it also contains the Rock-specific properties (Texture, Luster, and Pattern.)

 ![classesPt4 9 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_9-1.png)

## Practice Makes Perfect (Sense)

I have shown how to use the default constructor to create an instance of a class without defining anything specifically in the class itself. I have also shown adding constructor overloads to explicitly define values within the instance of the class. In addition, I have talked about inheritance and how to create base classes and subclasses.

Now, it’s your turn. Look for ways you can incorporate classes into your everyday programming. Or, perhaps you might want to just play around with building a class for fun and to continue building your knowledge. Either way, it’s a great way to become familiar with the programming concepts of classes, which will bleed over into other object-oriented languages as well.

## **Revisiting the Class Definition for ConstructionMaterial**

As a quick recap, the ConstructionMaterial class has 4 properties: Color, Shape, Size, and Location. Size’s data type is an enum that can only be of the values Small, Medium, or Large. For this example, I am not defining any specific constructors. My example object of type ConstructionMaterial is named $ClassObj.

```powershell
enum Size {

Small

Medium

Large

}

class ConstructionMaterial {

\[string\]$Color

\[string\]$Shape

\[Size\]$Size

\[int\]$Location

}
```

 ![classesPt5 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_1.png)

## **Using a Hash Table to Define Custom Object Properties**

To compare an instance of a class object with a custom object, I am going to start off by building the custom object new-object and a type of psobject, defining the desired properties in a hash table.

```powershell
$props \= @{

Color \= “Red”

Shape \= “Round”

Size \= “Large”

Location \= 4

}

$Obj \= New-Object \-TypeName psobject \-Property $Props
```

 ![classesPt5 2](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20407'%3E%3C/svg%3E)

Notice that in this code, I define the structure of the custom object as having the 4 properties Color, Shape, Size, and Location but I am also creating the object itself ($obj). Using new-object creates and instantiates the object all at once. I am not creating the structure of an object and instantiating it later.

By using the $props hash table, I can use $props to define additional objects that have the same structure as $obj. The difference between defining the custom object using new-object and using the class is that the class requires a two-step process (defining the class and instantiating it) and using new-object is a single step.

## **Defining Custom Object Properties Using Add-Member**

If I just create the custom object with no properties instead of using the hash table, I am still only halfway there because I have an object with no properties. Using add-member after the instantiation, I still need to provide not only the property names but a value for each of the properties. However, if I create a second custom object, there is no guarantee that it will have the same properties as the first object because it is truly a custom object with no defined structure. The properties of any custom object can be whatever I define them to be. For example, below I create a custom object $obj with my desired properties for an object that defines ConstructionMaterial.

$Obj | Add-Member -MemberType NoteProperty Color -Value “Red” $Obj | Add-Member -MemberType NoteProperty Shape -Value “Square” $Obj | Add-Member -MemberType NoteProperty Size -Value “Large” $Obj | Add-Member -MemberType NoteProperty Location -Value “4”

Now I define a second custom object and this object only has one property. Rather than using the property Size, I have defined the property Bigness, which is also equal to large. Although $obj and $CM are both custom objects, only one of them has the structure that I want for construction material.

 ![classesPt5 3](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201280%20480'%3E%3C/svg%3E)

## **A Second Look at the ThrowIt Method**

In the ConstructionMaterial class, I have defined a method named ThrowIt() that increases the value of Location by an amount specified by an integer input argument. Because this is a method of the ConstructionMaterial class, I do not need to pass in the $ClassObj object. Instead, I manipulate the object and its properties through $This.

\[void\]ThrowIt(\[int\]$arg) {

$This.Location += $arg

}

## **Writing ThrowIt as a Function**

You have seen above that when I defined the $CM custom object, 4 methods existed – Equals, GetHashCode, GetType, and ToString, but no ThrowIt method. I will not be able to use a ThrowIt method but I can define a ThrowIt function. I start off with the ThrowIt function declaration and an input parameter $arg, of type int, which will be the distance to throw, just like in the ThrowIt() method. But wait a second… I do not have the original object! I need to either have the object itself passed in or the object’s Location property passed in to know what the initial value of the location was. I am going to pass in the entire custom object.

function ThrowIt {

    param(

    \[psobject\]$InitialObj,

    \[int\]$arg

    )

$Result \= $Initialobj.Location + $arg

Write-Output $Result

}

Then, I call the ThrowIt function, passing in $obj (the whole object) as $InitialObj and I am going to increase the location by 8. I expect that $obj.location is now 12 but as I see from the results below, the function returned 48.  Why? Well, the function did not know to treat $InitialObj.Location as an integer and instead, it treated the 4 as a string and concatenated 8 to it.

   ![classesPt5 4](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_4.png)

To correct this, I need to strongly type $Initialobj.location as an integer in the function.

$Result = \[int\]$Initialobj.Location + $arg

## **ThrowIt and the $CM Custom Object**

Next, I am going to take my $CM custom object and try to use it as input to ThrowIt. Remember, that $CM currently only has one property, Bigness. What do you expect will happen? Well first, what I expect is that I will get an error trying to set $CM.location equal to the result output by ThrowIt because there is no Location property for the $CM object.

 ![classesPt5 5](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_5.png)

I need to define a location property for this custom object. Let’s say, that I define $CM.Location to be a string with a value of Wrong instead of an integer. Because $CM is a psobject, the value Wrong is perfectly acceptable for that property but what will happen when we try to call the ThrowIt function? My next expectation is that ThrowIt will throw an error saying it cannot convert Wrong to an integer.

 ![classesPt5 6](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_6.png)  
 ![classesPt5 7](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_7.png)

## **There Is No “Better” Approach**

My intent of these examples is not to determine if one approach is right versus the other being wrong but rather, to point out the differences between the two. Custom objects are fantastic for assembling one-time, unique information together in one object and certainly, there are uses for it.

The Get-WMIobject or get-CimInstance cmdlets gather tons of custom information about a machine that can then be sliced and diced into one-time custom objects for additional processing or reporting. The key is custom.

If you are truly defining something custom, this implies it is without a defined structure in place. Classes provide structure and that structure is beneficial for defining the methods that can be applied to that rigid structure. Either approach will work but in my opinion, classes are for rigid structures and custom objects are for fluid structures.
