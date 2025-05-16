`Add-Type` `-AssemblyName` `System.Net.Http`

`Add-Type` `-AssemblyName` `System.IO`

`$filePath` `=` `'D:\monalisa.jpg'`

`$FaceAPIkey` `=` `"Here Provide your API key"`

`$APILocation` `=` `"westus"`

`$client` `=` `New-Object` `-TypeName` `System.Net.Http.Httpclient`

`$client``.DefaultRequestHeaders.Add(``"Ocp-Apim-Subscription-Key"``,` `"$FaceAPIkey"``)`

`$returnFaceID` `=` `"true"`

`$returnFaceLandmarks``=` `"false"`

`$FaceAttributes` `=` `"age,gender,smile,facialHair,glasses,emotion"`

`$queryString` `=` `"returnFaceId=$returnFaceID&returnFaceLandmarks=$returnFaceID&returnFaceAttributes=$FaceAttributes"``;`

`$uri` `=` `"[https://](https://www.powershellbros.com/powershell-cognitive-services-face-api//https://)$APILocation.api.cognitive.microsoft.com/face/v1.0/detect?"` `+` `$queryString``;`

`$array` `=` `New-Object` `-TypeName` `byte`

`$filestream` `=` `New-Object` `IO.FileStream` `$filePath` `,``'Append'``,``'Write'``,``'Read'`

`$br` `=` `New-Object` `System.IO.BinaryReader(``[System.IO.File]``::Open(``$filepath``,` `[System.IO.FileMode]``::Open,` `[System.IO.FileAccess]``::Read,` `[System.IO.FileShare]``::ReadWrite))`

`$ReadBytes` `=` `$br``.ReadBytes(``$filestream``.Length)`

`[byte[]]``$arr` `=` `Get-Content` `$filePath` `-Encoding` `Byte` `-ReadCount` `0`

`$binaryContent` `=` `New-Object` `System.Net.Http.ByteArrayContent` `-ArgumentList` `@(,``$arr``)`

`$binaryContent``.Headers.ContentType =` `"application/octet-stream"`

`$task` `=` `$client``.PostAsync(``$uri``,``$binaryContent``)`

`$task``.wait();`

`if``(``$task``.IsCompleted)`

`{`

    `$Result` `=` `$task``.Result.Content.ReadAsStringAsync().Result |` `ConvertFrom-Json`

    `foreach``(``$face` `in` `$Result``)`

    `{`

        `Write-Host` `---- Face API result ----`

        `Write-Host` `Face ID:`

        `$face``.faceId`

        `Write-Host`

        `Write-Host` `Face attributes:`

        `$face``.faceAttributes`

        `Write-Host` `Face rectangle:`

        `$face``.faceRectangle`

        `Write-Host` `-------------------------`

    `}`

`}`

`else`

`{`

    `Write-Host` `"Sorry, something went wrong: "` `+` `$task``.Exception.Message` `-ForegroundColor` `Red`

`}`