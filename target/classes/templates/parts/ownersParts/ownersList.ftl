<#--<#import "../pager.ftl" as p>-->

<#--<@p.pager url page/>-->
<table class="table table-hover table-bordered table-sm">
    <thead class="thead-light">
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Firs Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Sur Name</th>
        <th scope="col">BirthDate</th>
        <th scope="col">Is deleted</th>
<#--        <th scope="col"></th>-->
<#--        <th scope="col"></th>-->
    </tr>
    </thead>
    <tbody>
    <#list owners as owner>
        <tr ${owner.deleted?then("class='alert-danger'", "")}>
            <td scope="row">
                <#if owner.id??>
                    ${owner.id}
                </#if>
            </td>
            <td scope="row">
                <#if owner.firs_name??>
                    ${owner.firs_name}
                </#if>
            </td>
            <td scope="row">
                <#if owner.last_name??>
                    ${owner.last_name}
                </#if>
            </td>
            <td scope="row">
                <#if owner.sur_name??>
                    ${owner.sur_name}
                </#if>
            </td>
            <td scope="row">
                <#if owner.birth_date??>
                    ${owner.birth_date}
                </#if>
            </td>

            <td scope="row">
                <#if owner.deleted??>
                    ${owner.deleted?then("true", "false")}
                </#if>
            </td>

<#--            <td scope="row">-->
<#--                <a href="cars?editCar=${owner.id}">edit</a>-->
<#--            </td>-->
<#--            <td scope="row">-->
<#--                ${owner.deleted?then('<a href="cars?repareCar=${owner.id}">repare</a>',-->
<#--                '<a href="cars?removeCar=${owner.id}">remove</a>') }-->
<#--            </td>-->
        </tr>
    <#else>
        Owner list is Empty
    </#list>
    </tbody>
</table>
<#--<@p.pager url page/>-->