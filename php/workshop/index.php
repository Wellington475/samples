<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Formulário :)</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="static/css/normalize.css">
		<link rel="stylesheet" href="static/css/skeleton.css">
		<style type="text/css">
			label span {
				color: silver;
				font-size: 12px;
				padding-left: 5px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="eleven">
				<div class="row">
					<h2>Formul&aacute;rio</h2>
				</div>
			</div>
			<div class="eleven">
				<form name="formulario" method="post" action="save.php" target="loaderframe">
					<div class="row">
						<div class="eleven">
							<label for="email">E-Mail</label>
							<input name="email" class="u-full-width" placeholder="test@email.com" id="email" type="email">
						</div>
					</div>
					<div class="row">
						<div class="six columns">
							<label for="name">Nome</label>
							<input name="name" class="u-full-width" id="name" type="text">
						</div>
						<div class="six columns">
							<label for="surname">Sobrenome</label>
							<input name="surname" class="u-full-width" id="surname" type="text">
						</div>
					</div>
					<div class="row">
						<div class="six columns">
							<label for="senha">Senha<span>* Mais de 4 caracteres</span></label>
							<input name="password" class="u-full-width" placeholder="Senha" id="senha" type="password">
						</div>
						<div class="six columns">
							<label for="re-senha">Repita a senha</label>
							<input name="re-password" class="u-full-width" placeholder="Senha" id="re-senha" type="password">
						</div>
					</div>
					<input class="button-primary" value="Salvar" type="submit">
					<input class="button" value="Cancelar" type="reset">
				</form>
			</div>
			<div class="eleven">
				<div class="row">
					<iframe src="" name="loaderframe" frameborder="0" width="100%" height="200px"></iframe>
				</div>
			</div>
		</div>
	</body>
</html>