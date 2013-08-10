<#-- 
    li-pagenav
    dom结构比较主流的一个分页
    一排显示10个分页按钮（想定制的话把页码提取出来做为参数即可）

    pagenav.previousPage 存着上一页
    pagenav.totalPage 总页数
    pagenav.pageNo 当前页面页码
    pagenav.nextPage 存在下一页
-->
<#macro pagenav>
    <#if pagenav??>
        <div class="pagenav clearfix">
            <#if pagenav.previousPage>
                <a href="#" class="pagenav-cell">首页</a>
                <a href="#" class="pagenav-cell pagenav-cell-pre">上页</a>
            </#if>

            <#if pagenav.totalPage lte 10>
            <#-- pagenav.totalPage <= 10 -->
                <#list 1..pagenav.totalPage as index>
                    <#if pagenav.pageNo==index>
                        <a href="#" class="pagenav-cell pagenav-cell-current">${index}</a>
                    <#else>
                        <a href="#" class="pagenav-cell">${index}</a>
                    </#if>
                </#list>
            <#else>
                <#-- pagenav.totalPage > 5 -->
                <#if pagenav.pageNo lte 5 >
                    <#-- pagenav.pageNo <= 10 -->
                    <#list 1..10 as index>
                        <#if pagenav.pageNo==index>
                            <a href="#" class="pagenav-cell pagenav-cell-current">${index}</a>
                        <#else>
                            <a href="#" class="pagenav-cell">${index}</a>
                        </#if>
                    </#list>
                    <span class="pagenav-cell pagenav-cell-ellipsis">…</span>
                <#-- 10 < pagenav.pageNo < pagenav.totalPage-10 -->
                <#elseif pagenav.pageNo gt 5 && pagenav.pageNo lt (pagenav.totalPage-5) >
                    <span class="pagenav-cell pagenav-cell-ellipsis">…</span>
                    <#list (pagenav.pageNo-4)..(pagenav.pageNo+5) as index>
                        <#if pagenav.pageNo==index>
                            <a href="#" class="pagenav-cell pagenav-cell-current">${index}</a>
                        <#else>
                            <a href="#" class="pagenav-cell">${index}</a>
                        </#if>
                    </#list>
                    <span class="pagenav-cell pagenav-cell-ellipsis">…</span>
                <#else>
                    <#-- pagenav.pageNo > pagenav.totalPage-10 -->
                    <span class="pagenav-cell pagenav-cell-ellipsis">…</span>
                    <#list (pagenav.totalPage-10)..pagenav.totalPage as index>
                        <#if pagenav.pageNo==index>
                            <a href="#" class="pagenav-cell pagenav-cell-current">${index}</a>
                        <#else>
                            <a href="#" class="pagenav-cell">${index}</a>
                        </#if>
                    </#list>
                </#if>
            </#if>

            <#if pagenav.nextPage>
                <a href="#" class="pagenav-cell pagenav-cell-next">下页</a>
                <a href="#" class="pagenav-cell">末页</a>
            </#if>

            <a class="pagenav-cell" href="#">共 ${pagenav.total!'0'} 条  </a>
            <span class="pagenav-cell">
                <input type="text" value="${pagenav.pageNo!'1'}" name='gotopage' id='gotopage' class="pagenav-cell-input"> / ${pagenav.totalPage!'1'} 页
            </span>
            <a class="pagenav-cell" href="#">确定</a>
        </div>
    </#if>
</#macro>
