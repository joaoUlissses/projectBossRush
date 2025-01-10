var norte, sul, leste, oeste;
var dash

norte	= keyboard_check(vk_up) 
sul		=keyboard_check(vk_down) 
leste	=keyboard_check(vk_right) 
oeste	=keyboard_check(vk_left) 
dash	=keyboard_check(vk_space)

#region movimento

velH = (leste-oeste) *spd
velV = (norte - sul)	*spd

rolagemH=spd*3*image_xscale
if(ultimoLado="Norte"){
	rolagemV=spd*3
}if(ultimoLado="Sul"){
	rolagemV=spd*3*-1
}
xscale = image_xscale

if(!place_meeting(x,y+3,objTotem)){
	if(norte){
			y-=velV
			ultimoLado="Norte"
	}
	if(sul){
			y-=velV
			ultimoLado="Sul"
	}
}if(place_meeting(x,y+3,objTotem)){
		if(ultimoLado=="Norte"){
			y+=5	
		}
		if(ultimoLado=="Sul"){
			y-=5	
		}
}
if (!place_meeting(x+3, y, objTotem)) { 
	if (leste) {
        x += velH;                              
        image_xscale = 1;                       
        ultimoLado = "Leste";
    }
	
	if (oeste) {
        x += velH;
        image_xscale = -1; 
        ultimoLado = "Oeste"; 
    }
}else if(place_meeting(x+3, y, objTotem)) {
			if(ultimoLado=="Oeste"){
			x+=5	
		}
		if(ultimoLado=="Leste"){
			x-=5	
		}
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
			if(norte or sul){
				estado="MovendoV"
			}else{
				estado="Parado"
			}
			image_index=0
		}if(dash and dashDelay<=0){
			estado="Dash"	
			image_index=0
		}
        break;
    }
   
	case  "MovendoV": {
        sprite_index = sprPlayerMovendoVN;
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
		dashDelay=30
		switch(ultimoLado){
			case"Norte":y-=rolagemV
		sprite_index=sprPlayerDashV
			break;
			case"Sul": y-=rolagemV
		sprite_index=sprPlayerDashV	
			break;
			case"Leste":x+=rolagemH
		sprite_index=sprPlayerDash	
			break;
			case"Oeste":x+=rolagemH
		sprite_index=sprPlayerDash	
			break;
		}
		if(image_index>=image_number-1){
			estado="Parado"	
		}
	break;	
	}
	
}



