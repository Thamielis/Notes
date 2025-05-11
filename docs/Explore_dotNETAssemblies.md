# Explore .NET Assemblies

```powershell

#TODO: Zu allgemeiner Nutzung umbauen!

function ConvertTo-Hierarchical {
    param($data)

    $root = [Ordered]@{
        name     = "Root"
        children = @()
    }

    foreach ($item in $data) {
        $namespaceNode = [Ordered]@{
            name     = $item.Name
            children = @()
        }

        foreach ($obj in $item.Objects) {
            $namespaceNode.children += [Ordered]@{
                name = $obj.Name
            }
        }

        $root.children += $namespaceNode
    }

    return $root
}

function Build-HTMLTree {
    [CmdletBinding()]
    param (
        [Parameter()]
        $jsonData
    )

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Interactive Tree with D3</title>
    <script src="https://d3js.org/d3.v5.min.js"></script>
    <style>
        .node circle {
            fill: #fff;
            stroke: steelblue;
            stroke-width: 3px;
        }

        .node text {
            font: 12px sans-serif;
        }

        .link {
            fill: none;
            stroke: #ccc;
            stroke-width: 2px;
        }
    </style>
</head>
<body>
    <script>
        var treeData = $jsonData;

        var svg = d3.select("body").append("svg")
            .attr("width", window.innerWidth)
            .attr("height", window.innerHeight),
            width = +svg.attr("width"),
            height = +svg.attr("height"),
            g = svg.append("g").attr("transform", "translate(40,0)");

        var tree = d3.tree()
            .size([height, width - 160]);

        var root = d3.hierarchy(treeData, function(d) { return d.children; });
        root.x0 = height / 2;
        root.y0 = 0;

        update(root);

        function update(source) {
            var treeData = tree(root);
            var nodes = treeData.descendants(),
                links = treeData.descendants().slice(1);

            nodes.forEach(function(d){ d.y = d.depth * 180 });

            var node = g.selectAll('g.node')
                .data(nodes, function(d) {return d.id || (d.id = ++i); });

            var nodeEnter = node.enter().append('g')
                .attr('class', 'node')
                .attr("transform", function(d) {
                    return "translate(" + source.y0 + "," + source.x0 + ")";
                });

            nodeEnter.append('circle')
                .attr('class', 'node')
                .attr('r', 1e-6)
                .style("fill", function(d) {
                    return d._children ? "lightsteelblue" : "#fff";
                });

            nodeEnter.append('text')
                .attr("dy", ".35em")
                .attr("x", function(d) {
                    return d.children || d._children ? -13 : 13;
                })
                .attr("text-anchor", function(d) {
                    return d.children || d._children ? "end" : "start";
                })
                .text(function(d) { return d.data.name; });

            var nodeUpdate = nodeEnter.merge(node);

            nodeUpdate.transition()
                .duration(200)
                .attr("transform", function(d) { 
                    return "translate(" + d.y + "," + d.x + ")";
                });

            nodeUpdate.select('circle.node')
                .attr('r', 10)
                .style("fill", function(d) {
                    return d._children ? "lightsteelblue" : "#fff";
                })
                .attr('cursor', 'pointer');

            var nodeExit = node.exit().transition()
                .duration(200)
                .attr("transform", function(d) {
                    return "translate(" + source.y + "," + source.x + ")";
                })
                .remove();

            nodeExit.select('circle')
                .attr('r', 1e-6);

            nodeExit.select('text')
                .style('fill-opacity', 1e-6);

            var link = g.selectAll('path.link')
                .data(links, function(d) { return d.id; });

            var linkEnter = link.enter().insert('path', "g")
                .attr("class", "link")
                .attr('d', function(d){
                    var o = {x: source.x0, y: source.y0}
                    return diagonal(o, o)
                });

            var linkUpdate = linkEnter.merge(link);

            linkUpdate.transition()
                .duration(200)
                .attr('d', function(d){ return diagonal(d, d.parent) });

            var linkExit = link.exit().transition()
                .duration(200)
                .attr('d', function(d) {
                    var o = {x: source.x, y: source.y}
                    return diagonal(o, o)
                })
                .remove();

            nodes.forEach(function(d){
                d.x0 = d.x;
                d.y0 = d.y;
            });

            function diagonal(s, d) {
                path = `M ${s.y} ${s.x}
                        C ${(s.y + d.y) / 2} ${s.x},
                          ${(s.y + d.y) / 2} ${d.x},
                          ${d.y} ${d.x}`
                return path
            }
        }
    </script>
</body>
</html>
"@

    $html | Out-File -Path "GuiClasses.html" -Encoding utf8
    Invoke-Item "GuiClasses.html"

}

function Get-GuiClasses {

    $AllClasses = [System.AppDomain]::CurrentDomain.GetAssemblies() | 
        Foreach-Object { $_.GetExportedTypes() } | 
            Select-Object Name, Fullname, Namespace, BaseType, ReflectedType, MemberType, Module, TypeHandle, UnderlyingSystemType, Assembly

    $GuiClasses = $AllClasses | 
        Select-Object -Property Namespace -Unique | 
            Where-Object { $_.Namespace -match 'MahApps|MaterialDesign|ControlzEx|System.Xaml|Microsoft.Xaml|LiveCharts|LoadingIndicators' } | 
                Sort-Object -Property Namespace
    
    $ClassDict = $GuiClasses | Foreach-Object {
        $currentNamespace = $_.Namespace
        $nestedObjects = $AllClasses | Where-Object { $_.Namespace -eq $currentNamespace }

        [PSCustomObject]@{
            Name    = $currentNamespace
            Objects = $nestedObjects
        }
    }


    $hierarchicalData = ConvertTo-Hierarchical -data $ClassDict
    $jsonData = $hierarchicalData | ConvertTo-Json -Depth 3
    Build-HTMLTree -jsonData $jsonData

    $json = $ClassDict | ConvertTo-Json -Depth 50 | Out-File -FilePath 'GuiClasses.json' -Encoding utf8

    $jsonData = $ClassDict | ForEach-Object {
        @{
            id     = $_.Name
            parent = "#"
            #text   = $_.Name
        },
        ($_.Objects | ForEach-Object {
            @{
                id     = $_.FullName
                parent = $_.Namespace
                text   = $_.Name
            }
        })
    } | ConvertTo-Json -Compress
    ###############################################################
    $children = @()
    $jsonData = $ClassDict | ForEach-Object {

        $_.Objects | ForEach-Object {
            $children += @{
                id     = $_.FullName
                parent = $_.Namespace
                text   = $_.Name
            }
        }

        @{
            id       = $_.Name
            parent   = "#"
            text     = $_.Name
            children = $children
            
        }
    } | ConvertTo-Json -Depth 50 -Compress

    ###############################################################
    $flatData = @()
    $ClassDict | ForEach-Object {
        $flatData += @{
            id     = $_.Name
            parent = "#"
            text   = $_.Name
        }
        $_.Objects | ForEach-Object {
            $flatData += @{
                id     = $_.FullName
                parent = $_.Namespace
                text   = $_.Name
            }
        }
    }
    $jsonData = $flatData | ConvertTo-Json -Compress

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Tree</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
</head>
<body>
    <div id="jstree"></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
    <script>
        `$(function() {
            var data = $jsonData;
            `$('#jstree').jstree({ 'core' : { 'data' : data } });
        });
    </script>
</body>
</html>
"@

    $html | Out-File -Path "GuiClasses.html" -Encoding utf8
    Invoke-Item "GuiClasses.html"

}

```
