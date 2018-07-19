<?php
	$media = 'media/';
	$pattern = "/([a-zA-Z0-9\\_\\-\\.]+)\@([a-zA-Z0-9\\-]+)\.(com|com\\.br)/";
	
	if(is_array($_POST)) {
		$content = '';
		$fields = array('name', 'surname', 'email', 'password', 're-password');

		foreach ($_POST as $key => $value) {

			if(strlen($value)<3) {
				$alert = '<div class="alert alert-danger" role="alert">
                         '.$key.' precisa ter mais que 3 caracteres.
                         </div>'; 
				die();
			}

			if(empty($value)) {
				$alert = '<div class="alert alert-danger" role="alert">
                         '.$value.' Estar invalido.
                         </div>';
				die();
			}

			if(!in_array($key, $fields)) {
				$alert = '<div class="alert alert-danger" role="alert">
                         '.$key.' não existe.
                         </div>';
				die();
			}

			$content .= (strtoupper($key).': '.$value);
			$content .= "\n";


		}

		
		if($_POST['password']==$_POST['re-password'] && (bool)preg_match($pattern, $_POST['email'])) {

			

           

			$filename = $media.uniqid();
			$filename .= '.txt';

			$file_user = fopen($filename, 'a+');
			fwrite($file_user, $content);
			fclose($file_user);


			$alert = '<div class="alert alert-success" role="alert">
                          Cadastrado com Sucesso.
                         </div>';
		}
	}
	else
		$alert = '<div class="alert alert-danger" role="alert">
                 Campos em brancos.
                   </div>';;
?>
<script type="text/javascript">
	window.parent.document.formulario.reset();
</script>