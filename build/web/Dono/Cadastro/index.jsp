<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Dono</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFF5E9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background: #FFFFFF;
            width: 480px;
            padding: 30px;
            margin-top: 40px;
            border-radius: 14px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
            border: 2px solid #E8DFD6;
        }

        .logo {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .logo img {
            width: 110px;
        }

        h2 {
            text-align: center;
            color: #6B3F2A;
            font-weight: bold;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #6B3F2A;
        }

        input[type="text"],
        input[type="email"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 12px;
            background: #FFF5E9;
            border: 1px solid #D8C9BD;
            border-radius: 6px;
            color: #6B3F2A;
            box-sizing: border-box;
        }

        button,
        input[type="reset"] {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
            color: white;
        }

        button {
            background: #F2A344;
        }
        button:hover {
            background: #D98827;
        }

        input[type="reset"] {
            background: #6B3F2A;
        }
        input[type="reset"]:hover {
            background: #4F2E1F;
        }

        .links {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            gap: 8px;
            text-align: center;
        }

        .links a {
            color: #6B3F2A;
            font-weight: bold;
            text-decoration: none;
        }

        .links a:hover {
            color: #F2A344;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo">
        <img src="../../imagens/site.jpg" alt="Logo">
    </div>

    <h2>Cadastro de Dono</h2>

    <form method="post" 
          action="${pageContext.request.contextPath}/SalvarImagem" 
          enctype="multipart/form-data">

        <label>Nome:</label>
        <input type="text" name="nome" required>

        <label>CPF:</label>
        <input type="text" name="cpf" required>

        <label>Telefone:</label>
        <input type="text" name="telefone">

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Selecione uma imagem</label>
        <input type="file" name="imagem_dono" accept=".jpeg,.png,.jpg">

        <button type="submit">Cadastrar Dono</button>
        <input type="reset" value="Limpar">
    </form>

    <div class="links">
        <a href="../Lista/dono_lista.jsp">Ver lista de Donos</a>
        <a href="../../index.html">Voltar</a>
    </div>
</div>

</body>
</html>