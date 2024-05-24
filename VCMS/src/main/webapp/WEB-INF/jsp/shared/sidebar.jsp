<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<style>
.vcms-menu{display: none;}
#vcms-id:checked ~ .vcms-menu{display: block;}
.vcms-menu{display: none;}

.vcms-menu-info{display: none;}
#vcms-id-info:checked ~ .vcms-menu-info{display: block;}
.vcms-menu-info{display: none;}

.vcms-menu-manager{display: none;}
#vcms-id-manager:checked ~ .vcms-menu-manager{display: block;}
.vcms-menu-manager{display: none;}

</style>  

    
<div class="mobile-menu-left-overlay"></div>
<nav class="side-menu">
   <input type="checkbox" id="vcms-id" style="display: none;" checked="checked">
   <label for="vcms-id" > <span>
	            <span class="glyphicon glyphicon-headphones" style="color: #009de3; margin-left: 10px; margin-right: 5px;"></span>
                    <span class="lbl" style="font-weight:bold; font-size: 14px;">バージョン管理機能</span>
	</span></label>
	<ul class="side-menu-list vcms-menu" >
    <li class="blue with-sub">
              <a onclick="location.href='/VCMS/ACCOUNT_300/accountList.do'">
               <span>
                    <span class="glyphicon glyphicon-menu-right"  ></span>
                    <span class="lbl" style="font-weight:bold" id="first1">アカウント作成申請</span>
                </span>
            </a>        
        </li>
        <li class="blue with-sub">
             <a onclick="location.href='/VCMS/DBAPO_400/dbApoList.do'">
                <span>
                    <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="first2">リポジトリ生成[DB]申請</span>
                </span>
            </a>    
        </li>
    <li class="blue with-sub">
               <a onclick="location.href='/VCMS/WASAPO_500/wasApoList.do'">
                <span>
                    <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="first3">リポジトリ生成[WAS]申請</span>
                </span>
            </a>
        </li>
       <li class="blue with-sub">
             <a onclick="location.href='/VCMS/ACCESS_600/accessList.do'">
                <span>
                    <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="first4">リポジトリアクセス権限申請</span>
                </span>
            </a>        
        </li>      
         <li class="blue with-sub">
            <a onclick="location.href='/VCMS/SOURCE_200/sourceList.do'">
                <span>
                     <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold"  id="first5">ソースコード反映申請</span>                              
                </span>
            </a>       
        </li>                   
    </ul> 
    <input type="checkbox" id="vcms-id-info" style="display: none;" checked="checked" >
   <label for="vcms-id-info" > <span>
	            <span class="glyphicon glyphicon-list"  style="color: #009de3; margin-left: 10px; margin-right: 5px;  margin-top: 10px;"></span>
                    <span class="lbl" style="font-weight:bold; font-size: 14px;" >会員機能</span>
	</span></label>
	<ul class="side-menu-list vcms-menu-info" >
        <li class="blue with-sub">
            <a onclick="location.href='/VCMS/USER_100/userView.do'">
                <span>
                    <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="second1">会員情報</span>                              
                </span>
            </a>       
        </li>      
    </ul>
<input type="checkbox" <c:if test="${sessionScope.userInfo ne 'admin'}">id="admin" </c:if> id="vcms-id-manager" style="display: none;" checked="checked" >
   <label for="vcms-id-manager" > <span>  
	            <span <c:if test="${sessionScope.userInfo ne 'admin'}">class="hidden"</c:if> class="glyphicon glyphicon-user"  style="color: #009de3; margin-left: 10px; margin-right: 5px;  margin-top: 10px;"></span>
                    <span <c:if test="${sessionScope.userInfo ne 'admin'}">class="hidden"</c:if> class="lbl" style="font-weight:bold; font-size: 14px;">管理者機能</span>
	</span></label>
	<ul class="side-menu-list vcms-menu-manager" >
        <li class="blue with-sub">
            <a onclick="location.href='/VCMS/ADMIN/accountAdminList.do'">
                <span>
                      <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold"  id="third1">アカウント作成申請管理</span>                              
                </span>
            </a>       
        </li> 
        <li class="blue with-sub">
            <a onclick="location.href='/VCMS/ADMIN/dbApoAdminList.do'">
                <span>
                      <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="third2" >DBリポジトリ生成申請管理 </span>                              
                </span>
            </a>       
        </li> 
        <li class="blue with-sub">
            <a onclick="location.href='/VCMS/ADMIN/wasApoAdminList.do'">
                <span>
                      <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold"  id="third3">WASリポジトリ生成申請管理</span>                              
                </span>
            </a>       
        </li>
           <li class="blue with-sub">
             <a onclick="location.href='/VCMS/ADMIN/accessAdminList.do'">
                <span>
                      <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="third4" >アクセス権限申請管理</span>                              
                </span>
            </a>       
        </li>
           <li class="blue with-sub">
            <a onclick="location.href='/VCMS/ADMIN/sourceAdminList.do'">
                <span>
                      <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold"  id="third5">ソースコード反映申請管理</span>                              
                </span>
            </a>       
        </li>       
         <li class="blue with-sub">
             <a onclick="location.href='/VCMS/ADMIN/userAdminList.do'">
                <span>
                    <span class="glyphicon glyphicon-menu-right"></span>
                    <span class="lbl" style="font-weight:bold" id="third6">会員管理</span>                              
                </span>
            </a>       
        </li>          
    </ul>
</nav>



