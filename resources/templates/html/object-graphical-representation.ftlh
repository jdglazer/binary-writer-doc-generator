<#include "object-graphical-representation-style.ftlh">
<#include "object-graphical-representation-scripts.ftlh">
<table id="graphical">
<#-- eliminate leading indent -->
    <#assign rowLength = 0 colLength = 0 cells = [] cellsNext = []>
    <#list prototype.prototypes as proto >
        <#-- First determine data element length -->
        <#if proto.dataType.complex >
            <#assign colLength = 32 >
        <#else>
            <#assign colLength = proto.length >
        </#if>
        <#-- Next determine next column and if we need to spill over to next row -->
        <#if 100 - rowLength < colLength  >
            <#-- For spilled over columns, let's ensure we put the content into the larger of the sections -->
            <#assign nameFirst = "" nameSecond = "" >
            <#if colLength - 100 + rowLength <= 100 - rowLength >
                <#assign nameFirst = proto.name >
            <#else>
                <#assign nameSecond = proto.name >
            </#if>
            <#assign cells = cells + [ { "cols": 100 - rowLength, "name": nameFirst, "closedRight": false, "closedLeft": true} ]
                     rowLength = colLength - 100 + rowLength
                     cellsNext = [ { "cols": rowLength, "name": nameSecond , "closedRight": true, "closedLeft": false} ] >
        <#else>
            <#assign cells = cells + [ { "cols": colLength, "name": proto.name, "closedRight": true, "closedLeft": true} ]
                     rowLength = (rowLength + colLength) % 100
                     cellsNext = []>
        </#if>
        <#-- If we match the spill over condition, let's print the last row out 
             and assign the spillover cell to the next row. Also, if we reach the last
             iteration, let's flush cells to a new row -->
        <#if rowLength == 0 || cellsNext?size != 0 >
            <#include "object-graphical-representation-row.ftlh">
            <#assign cells = cellsNext >
        </#if>
    </#list>
    <#-- Flush any overflowed cells in a final, incomplete row -->
    <#include "object-graphical-representation-row.ftlh">
</table>
