<head>
<title>CRM Laboratorios!</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/typography.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
<style type="text/css">
.clearfix {height: 1%;}
img {border: none;}
#resol {position:absolute;} body {overflow-x: hidden;} 
</style>
<![endif]-->
<!--[if gte IE 7.0]>
<style type="text/css">
.clearfix {display: inline-block;}
</style>
<![endif]-->
</head>
<body>
<div id="mainwrap">																																																																																																																																																																																																																																																																																																																				
<!--BEGIN OF TERMS OF USE. DO NOT EDIT OR DELETE THESE LINES. IF YOU EDIT OR DELETE THESE LINES AN ALERT MESSAGE MAY APPEAR WHEN TEMPLATE WILL BE ONLINE-->
 <div id="footer_terms">
  <h1><strong>css modelos</strong> no <a href="http://www.layouts-templates.com/"><strong>css modelos</strong></a></h1>
 </div>
 <!--END OF TERMS OF USE-->
	<div id="leftcol">
    	<h1 id="logo"><a href="?">CRM Laboratórios </a></h1>
        <div id="mainnav">
        	<ul>
            	<li><a href="?"><span>Home</span></a></li>
                <li><a href="?action=portfolio"><span>Portfolio</span></a></li>
                <li><a href="?action=servicos"><span>Servicos</span></a></li>
                <li><a href="?action=login"><span>Administracao</span></a></li>
                <li><a href="?action=contato"><span>Contato</span></a></li>
            </ul>
        </div>
                    
        <div class="module-box grey1">
        	
            <form method="POST" action="?">
                        <h1 class="none">Resultado Online!</h1>
                        Digite o Codigo de Cliente
                        <input type="hidden" name="action" value="resultados">
                        <br> <input type="text" name="codigoCli" value=""><br>
                        Digite a Senha de Acesso
                        <br>
                        <input type="text" name="senhaCli" value="">
                        <br><br>
                        <input type="submit" name="submit" value="Buscar">
            </form>
                
        </div>
        <div class="module-box">
        	<h2 class="orange">Notícias</h2>
            <div class="module-content">
            	<ul class="none">
                	<li>
                    	<strong><a href="?" class="black">01 Junho 2015</a></strong>
                        <p>Estamos disponibilizando tambem resultado de exames de imagens!</p>
                        <a href="?">Leia</a>
                    </li>
                    <li>
                    	<strong><a href="?" class="black">01 de Junho 2015</a></strong>
                        <p>Acesse seus resultados de exames Online no nosso Sitio,
                            entre com seu Codigo de acesso de cliente e sua senha que acompanha o documento de
                        protocolo de seu exame, e simples e rapido, seu medico tera acesso imediato!</p>
                        
                    </li>
                </ul>
            </div>
        </div>
       
    </div>
    <div id="rightcol">
    	<div id="header" class="clearfix">
        	<div id="call">call: 1800 365 632</div>
            <div id="search"><input type="text" style="with: 160px;" value="" id="input-search" /><input type="submit" value="ok" id="ok" /></div>
        </div>
        <div id="banner">
        </div>
        <%
            
                                String pagina = request.getParameter("page");
                                if (pagina != null) {
                                    pagina = "pages/" + pagina + ".jsp";
                            %>                                 
                            <jsp:include page="<%= pagina%>" />
                            <%
                                }else{
                                pagina = (String) request.getAttribute("page");
                                if (pagina != null) {
                                    pagina = "pages/" + pagina + ".jsp";
                            %>                                 
                            <jsp:include page="<%= pagina%>" />
                            <%

                                }
                            }
                                
                                
                            %>
                            
        <div id="footer">
        	<div id="botnav" style="text-align:center">
            	<ul class="clearfix">
                	<li><a href="?">Home</a></li>
                    <li><a href="?action=portfolio">Portfolio</a></li>
                    <li><a href="?action=servicos">Servicos</a></li>
                    <li><a href="?action=login">Administracao</a></li>
                    <li><a href="?action=contato">Contacto</a></li>
                </ul>
            </div>
            <div id="copyright">
            	Copyright (c) 2015-2020 &nbsp;|&nbsp; Company
            </div>
        </div>
    </div>
</div>
</body>
</html>
