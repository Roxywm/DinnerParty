<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="mezz">
    <meta name="author" content="mezz">
    <link href="${ctx}/static/css/css.css" rel="stylesheet">
    <link href="${ctx}/static/css/chosen.css" rel="stylesheet">
    <link href="${ctx}/static/css/slick.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <link href="${ctx}/static/css/ie.css" rel="stylesheet" type="text/css" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <![endif]-->
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=${ctx}/static/IE6/IE6.html"><![endif]-->
    <link type="image/x-icon" href="${ctx}/static/images" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>

<c:if test="${loginUser==null}">
    <div class="head">
        <div class="wrap clearfix">
            <a href="index.html" class="logo indent">logo</a>
            <div class="headr fr">
                <form action="active.html" method="post" class="headsearch">
                    <label class="label">
                        <input type="text" value="" name="" class="key">
                        <span class="text">搜索地址、名称、时间等</span>
                    </label>
                    <button type="submit" class="button btn-search">&#xe628;</button>
                </form>
                <a href="${ctx}/user/login">登录</a><a href="${ctx}/user/register">注册</a><a href="${ctx}/mutually/dinner/create">发布我的饭局</a>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${loginUser!=null}">
    <%@include file="/common/user_head.jsp"%>
</c:if>

<div class="detail-banner">
    <div class="item" style="background-image:url(${ctx}/static/upload/img23.jpg);">
        <div class="wrap">
            <div class="tbg"></div>
            <div class="txt">
                <div class="mt40 tnumber">NO.01</div>
                <p class="tname">海纳创作料理价值350元高级自助餐免费抢！</p>
                <p>Rebel Rebel的花艺设计风格以遵从自然主义、尊重原创花艺设计为其最鲜明的特色，对创新的不断突破和对产品品质的永不妥协也是支持这个品牌花店永葆生机的不变法则。每次花艺现场，Rebel Rebel都会尽力为客户挑选当季最优质的英国原产花材，为打造一场美轮美奂的花艺作品而竭尽全力。</p>
            </div>
        </div>
    </div>
    <div class="item" style="background-image:url(${ctx}/static/images/img4.jpg);">
        <div class="wrap">
            <div class="tbg"></div>
            <div class="txt">
                <div class="mt40 tnumber">NO.02</div>
                <p class="tname">海纳创作料理价值350元高级自助餐免费抢！</p>
                <p>Rebel Rebel的花艺设计风格以遵从自然主义、尊重原创花艺设计为其最鲜明的特色，对创新的不断突破和对产品品质的永不妥协也是支持这个品牌花店永葆生机的不变法则。每次花艺现场，Rebel Rebel都会尽力为客户挑选当季最优质的英国原产花材，为打造一场美轮美奂的花艺作品而竭尽全力。</p>
            </div>
        </div>
    </div>
</div>

<div class="dd-btn">
    <div class="wrap clearfix pr">
        <span class="label current">单身派对</span>
        <span class="label">英式下午茶</span>
        <span class="label">二点五次元</span>
        <div class="tbg"></div>
        <div class="sharebox clearfix">
      <span class="fl"><em class="fl">分享</em> <div class="bdsharebuttonbox fl"><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_twi" data-cmd="twi" title="分享到Twitter"></a></div>
<script>
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["tsina","tqq","qzone","weixin","twi"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","tqq","qzone","weixin","twi"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script></span><a href="#" class="Collect fr"><em class="myfont">&#xe613;</em>收藏 0</a><a href="javascript:;" class="love fr"><em class="myfont">&#xe61d;</em>赞 0 </a>
        </div>
    </div>
</div>

<div class="wrap mt40">
    <input id="loginUser" value="${loginUser}">
    <div class="detail-box">
        <dl class="lebox">
            <dt class="img"><img src="${ctx}/uploads/${dinner.thumbnail}"></dt>
            <dd>活动详情 | EVENT DETAILS</dd>
        </dl>
        <h1>${dinner.titel}</h1>
        <p class="local"><em class="myfont">&#xe629;</em>  中国   上海</p>
        ${dinner.details}
        <%--你有没有发觉，这城市太快了？从窗外望出去，或是看看四周，人们总在匆忙。但这正是我们选择在这里的原因，咖啡馆真正存在的意义，就是让时光一直静止在这里。一杯现磨咖啡，也许就会让下一刻专属于你。在J Coffee，让时光与咖啡简单存在。 为了保证咖啡的品质，J Coffee选用纯正的阿拉比卡咖啡豆，咖啡机及其它器具均来自国际一线品牌。咖啡制作老师是咖啡师大赛（WBC）中国区冠军何鸿操老师，杯测老师为COE...--%>
    </div>
</div>

<div class="wrap mt40 clearfix">
    <div class="Publisher mt10 fl">
        <a href="#" class="user-img"><img src="${ctx}/userIcon/${dinner.user.icon}" style="border-radius: 50%"></a>
        <div class="user-level tc">${dinner.user.nickname} <em></em><em></em><em></em></div>
        <p class="tc"><a href="javascript:;" class="button btn-follow"> + 关注</a></p>
        <div class="pd10">
            <p class="myfont"><em>&#xe642;</em><em>&#xe629;</em></p>
            <p class="mt5">个人信誉值</p>
            <span class="Progress mt10"><span class="bar" style="width:75%;"></span></span>
            <p class="mt5">粉丝  0</p>
        </div>
    </div>
    <div class="detail-info fl">
        <div class="title">
            招募名额：${dinner.maximum} 位
            <p class="f14">报名时间： <fmt:formatDate value='${dinner.endTime}' pattern='yyyy年MM月dd日'/>结束</p>
            <span class="price"><em class="f30">${dinner.price}</em> 元 / 位</span>
        </div>
        <div class="bd">
            <table>
                <tr>
                    <th><img src="${ctx}/static/images/l.png"></th>
                    <td><p class="c999">活动地址</p>陕西南路35号雅克红房子5楼200 米</td>
                </tr>
                <tr>
                    <th><img src="${ctx}/static/images/time.png"></th>
                    <td>
                        <p class="c999">活动时间</p>
                        <fmt:formatDate value='${dinner.startTime}' pattern='yyyy年MM月dd日'/>
                        <%--1月27日(周二)11:00 到 2月13日(周五)21:00--%>
                    </td>
                </tr>
                <tr>
                    <th><img src="${ctx}/static/images/wf.png"></th>
                    <td><p class="c999">活动玩法</p><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="Countdown fr">
        <div class="title">距报名结束还有<span id="days">0</span>天</div>
        <!-- 结束时间 (时间戳) -->
        <input type="hidden" name="endTime" value="${dinner.endTime.time}" id="endTime">
        <ul class="countime clearfix">
            <li>
                <span class="hour" id="hour">00</span>
                <em>小时</em>/Hours
            </li>
            <li>
                <span class="minu" id="min">00</span>
                <em>分钟</em>/Minutes
            </li>
            <li>
                <span class="hour" id="sec">00</span>
                <em>秒</em>/Second
            </li>
        </ul>
        <c:if test="${applyParty!=null}">
            <a href="javascript:;" class="button btn-apply">已申请</a>
        </c:if>
        <c:if test="${applyParty==null}">
            <a href="${ctx}/mutually/dinner/applyParty?dinnerId=${dinner.id}" class="button btn-apply">立即申请</a>
        </c:if>

        <a href="javascript:;" class="button btn-enj" id="interest">感兴趣<span class="f12" id="interestNum">(${dinner.interest}人)</span></a>
        <div class="title tc pd10 f12">已经有<span>${dinner.enrolment}</span>人报名</div>
    </div>

</div>

<div class="registbox mt40">
    <div class="wrap">
        <p class="tc" style="padding-top:60px;"><img src="${ctx}/static/images/imgrs.jpg"></p>
        <c:if test="${fn:length(applyPartyList)==0}">
            <div class="Prompt green" style="padding:0 0 10px;text-align: center;font-size: 18px;">
                目前没有用户报名！
            </div>
        </c:if>
        <div class="regster">
            <c:forEach items="${applyPartyList}" var="applyParty">
                <dl>
                    <dt><a href="#"><img src="${ctx}/userIcon/${applyParty.user.icon}" height="145px"></a></dt>
                    <dd><a href="#">${applyParty.user.nickname}</a></dd>
                </dl>
            </c:forEach>
        </div>
    </div>
</div>

<div class="message wrap mt20">
    <div class="label"><em></em>留言交流</div>
    <div class="pd30">
        <form action="" method="post">
            <input type="hidden" name="dinnerId" value="${dinner.id}">
            <div class="plmain bg-w bd0 mt30">
                <div class="plm tr"><a href="#" class="c999" style="text-decoration:none"><em class="myfont f20">&#xe61b;</em>${fn:length(dinnerMsgPage.list)}</a></div>
                <div class="textarea_input">
                    <textarea id="TextArea1" name="message" style="background:#f9f9f9;" ></textarea>
                </div>
                <div class="tool_submit tr"><button type="submit" class="button sublist">留 言</button></div>
            </div>
        </form>


        <div class="plmcomment mt20">
            <ul class="comment-list">
                <c:if test="${fn:length(dinnerMsgPage.list)==0}">
                    <li class="np-post green" style="text-align: center; font-size: 18px;">
                        目前没有用户留言！
                    </li>
                </c:if>
                <c:forEach items="${dinnerMsgPage.list}" var="dinnerMsg">
                    <li class="np-post">
                        <a href="home.html" class="fans img"><img src="${ctx}/userIcon/${dinnerMsg.msgUser.icon}"></a>
                        <div class="post-body">
                            <div class="post-header clearfix">
                                <a href="home.html" class="name">${dinnerMsg.msgUser.nickname}</a><span class="user-level"><em></em><em></em><em></em></span> 18分钟前<span class="reply"><em class="myfont">&#xe640;</em><a href="javascript:;"> 回复</a></span>
                            </div>
                            <div class="post-content">${dinnerMsg.message}</div>
                        </div>
                    </li>
                </c:forEach>

            </ul>
            <!-- 分页 -->
            <div class="page mt20 clearfix">
                <c:if test="${fn:length(dinnerMsgPage.list)!=0}">
                    <div class="page mt20 clearfix">
                        <c:if test="${page.prePage!=0}">
                            <a href="?pageNum=${page.prePage}" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:if test="${page.prePage==0}">
                            <a href="javascript:;" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:forEach begin="1" end="${page.pages}" var="p">
                            <c:if test="${p==page.pageNum}"><span>${p}</span></c:if>
                            <c:if test="${p!=page.pageNum}"><a href="?pageNum=${p}">${p}</a></c:if>
                        </c:forEach>
                        <c:if test="${page.nextPage!=0}">
                            <a href="?pageNum=${page.nextPage}" class="next">下一页<em></em></a>
                        </c:if>
                        <c:if test="${page.nextPage==0}">
                            <a href="javascript:;" class="next">下一页<em></em></a>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>


<div class="footmenu">
    <div class="wrap clearfix">
        <div class="item bd0">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="fr">
            <img src="${ctx}/static/images/img2.jpg">
            <img src="${ctx}/static/images/img3.jpg">
        </div>
    </div>
    <div class="gotop">&#xe608;</div>
</div>
<div class="foot tc">Copyright © 2003-2015 17素材, All Rights Reserved</div>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
<script src="${ctx}/static/js/slick.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script>
    $(function(){
        $('.detail-banner').slick({
            dots: true,
            infinite: true,
            speed: 500,
            fade: true,
            autoplay: true,
            cssEase: 'linear'
        });
        $('.regster').slick({
            dots: false,
            slidesToShow: 6,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
        });
    })
</script>
<script>

    $(function () {


        setTime();

        setInterval(setTime,1000);

    })
    function setTime(){
        var nowTime = new Date();
        var endTime = new Date($("#endTime").val()*1);
        console.log(nowTime.getTime())
        console.log(endTime.getTime())

        var t = endTime.getTime() - nowTime.getTime();
        var day=Math.floor(t/1000/60/60/24);
        var hour=Math.floor(t/1000/60/60%24);
        var min=Math.floor(t/1000/60%60);
        var sec=Math.floor(t/1000%60);

        if (hour < 10) {
            hour = "0" + hour;
        }
        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        $("#hour").html(hour);
        $("#min").html(min);
        $("#sec").html(sec);
        $("#days").html(day);
    }
</script>
<script>
    var flag = true;
    $("#interest").click(function () {
        if($("#loginUser").val()!=""){
            if(flag){
                $.getJSON("${ctx}/mutually/dinner/interest",{"dinnerId":${dinner.id}},function (data) {
                    if(data.ok==true){
                        $("#interestNum").html(data.interest);
                        flag = false;
                    }else{
                        alert("未知错误！")
                    }
                })
            }
        }else{
            window.location.href="${ctx}/user/login";
        }
    })
</script>
</body>
</html>