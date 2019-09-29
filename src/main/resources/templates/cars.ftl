<#import "parts/pageTemplate.ftl" as pt>
<@pt.page>

<#import "parts/pager.ftl" as p>

<@p.pager url page/>
<table class="table table-hover table-dark">
    <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Model</th>
            <th scope="col">Mark</th>
            <th scope="col">CreatedDate</th>
            <th scope="col">UpdatedDate</th>
            <th scope="col">Color</th>
            <th scope="col">VIN</th>
            <th scope="col">is Deleted</th>
            <th scope="col">Edit</th>
            <th scope="col">Remove and Reaper</th>
            <#--        <th>Manufacture Year</th>-->
        </tr>
    </thead>
    <tbody>
    <#list page.content as car>

        <tr>
            <th scope="row">
                <#if car.id??>
                    ${car.id}
                </#if>
            </th>
            <td scope="row">
                <#if car.model??>
                    ${car.model}
                </#if>
            </td>
            <td scope="row">
                <#if car.mark??>
                    ${car.mark}
                </#if>
            </td>
            <td scope="row">
                <#if car.createdDate??>
                    ${car.createdDate}
                </#if>
            </td>
            <td scope="row">
                <#if car.updatedDate??>
                    ${car.updatedDate}
                </#if>
            </td>
            <td scope="row">
                <#if car.color??>
                    ${car.color}
                </#if>
            </td>
            <td scope="row">
                <#if car.vin??>
                    ${car.vin}
                </#if>
            </td>
            <td scope="row">
                <#if car.deleted??>
                    ${car.deleted?then("true","false")}
                </#if>
            </td>
            <#--        <#if car.manufactureYear??>-->
            <#--            <td>${car.manufactureYear}</td></#if>-->
<#--            <td class="table-secondary"><a href="cars?editCar=${car.id}"  class="badge badge-pill badge-primary">edit</a></td>-->

            <td>${car.deleted?then(
                '<div href="cars?reaperCar=${car.id}"  class="badge badge-pill badge-warning">edit</div>',
                '<a href="cars?editCar=${car.id}"  class="badge badge-pill badge-primary">edit</a></td>')
                }

<#--                <a href="cars?editCar=${car.id}"  class="badge badge-pill badge-primary">edit</a></td>-->

            <td>${car.deleted?then(
                '<a href="cars?reaperCar=${car.id}"  class="badge badge-pill badge-success">reaper</a>',
                '<a href="cars?removeCar=${car.id}"  class="badge badge-pill badge-danger">remove</a>')
                }
            </td>

        </tr>
    <#else>
        <td colspan="5" style="text-align:center">Cars lst is Empty</td>

    </#list>
    </tbody>
</table>
<@p.pager url page/>

<h3>Edit car</h3>
<#if savingReport??><div class="alert alert-danger" role="alert">${savingReport}</div></#if>



<div class="form-group mt-3">
    <form method="post">

        <input type="hidden" name="id" value="<#if oneCar?? && oneCar.id??>${oneCar.id}</#if>">

        <div class="form-group">
            <input type="text" name="mark"
                   class="form-control ${(markError??)?string('is-invalid', '')}"
                   value="<#if oneCar??>${oneCar.mark}</#if>" placeholder="Enter the mark">
            <#if markError??>
                <div class="invalid-feedback">
                    ${markError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <input type="text" name="model"
                   class="form-control ${(modelError??)?string('is-invalid', '')}"
                   value="<#if oneCar??>${oneCar.model}</#if>" placeholder="Enter the model">
            <#if modelError??>
                <div class="invalid-feedback">
                    ${modelError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <input type="color" name="color"
                   class="form-control ${(colorError??)?string('is-invalid', '')}"
                   value="<#if oneCar??>${oneCar.color}</#if>" placeholder="Enter the color">
            <#if colorError??>
                <div class="invalid-feedback">
                    ${colorError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <input type="text" name="vin"
                   class="form-control ${(vinError??)?string('is-invalid', '')}"
                   value="<#if oneCar??>${oneCar.vin}</#if>"
                   placeholder="Enter the vinNumber">
            <#if vinError??>
                <div class="invalid-feedback">
                    ${vinError}
                </div>
            </#if>
        </div>

        <#--    <input type="date" name="manufactureYear" value="<#if oneCar??>${oneCar.manufactureYear}</#if>" placeholder="Enter the manufacture Year">-->
        <#--    <br><#if manufactureYearError??>${manufactureYearError}</#if><br>-->

<#--        <input type="submit" value="Submit">-->

        <div class="form-group mt-2">
            <button type="submit" class="btn btn-primary">
                <#if !oneCar??>
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
