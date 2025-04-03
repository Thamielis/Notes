![Brock Bingham candid headshot](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/Brock_Square.png)

Welcome back to another exciting edition of our “PowerShell Equivalent” blog posts. This series of articles is dedicated to those sysadmins who have been hesitant to transition from CMD to PowerShell. In these articles, we focus on learning the PowerShell equivalents of our favorite CMD commands to make the transition easier on those of us who only accept change while kicking and screaming. Today’s focus, **NSLookup**.

## What is NSLookup?

NSLookup is a popular CMD utility commonly used to troubleshoot DNS issues. Remember, [DNS is basically the phonebook of the internet][1]. Instead of resolving people’s names to phone numbers, DNS resolves a host or domain name to an IP address. IP addresses are how network devices find and connect to one another. With literally billions of people using the internet and company networks, it’s no wonder that a utility that helps us troubleshoot DNS issues is popular.

In its simplest form, NSLookup will take a host or domain name and query the DNS server to return an IP address. Here’s an example.

`nslookup "computer_or_domain_name"`

![DNS server to return an IP address](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/nslookup1.png)

As you can see in this example, I used NSLookup to query the DNS server for the hostname “dwight-schrute,” which returned the A record for that entry with the address 192.168.60.79. This is a very basic example. You can add other parameters to include additional functionality, such as changing the record type queried or switching the DNS server. But, you’re not here to learn about CMD commands; you’re here because you want more power from PowerShell!

![more power image ](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/unnamed_-_2021-03-24T091835.161.png)

## The PowerShell equivalent of NSLookup is Resolve-DnsName

`NAME Resolve-DnsName SYNTAX Resolve-DnsName [-Name] <string> [[-Type] {UNKNOWN | A_AAAA | A | NS | MD | MF | CNAME | SOA | MB | MG | MR | NULL | WKS | PTR | HINFO | MINFO | MX | TXT | RP | AFSDB | X25 | ISDN | RT | AAAA | SRV | DNAME | OPT | DS | RRSIG | NSEC | DNSKEY | DHCID | NSEC3 | NSEC3PARAM | ANY | ALL | WINS}] [-Server <string[]>] [-DnsOnly] [-CacheOnly] [-DnssecOk] [-DnssecCd] [-NoHostsFile] [-LlmnrNetbiosOnly] [-LlmnrFallback] [-LlmnrOnly] [-NetbiosFallback] [-NoIdn] [-NoRecursion] [-QuickTimeout] [-TcpOnly] [<CommonParameters>] ALIASES None REMARKS Get-Help cannot find the Help files for this cmdlet on this computer. It is displaying only partial help. -- To download and install Help files for the module that includes this cmdlet, use Update-Help.`

One of the things I really like about PowerShell is that many of the commands are very descriptive, as is the case with [Resolve-DnsName][2]. Descriptive commands come in handy for those of us who will literally forget a person’s name about .3 seconds after hearing it (guilty).

As you can see from the listed syntax, Resolve-DnsName comes with a lot of options. Once you take into consideration the fact that you can “pipe” or pass the results of Resolve-DnsName into other PowerShell [cmdlets][3], the possibilities of what you can do are endless.

Let’s take a look at a few PowerShell examples using the Resolve-DnsName cmdlet so we can break down how it works and some of its useful features.

## Resolve-DnsName example 1

`Resolve-DnsName -Name "computer"`

![add the -Name parameter to the Resolve-DnsName](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/unnamed_-_2021-03-24T160739.358.png)

This first example is the bare-bones command. Just add the **\-Name** parameter to the **Resolve-DnsName** cmdlet and pass it a computer name. It will search the locally assigned DNS server for a record with the matching computer name and return the record information.Technically, you don’t even have to include the -Name parameter. The command will still work without it. I like to include it to build good PowerShell habits.

![Resolve-DnsName ](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/nslookup3.png)

## Resolve-DnsName example 2

`$ip = Resolve-DnsName -Name www.google.com -Server 1.1.1.1 -Type A $ip | Select IPAddress | Test-Connection`

![Resolve-DnsName Example](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/nslookup4__1_.png)

We kick things up a notch with this example. For this one, we are querying a specific DNS server, **1.1.1.1**, and only looking for the **A** record for **www.google.com**. Next, we assign the returned information to the custom variable **$ip**. Lastly, we call the variable **$ip**, selecting just the IPAddress property of the variable, and run the [Test-Connection][4] cmdlet against it.

## Resolve-DnsName example 3

`$computers = Get-ADComputer -Filter * -SearchBase "OU Path" | Select-Object -ExpandProperty Name foreach ($workstation in $computers){ Resolve-DnsName -Name $workstation -Type A }`

![Resolve-DnsName Example 3](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/unnamed_-_2021-03-24T165745.645.png)

This PowerShell script runs the **Resolve-DnsName** cmdlet against each computer in a specified OU. We use the cmdlet **Get-ADComputer** to retrieve all of the computers from a specific OU. Make sure to replace **OU Path** with the actual path to the OU you want to run this against. We then use the [Select-Object][5] **-ExpandProperty Name** command to retrieve only the computer names, and we are assigning them to the custom variable **$computers**. Next, we use a **foreach** loop to run the **ResolveDnsName** command against every computer name assigned to the **$computers** variable, using **$workstation** as a placeholder variable in the **foreach** loop. You can see the result in the screenshot above.

## Wrapping up

Hopefully, this article helps your transition from CMD to PowerShell. I always like to mention that almost every CMD command and utility still functions in PowerShell. You can launch PowerShell right now and use NSLookup. However, I can’t guarantee that these commands won’t be deprecated at some point in the future, and you’ll lose functionality with the old commands.

While PowerShell may look intimidating at first, once you’ve played around with it enough, it starts to all make sense. If you have a decent enough memory, you’ll soon begin whipping out cmdlets and their parameters like it’s second nature. If you don’t have a decent memory, you’ll google-fu your way through just as I do! Once you’ve got the basics down, the hardest part of PowerShell becomes creatively figuring out ways to use it to make your life easier.

If you’re looking for other ways to make your life easier, you should check out [PDQ Deploy][6] and [PDQ Inventory][7]. Our whole goal at PDQ.com is to make your life easier and to make you look good while doing it. Deploy packages across your network and manage your inventory effortlessly with PDQ Deploy and PDQ Inventory. Our products will even help you automate everything from deployments to reports. Check it out for free with our [14-day trial][8].

Oh, and remember, it’s not DNS… it was DNS.

![Brock Bingham candid headshot](What%20is%20the%20PowerShell%20equivalent%20of%20NSLookup%20%20PDQ/Brock_Square.png)

[Brock Bingham][9]

Born in the '80s and raised by his NES, Brock quickly fell in love with everything tech. With over 15 years of IT experience, Brock now enjoys the life of luxury as a renowned tech blogger and receiver of many Dundie Awards. In his free time, Brock enjoys adventuring with his wife, kids, and dogs, while dreaming of retirement.

[1]: https://www.pdq.com/blog/the-what-why-and-how-of-dns/
[2]: https://www.pdq.com/powershell/resolve-dnsname/
[3]: https://www.pdq.com/powershell/
[4]: https://www.pdq.com/powershell/test-connection/
[5]: https://www.pdq.com/powershell/select-object/
[6]: https://www.pdq.com/pdq-deploy/
[7]: https://www.pdq.com/pdq-inventory/
[8]: https://www.pdq.com/trial/deploy-inventory/
[9]: https://www.linkedin.com/in/jonathanbrockbingham/