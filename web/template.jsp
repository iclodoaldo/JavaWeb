<%@page import="br.ufjf.model.Usuario"%>
<%@page import="br.ufjf.controller.Controller"%>
<%@page import="javax.swing.JOptionPane"%>
<head>
    <title>Laboratorio Pos!</title>
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
        <div id="leftcol">
            <h1 id="logo"><a href="?">LABORATÓRIOS CRM</a></h1>
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

                <form id="localizaCliente" method="POST" action="?">
                    <br><br>
                    <h1 class="none">Resultado Online!</h1>
                    Digite o CPF do Cliente
                    <input type="hidden" name="action" value="resultados">
                    <br> <input type="text" name="codigoCli" value=""><br>
                    Digite a Senha de Acesso
                    <br>
                    <input type="text" name="senhaCli" value="">
                    <br><br>
                    <input type="submit" name="submit" value="Buscar">
                    <br><br>
                </form>

            </div>
            <div class="module-box">
                <h2 class="orange">News</h2>
                <div class="module-content">
                    <ul class="none">
                        <li>
                            <strong><a href="?" class="black">Setembro 2015</a></strong>
                            <p>Estamos disponibilizando tambem exames de imagens!</p>
                            <a href="?">Read news</a>
                        </li>
                        <li>
                            <strong><a href="?" class="black">Setembro 2015</a></strong>
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
                <div id="call">Telefone: 0800 123 4567</div>
            </div>
            <div id="banner">
            </div>
            <%

                String pagina = request.getParameter("page");
                String logarObrigatorio = "administracao, alteraClientes,"
                        + " alteraUsuario, cadastroClientes"
                        + " cadastroExame, cadastroTipoExame"
                        + " cadastroUsuarios, contabilidade"
                        + " excluirCliente, excluirUsuario";

                if (logarObrigatorio.contains(pagina)) {
                    if (pagina != null) {
                        pagina = "pages/" + pagina + ".jsp";

                        try {
                            Usuario u = (Usuario) session.getAttribute("usuario");
            %>
            <form id="formbasico"><br><h1 id="login">Bem Vindo <b><%= u.getNome()%>!</b>
                <a href="?action=logof"><b>Sair!</b></a><br><br>
                <input type="button" value="Voltar à ADM"  OnClick="location.href = '?action=login'"/>

            <br><br></h1></form>
            <jsp:include page="<%= pagina%>" />
            <%
                } catch (Exception e) {

                    response.sendRedirect("?");
                }
            } else {//
                pagina = (String) request.getAttribute("page");
                if (pagina != null) {
                    pagina = "pages/" + pagina + ".jsp";
                    try {
                        Usuario u = (Usuario) session.getAttribute("usuario");
            %>
            <h1 id="login">Bem Vindo <b><%= u.getNome()%>! Para sair clique em</b><a href="?action=logof"><b> Sair!</b></a></h1>
            <jsp:include page="<%= pagina%>" />
            <%
                        } catch (Exception e) {

                            response.sendRedirect("?");
                        }
                    }
                }

            } else {

                if (pagina != null) {
                    pagina = "pages/" + pagina + ".jsp";

            %>                                 
            <jsp:include page="<%= pagina%>" />
            <%
            } else {
                pagina = (String) request.getAttribute("page");
                if (pagina != null) {
                    pagina = "pages/" + pagina + ".jsp";


            %>                                 
            <jsp:include page="<%= pagina%>" />
            <%

                        }
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
