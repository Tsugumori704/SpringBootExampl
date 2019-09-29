<#import "parts/pageTemplate.ftl" as pt>
<@pt.page>

    <#import "parts/pager.ftl" as p>

    <@p.pager url page/>
    <table class="table table-hover table-dark">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Sur Name</th>
            <th scope="col">BirthDate</th>
            <th scope="col">CreatedDate</th>
            <th scope="col">UpdatedDate</th>
            <th scope="col">is Deleted</th>

            <#--        <th>Manufacture Year</th>-->
        </tr>
        </thead>
        <tbody>
<#--        <#list owners as owner>-->
        <#list page.content as owner>

            <tr>
                <td scope="row">
                    <#if owner.id??>
                       ${owner.id}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.firstName??>
                        ${owner.firstName}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.lastName??>
                        ${owner.lastName}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.surName??>
                        ${owner.surName}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.birthDate??>
                        ${owner.birthDate}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.createdDate??>
                        ${owner.createdDate}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.updatedDate??>
                        ${owner.updatedDate}
                    </#if>
                </td>
                <td scope="row">
                    <#if owner.deleted??>
                        ${owner.deleted?then("true","false")}
                    </#if>
                </td>

            </tr>
        <#else>
            <td colspan="8" style="text-align:center">Owner lst is Empty</td>

        </#list>
        </tbody>
    </table>
    <@p.pager url page/>

    <h3>Edit owner</h3>
    <#if savingReport??><div class="alert alert-danger" role="alert">${savingReport}</div></#if>



    <div class="form-group mt-3">
        <form method="post">

            <input type="hidden" name="id" value="<#if owner?? && owner.id??>${owner.id}</#if>">

            <div class="form-group">
                <input type="text" name="firstName"
                       class="form-control ${(firstNameError??)?string('is-invalid', '')}"
                       value="<#if owner??>${owner.firstName}</#if>" placeholder="Enter the FirstName">
                <#if firstNameError??>
                    <div class="invalid-feedback">
                        ${firstNameError}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <input type="text" name="lastName"
                       class="form-control ${(lastNameError??)?string('is-invalid', '')}"
                       value="<#if owner??>${owner.lastName}</#if>" placeholder="Enter the LastName">
                <#if lastNameError??>
                    <div class="invalid-feedback">
                        ${lastNameError}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <input type="text" name="surName"
                       class="form-control ${(surNameError??)?string('is-invalid', '')}"
                       value="<#if owner??>${owner.surName}</#if>" placeholder="Enter the SurName">
                <#if surNameError??>
                    <div class="invalid-feedback">
                        ${surNameError}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <input type="date" name="birth"
                       class="form-control ${(birthDateError??)?string('is-invalid', '')}"
                       value="<#if owner?? && owner.birthDate??>${owner.birthDate}</#if>"
                       placeholder="Enter the BirthDate">
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
            </div>



            <#--    <input type="date" name="manufactureYear" value="<#if oneCar??>${oneCar.manufactureYear}</#if>" placeholder="Enter the manufacture Year">-->
            <#--    <br><#if manufactureYearError??>${manufactureYearError}</#if><br>-->

            <#--        <input type="submit" value="Submit">-->

            <div class="form-group mt-2">
                <button type="submit" class="btn btn-primary">
                    <#if !owner??>
                        Create
                    <#else>
                        Update
                    </#if>
                </button>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </div>
</@pt.page>
