var norte, sul, leste, oeste;
var dash

norte	= keyboard_check(vk_up) 
sul		=keyboard_check(vk_down) 
leste	=keyboard_check(vk_right) 
oeste	=keyboard_check(vk_left) 
dash	=keyboard_check(vk_space)

#region movimento
if(norte){
		y-=spd
		ultimoLado="Norte"
	}
if(sul){
		y+=spd
		ultimoLado="Sul"
	}
if(leste){
		x+=spd
		image_xscale=1
		ultimoLado="Leste"
	}
if(oeste){
		x-=spd
		image_xscale=-1
		ultimoLado="Oeste"
	}
	if(dashDelay>0){
		dashDelay--	
	}
#endregion

switch (estado) {
	
    case "Parado": {
        sprite_index = sprPlayerParado;
        if (norte or sul) {
            estado = "MovendoV";
            image_index = 0;
        }
        if (leste or oeste) {
            estado = "MovendoH";
            image_index = 0;
        }
		if(dash and dashDelay<=0){
			estado="Dash"	
			image_index=0
		}
        break;
    }
    
	case "MovendoH": {
        sprite_index = sprPlayerMovendoH;
        if (!norte and !sul and !leste and !oeste) {
            estado = "Parado";
            image_index = 0;
        }
		if(!leste and !oeste){
			estado="MovendoV"
			image_index=0
		}if(dash and dashDelay<=0){
			estado="Dash"	
			image_index=0
		}
        break;
    }
   
	case  "MovendoV": {
        sprite_index = sprPlayerMovendoV;
        if (!norte and !sul and !leste and !oeste) {
            estado = "Parado";
            image_index = 0;
        }
        if (leste or oeste) {
            estado = "MovendoH";
            image_index = 0;
		}
		if(dash and dashDelay<=0){
			estado="Dash"	
			image_index=0
		}
        break;
    }
	
	case "Dash":{
		sprite_index=sprPlayerDash
		dashDelay=30
		switch(ultimoLado){
			case"Norte":y-=rolagem
			break;
			case"Sul": y+=rolagem
			break;
			case"Leste":x+=rolagem
			break;
			case"Oeste":x-=rolagem
			break;
		}
		if(image_index>=image_number-1){
			estado="Parado"	
		}
	break;	
	}
	
}



