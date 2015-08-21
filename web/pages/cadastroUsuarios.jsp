<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuários</title>
    </head>
    <body>
        <h1>Cadastro e alteração de Usuários do sistema</h1>
        <form name="cadastroUsuarios">
            <br><label>Matrícula: </label>
            <input type="text" name="matricula" value="" size="50" /><br><br>
            <label>Nome: </label>
            <input type="text" name="nome" value="" size="80" /><br><br>
            <label>Login: </label>
            <input type="text" name="login" value="" size="40" /><br><br>
            <label>Senha: </label>
            <input type="password" name="senha" value="" size="20" /><br><br>
            <label>CPF: </label>
            <input type="text" name="cpf" value="" size="15" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" />
        </form>
        
    </body>
</html>
