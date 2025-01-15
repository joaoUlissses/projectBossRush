var Norte, Sul, Leste, Oeste;
var Dash


Norte	= keyboard_check(vk_up) 
Sul		=keyboard_check(vk_down) 
Leste	=keyboard_check(vk_right) 
Oeste	=keyboard_check(vk_left) 
Dash	=keyboard_check(vk_space)

hsp = (Leste-Oeste) *spd
vsp = (Sul- Norte)	*spd

switch (estado) {
	
    case "Parado": {
        sprite_index = sprPlayerParado;
        if (Norte or Sul) {
            estado = "MovendoV";
            image_index = 0;
        }
        if (Leste or Oeste) {
            estado = "MovendoH";
            image_index = 0;
        }
		if(Dash and DashDelay<=0){
			estado="Dash"	
			image_index=0
		}
		
		#region movimento
		if(hsp<0){
			image_xscale=-1	
		}else if(hsp>0){
			image_xscale=1	
		}
		//colisão com a parede
		if(place_meeting(x, y + vsp, objBloco)){ 
			vsp=0
		}if(place_meeting(x + hsp, y, objBloco)){ 
			hsp=0
		}
		if(DashDelay>0){
			DashDelay--	
		}
		// Verifique os botões pressionados
		if (keyboard_check_pressed(vk_up)) {
		    ultimoLado = "Norte";
		} else if (keyboard_check_pressed(vk_down)) {
		    ultimoLado = "Sul";
		} else if (keyboard_check_pressed(vk_right)) {
		    ultimoLado = "Leste";
		} else if (keyboard_check_pressed(vk_left)) {
		    ultimoLado = "Oeste";
		}

		x+=hsp
		y+=vsp
		#endregion
        break;
    }
    
	case "MovendoH": {
        sprite_index = sprPlayerMovendoH;
        if (!Norte and !Sul and !Leste and !Oeste) {
            estado = "Parado";
            image_index = 0;
        }
		if(!Leste and !Oeste){
			if(Norte or Sul){
				estado="MovendoV"
			}else{
				estado="Parado"
			}
			image_index=0
		}if(Dash and DashDelay<=0){
			estado="Dash"	
			image_index=0
		}
		#region movimento
		if(hsp<0){
			image_xscale=-1	
		}else if(hsp>0){
			image_xscale=1	
		}
		//colisão com a parede
		if(place_meeting(x, y + vsp, objBloco)){ 
			vsp=0
		}if(place_meeting(x + hsp, y, objBloco)){ 
			hsp=0
		}
		if(DashDelay>0){
			DashDelay--	
		}
		// Verifique os botões pressionados
		if (keyboard_check_pressed(vk_up)) {
		    ultimoLado = "Norte";
		} else if (keyboard_check_pressed(vk_down)) {
		    ultimoLado = "Sul";
		} else if (keyboard_check_pressed(vk_right)) {
		    ultimoLado = "Leste";
		} else if (keyboard_check_pressed(vk_left)) {
		    ultimoLado = "Oeste";
		}

		x+=hsp
		y+=vsp
		#endregion
        break;
    }
   
	case  "MovendoV": {
        sprite_index = sprPlayerMovendoH;
        if (!Norte and !Sul and !Leste and !Oeste) {
            estado = "Parado";
            image_index = 0;
        }
        if (Leste or Oeste) {
            estado = "MovendoH";
            image_index = 0;
		}
		if(Dash and DashDelay<=0){
			estado="Dash"	
			image_index=0
		}
		
		
		#region movimento
		if(hsp<0){
			image_xscale=-1	
		}else if(hsp>0){
			image_xscale=1	
		}
		//colisão com a parede
		if(place_meeting(x, y + vsp, objBloco)){ 
			vsp=0
		}if(place_meeting(x + hsp, y, objBloco)){ 
			hsp=0
		}
		if(DashDelay>0){
			DashDelay--	
		}
		// Verifique os botões pressionados
		if (keyboard_check_pressed(vk_up)) {
		    ultimoLado = "Norte";
		} else if (keyboard_check_pressed(vk_down)) {
		    ultimoLado = "Sul";
		} else if (keyboard_check_pressed(vk_right)) {
		    ultimoLado = "Leste";
		} else if (keyboard_check_pressed(vk_left)) {
		    ultimoLado = "Oeste";
		}

		x+=hsp
		y+=vsp
		#endregion
        break;
    }
	
	case "Dash": {
	    DashDelay = 30;

	    var dx=0
		var dy = 0
		
	    switch (ultimoLado) {
	        case "Norte":
	            dy = -DashVel;
	            sprite_index = sprPlayerDashV;
	            break;
	        case "Sul":
	            dy = DashVel;
	            sprite_index = sprPlayerDashV;
	            break;
	        case "Leste":
	            dx = DashVel;
	            sprite_index = sprPlayerDash;
	            break;
	        case "Oeste":
	            dx = -DashVel;
	            sprite_index = sprPlayerDash;
	            break;
	    }
			
		#region coilisao do Dash
	    repeat(abs(dx)) {
	        if (!place_meeting(x + sign(dx), y, objBloco)) {
	            x += sign(dx);
	        } else {
	            dx = 0;
	            break;
	        }
	    }
	    repeat(abs(dy)) {
	        if (!place_meeting(x, y + sign(dy), objBloco)) {
	            y += sign(dy);
	        } else {
	            dy = 0;
	            break;
	        }
	    }
		#endregion
		
	    if (image_index >= image_number - 1) {
	        estado = "Parado";
	    }break;
}
	
}



