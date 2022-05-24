 


var clave = document.getElementById('pass');
var usuario = document.getElementById('usuario');



btn.addEventListener('click', function(evt)
{


      if(clave.value === ''){
        
          console.log('el campo contraseña es obligatorio')
          evt.preventDefault();
          return false;
      
      }else if(usuario.value === ''){
      
      console.log('el campo de usuario es obligatorio')
          evt.preventDefault();
          return false;
      
      }else if(usuario.value.length > 20){
      
        console.log('El nombre del usuario es demasiado largo')
          evt.preventDefault();
          return false;
      
      }
     } );
