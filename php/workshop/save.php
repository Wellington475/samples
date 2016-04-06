<?php
	$media = 'media/';
	$pattern = "/([a-zA-Z0-9\\_\\-\\.]+)\@([a-zA-Z0-9\\-]+)\.(com|com\\.br)/";
	
	if(is_array($_POST)) {
		$content = '';
		$fields = array('name', 'surname', 'email', 'password', 're-password');
		foreach ($_POST as $key => $value) {
			if(strlen($value)<3) {
				echo $key.' precisa ter mais que 3 caracteres.';
				die();
			}
			if(empty($value)) {
				echo $value.' está inválido.';
				die();
			}
			if(!in_array($key, $fields)) {
				echo $key.' não existe.';
				die();
			}
			$content .= (strtoupper($key).': '.$value);
			$content .= "\n";
		}
		if($_POST['password']==$_POST['re-password'] && (bool)preg_match($pattern, $_POST['email'])) {

			$email = htmlspecialchars($_POST['email']);
			$name = htmlspecialchars($_POST['name']);
			$surname = htmlspecialchars($_POST['surname']);
			$password = htmlspecialchars($_POST['password']);

			$filename = $media.uniqid();
			$filename .= '.txt';

			$file_user = fopen($filename, 'a+');
			fwrite($file_user, $content);
			fclose($file_user);


			echo "Cadastrou :D";
		}
	}
	else
		echo 'Campos em branco';
?>
<script type="text/javascript">
	window.parent.document.formulario.reset();
</script>