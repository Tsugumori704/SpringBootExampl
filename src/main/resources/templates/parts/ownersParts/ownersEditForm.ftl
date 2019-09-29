<h3>Edit owner</h3>
<#if savingReport??><div>${savingReport}</div></#if>
<div class="form-group mt-3">
    <form method="post" >

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
            <input type="text" name="firstName"
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
                   value="<#if owner??>${owner.birthDate}</#if>" placeholder="Enter the BirthDate">
            <#if birthDateError??>
                <div class="invalid-feedback">
                    ${birthDateError}
                </div>
            </#if>
        </div>






        <#--    <input type="text" name="manufactureYear" value="<#if oneCar??>${oneCar.manufactureYear}</#if>" placeholder="Enter the year">-->
        <#--    <br><#if manufactureYearError??>${manufactureYearError}</#if><br>-->
        <div class="form-group mt-2">
            <input class="btn btn-primary" type="submit" value="Submit"/>
        </div>
    </form>
</div>