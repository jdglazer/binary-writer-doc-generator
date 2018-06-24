<#-- expects a list, cells, injected of members containing name, cols, closedLeft, closedRight members -->
<tr>
    <#list cells as cell>
        <#include "object-graphical-representation-cell.ftlh" >
    </#list>
</tr>
