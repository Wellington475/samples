<?php 


/**
 * 
 */
class Cad{

	private $data, $media, $pattern,$content, $alert,$json;
	
	function __construct(){

		$this->media = 'media/';
		$this->pattern = "/([a-zA-Z0-9\\_\\-\\.]+)\@([a-zA-Z0-9\\-]+)\.(com|com\\.br)/";
		$this->data = array(strip_tags(filter_input(INPUT_POST, 'email',      FILTER_SANITIZE_STRING)),
         strip_tags(filter_input(INPUT_POST, 'name',       FILTER_SANITIZE_STRING)),
         strip_tags(filter_input(INPUT_POST, 'surname',    FILTER_SANITIZE_STRING)),
         strip_tags(filter_input(INPUT_POST, 'password',   FILTER_SANITIZE_STRING)),
         strip_tags(filter_input(INPUT_POST, 're-password',FILTER_SANITIZE_STRING)));
    
         
      

		
	}

	public function _Validade_input(){

		
		   $this->content = '';
		   $fields = array('email', 'name', 'surname', 'password', 're-password', 'submit');

		      
		
         foreach ($this->data as $key => $value) {
         
         

            if(strlen($value) < 3) {

				$this->alert = '<div class="alert alert-danger" role="alert">
                         '.$fields[$key].' precisa ter mais que 3 caracteres.
                         </div>'; 
				
			}
			if(empty($value)) {
				$this->alert = '<div class="alert alert-danger" role="alert">
                         '.$fields[$key].' Não pode ficar vazio.
                         </div>';
				
			}
			if(!$fields[$key]) {
				     
                    echo $fields[$key];
                    
               
				
				$this->alert = '<div class="alert alert-danger" role="alert">
                         '.$fields[$key].' não existe.
                         </div>';
				
			}

			
			
		}

    if($this->data[3] != $this->data[4]){    //(bool)preg_match($pattern, $this->email)) {

          $this->alert = '<div class="alert alert-danger" role="alert">
                         As senhas não conferem.
                         </div>';
         
          

        }

        $var = preg_match($this->pattern, $this->data[0]);
        if($var == 0){

            $this->alert = '<div class="alert alert-danger" role="alert">
                       Email incorreto.
                        </div>';
         
        }



        return $this->alert;

}

      public function _cadastrar_user($submit=null){

      
     if($this->alert == null):

      if($submit == "cadastrar"):

      $this->content = array('EMAIL:'=>$this->data[0],
                         'NOME:'=>$this->data[1],
                         'SOBRENOME:'=>$this->data[2],             
                         'PASSWORD:'=>$this->data[3],
                         'RE-PASSWORD'=>$this->data[4]);

      $this->json = json_encode($this->content);

      $filename = $this->media.uniqid();
      $filename .= '.json';

      $file_user = fopen($filename, 'a+');
      fwrite($file_user, $this->json);
      fclose($file_user);

     
      $this->alert = '<script>
                       var email = '.$this->data[0].'
                       var nome = '.$this->data[1].'
                       var sobrenome = '.$this->data[2].'
                       </script>';

      
                        
      //$this->alert = "<meta HTTP-EQUIV='refresh' CONTENT='3;URL=".$_SERVER['PHP_SELF']."'>"; 

      elseif($submit == "cancelar"): 

      $this->alert= '<script type="text/javascript">
                     window.parent.document.formulario.reset();
                     </script>';                 

    endif;

    endif;

    return $this->alert;

         
}


      

      public function _set_erro(){
      	$this->_Validade_input();
      	$this->_cadastrar_user();

      	
      return $this->alert;
         

      }

	
}
