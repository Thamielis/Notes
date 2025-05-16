`function` `Connect-SQL` `{`

        `[CMDletbidings()]`

        `param`

        `(`

            `[``Parameter``(``Position``=0,` `Mandatory``=``$true``,` `HelpMessage``=``"SQL query"``,` `ValueFromPipeline` `=` `$true``)]` `$query``,`

            `[``Parameter``(``Position``=1,` `Mandatory``=``$true``,` `HelpMessage``=``"SQL server instance name"``,` `ValueFromPipeline` `=` `$true``)]` `$SqlSrv``,`

            `[``Parameter``(``Position``=2,` `Mandatory``=``$true``,` `HelpMessage``=``"SQL database name"``,` `ValueFromPipeline` `=` `$true``)]` `$SqlDb`

        `)`

        `$ee` `= @()`

        `$SqlConnection` `=` `New-Object` `System.Data.SqlClient.SqlConnection`

        `$SqlConnection``.ConnectionString =` `"Server = $SqlSrv; Database =$SqlDb; Integrated Security = $True"`       

        `$handler` `=` `[System.Data.SqlClient.SqlInfoMessageEventHandler]` `{`

            `param``(``$sender``,` `$event``)`

        `}`

        `$SqlConnection``.add_InfoMessage(``$handler``);`

        `$SqlConnection``.FireInfoMessageEventOnUserErrors =` `$true``;`

        `try`

        `{`

            `$SqlConnection``.Open()`

            `$SqlCmd` `=` `New-Object` `System.Data.SqlClient.SqlCommand`

            `$SqlQuery1` `=` `$query`

            `$SqlCmd``.CommandText =` `$SqlQuery1`

            `$SqlCmd``.Connection =` `$SqlConnection`

            `$SqlDa` `=` `New-Object` `System.Data.SqlClient.SqlDataAdapter`

            `$SqlDa``.SelectCommand =` `$SqlCmd` 

            `$Ds` `=` `New-Object` `System.Data.DataSet`

            `$SQLResultCount` `=` `$SqlCmd``.ExecuteNonQuery()`           

            `if``(``$SQLResultCount` `-eq` `-1){`

                `[void]` `$SqlDa``.Fill(``$Ds``)`

                `$QueryResults` `= @()`

                `$Ds``.Tables[0] | %{``$QueryResults` `+=` `$_``}`

                `$SQLResultCount` `=` `$Ds``.Tables[0].Rows.Count`

            `}`

            `$SqlConnection``.Close()`

            `return` `$QueryResults`

        `}`

        `catch`

        `{`

           `return` `'Error:'` `+` `$_``.Exception.Message`

        `}`

`}`