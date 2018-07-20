<?php 
require_once("Cad.class.php");

$botao = strip_tags(filter_input(INPUT_POST, 'submit',FILTER_SANITIZE_STRING));

if($botao): 
$cadastro = new Cad();
$recebe = $cadastro->_cadastrar_user($botao);
$erro=$cadastro->_set_erro();

endif;

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Formulário Cadastro de Usuario</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>

		
			<div class="card-header">
				<h2 class="">Cadastro de usuario</h2>
			</div>
			<div class="contener-form">
				<?php 
				    
                   if(isset($erro)): 

                   	echo $erro; 

                   endif;
				?>
				<form name="formulario" method="post" action="" target="loaderframe" id="formulario">
					<label for="email" class="label">Email</label>
					<input type="email" name="email" class="form-control" placeholder="Enter email" id="email" required>
					<label for="nome" class="label">Nome</label>
					<input type="name" name="name" class="form-control" placeholder="Digte seu Nome" id="name"required=>
					<label for="sobrenome" class="label">Sobrenome</label>
					<input type="surname" name="surname" class="form-control" placeholder="Digte o Sobrenome" id="surname" required>
					<label for="senha" class="label">Senha</label>
					<input type="password" name="password" class="form-control" placeholder="Digte a Senha" id="password" required>
					<label for="re-senha" class="label">Repita a Senha</label>
					<input type="password" name="re-password" class="form-control" placeholder="Digte a senha novamente" id="re-password" required>
					<button class="btn btn-info" type="submit" name="submit" value="cadastrar">Salvar</button>
					<button class="btn btn-info" type="reset" name="submit" value="cancelar">Cancelar</button>
				</form>	
				
			</div>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script type="text/javascript" src="script.js"></script>
					
	</body>
</html>