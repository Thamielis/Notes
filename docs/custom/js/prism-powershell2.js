(function (Prism) {

    var powershell = Prism.languages.powershell = {

        

        // Kommentare: line-comments (# ...) und block-comments (<# ... #>)
        'comment': [
            {
                pattern: /(^|[^`])<#[\s\S]*?#>/,  // Block-Kommentar, startet mit <#, endet mit #>
                lookbehind: true,
                greedy: true
            },
            {
                pattern: /(^|[^`])#.*/,          // Einzelzeilen-Kommentar, startet mit #
                lookbehind: true,
                greedy: true
            }
        ],

        // Strings und Here-Strings (greedy, um Inhalte vollständig zu erfassen)
        'string': [
            {
                pattern: /(\@("|')).*\X*(\@(" | '))/,
                alias: 'herestring',
                lookbehind: true,
                greedy: true
            },
            {
                pattern: /@"(?:(?!@")[\s\S])*"@/,  // double-quoted Here-String @" ..."@ (multi-line)
                greedy: true
            },
            {
                pattern: /@'(?:(?!@')[\s\S])*'@/,  // single-quoted Here-String @' ...'@ (multi-line)
                greedy: true
            },
            {
                pattern: /"(?:[^"\r\n]|`.)*"/,     // normaler double-quoted String, ` als Escape
                greedy: true
            },
            {
                pattern: /'(?:[^'\r\n]|'')*'/,     // normaler single-quoted String, '' als Escape
                greedy: true
            }
        ],
        
        // Attribute/Typen: z.B. [Parameter(...)] oder [int] – als class-name getaggt (türkis)
        'class-name': {
            pattern: /\[[A-Za-z_][^\]\r\n]*\]/,  // Inhalt in eckigen Klammern bis zum schließenden ]
            greedy: true
        },

        // Booleans/Konstanten: $true, $false, $null (unabhängig von Groß/Kleinschreibung)
        'boolean': {
            pattern: /\$(?:true|false|null)\b/i,
            greedy: false
        },

        // Variablen: $Name oder mit Prefix $Env:PATH etc. ($ gefolgt von Wortzeichen, optional :Name)
        'variable': {
            pattern: /\$[A-Za-z_]\w*(?::\w+)?\b/,  // erfasst auch $Env:XYZ als ganzes
            greedy: false
        },

        // Funktionen und Cmdlets: eingebaute Cmdlet-Namen und Aliase, sowie generisches Muster Verb-Noun
        'function': [
            {
                // Reguläre Cmdlets (Auszug aus der PowerShell-Befehlsliste, case-insensitive)
                // Hinweis: Diese Liste kann bei Bedarf um weitere Cmdlets ergänzt werden.
                pattern: /\b(?:Get-(?:ChildItem|Content|Command|Module|Process|Service|Variable|WmiObject)|Set-(?:Item|Content|Variable)|New-(?:Item|Object)|Select-Object|Where-Object|ForEach-Object|Start-Process|Start-Sleep|Invoke-(?:WebRequest|RestMethod)|Import-Module|Export-CSV)\b/i
            },
            {
                // Gängige Aliase (Auswahl häufiger Aliasnamen für Cmdlets)
                pattern: /\b(?:ls|dir|cd|gc|cat|type|cp|mv|rm|rmdir|md|echo|write|fl|ft|sort|where)\b/i
            },
            {
                // Generisches Muster: Verb-Noun Format (Groß/Kleinschreibung ignoriert)
                pattern: /\b[A-Za-z]+-[A-Za-z0-9_]+\b/,
                inside: {}  // (kein spezielles inneres Token, gesamte Übereinstimmung = function)
            }
        ],

        // Schlüsselwörter (Keywords):
        'keyword': [
            {
                // Kontrollfluss-Keywords und Error-Handling (lila)
                pattern: /\b(?:if|else|elseif|for|foreach|while|do|until|switch|try|catch|finally|throw|trap|continue|break|return|exit)\b/i,
                alias: 'control'
            },
            {
                // Weitere Keywords (blau) – z.B. Deklarationen, andere Sprachkeywords
                pattern: /\b(?:function|filter|workflow|param|class|enum|module|namespace|using|begin|process|end|in)\b/i
            }
        ],

        // Operatoren: inklusive PowerShell-spezifischer Operatoren (-eq, -not, -and, etc.)
        'operator': [
            {
                // Wort-Operatoren (mit optionalem case-sensitive Prefix c/ i)
                pattern: /-(?:c|i)?(?:eq|ne|lt|gt|le|ge|like|notlike|match|notmatch|contains|notcontains|replace|join|split|isnot|is|as|notin|in|band|bor|bxor|bnot|shl|shr|and|or|xor|not)\b/i
            },
            {
                // Symbol-Operatoren: Zuweisung, arithmetisch, Range, etc.
                pattern: /(?:\.\.|\+=|-=|\*=|\/=|%=|=|<|>|!)/  // .. (Range), +=, -=, *=, /=, %=, =, <, >, !
            }
        ],
        
        'splat': {
            // pattern: /\@(\w+\b)/,
            pattern: /\@/
        },

        // Interpolation/Pipeline: Das `|` Pipeline-Zeichen, Doppelpunkte in Labels oder Drive-Scopes als Punctuation
        'punctuation': /[{}[\];(),.:]/
    };

    // Splatting (z.B. @Args) als eigenes Token definieren, das als Variable gefärbt wird
    Prism.languages.powershell['splatted-variable'] = {
        pattern: /@\w+\b/,
        alias: 'variable'
    };

    // Label-Tokens (Beginn einer Zeile, Doppelpunkt gefolgt von Bezeichner) markieren
    Prism.languages.powershell['label'] = {
        pattern: /(?<=^\s*):[A-Za-z_]\w*\b/m,
        alias: 'symbol'  // als symbol getaggt (kann wie default Text gestylt werden)
    };

}(Prism));
