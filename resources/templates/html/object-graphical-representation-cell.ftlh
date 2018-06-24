<#-- Expects a variable called cell injected with members 'cols' and 'name' -->
<td colspan=${cell.cols} <#if !cell.closedLeft 
> class="${noBorderLeftClass}"</#if><#if !cell.closedRight
> class="${noBorderRightClass}"</#if>>${cell.name}</td>
