<#import "parts/common.ftlh" as c>

<@c.page>
User editor
<#-- сначала необходимо отобразить данные, который хотим отредактировать, а потом отредактированные передать в db -->
<form action="/user" method="post">
    <input type="text" name="username" value="${user.username}"/>
    <input type="text" name="password" value="${user.password}"/>
    <#list roles as role>
        <div>
            <label>
                <#-- чекбокс с выбранной ролью: -->
                <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}
            </label>
        </div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit">Save</button>
</form>
</@c.page>