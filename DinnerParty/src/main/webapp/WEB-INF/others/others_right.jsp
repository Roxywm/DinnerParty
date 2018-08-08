<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="aside fr">
    <div class="pd15">
        <div class="userimg"><img src="${ctx}/userIcon/${user.icon}" height="145px"><i></i></div>
        <div class="user-level tc">${user.nickname} <em></em><em></em><em></em>（<span class="o">${user.job}</span>）</div>
        <div class="tc">
            <a href="javascript:;" class="button btn-control btn-follow" id="concernBtn"> + 关注</a>
            <a href="javascript:;" class="button btn-control btn-sent"><em class="myfont f18">&#xe63f;</em> 私信</a>
        </div>
        <div class="Praise tc">${user.area.parent.parent.name}
            <c:if test="${user.area.parent.parent.name != null}">-</c:if>
            ${user.area.parent.name}-${user.area.name}</div>
        <div class="tc">已经接待客人数：<span class="o">200</span>人</div>

        <div class="txtwrap tc" style="border-bottom:0; min-height:200px;">
            <h1 class="f16">个人简介</h1>
            ${user.about}
        </div>
    </div>
    <script>
        $("#concernBtn").click(function () {
            if(${loginUser!=null}){
                $.getJSON("${ctx}/others/addConcern",{"userId":${user.id}},function (data) {
                    if(data.ok){
                        $("#concernBtn").html("已关注");
                    }else{
                        alert(data.error);
                    }
                })
            }else{
                window.location.href="${ctx}/user/login";
            }
        })
    </script>
</div>