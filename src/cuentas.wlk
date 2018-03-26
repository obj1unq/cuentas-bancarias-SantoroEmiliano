//HOLA prueba

object cuentaPepe{
	var saldo=0
	method saldo(){
		return saldo
	}
	method depositar(monto){
		saldo+=monto
	}
	method extraer(monto){
		if(self.saldo()>monto){
		saldo-=monto
	    }
    }	
}
object cuentaJulian{
	var saldo=0
	method saldo(){
		return saldo
	}
	method depositar(monto){
		saldo+=monto*0.8
	}
	method extraer(monto){
		if(self.saldo()>monto+5){
		saldo-=monto+5
	    }
    }
}
object cuentaDelPadre{
	var saldo=0
	method saldo(){
		return saldo*14.70
	}
	method depositar(monto){
		saldo+=monto/15.10
	}
	method extraer(monto){
		if(self.saldo()>monto/14.70){
		saldo-=monto/14.70
	    }
    }
}
object casa{
	var gastos=0
	var cuentaQuePaga=cuentaPepe
	var ultimaCompra = cama
	var comproComida=false
	
	method gastar(importe){
		cuentaQuePaga.extraer(importe)
		gastos+=importe
	}
	method comprar(cosa){
		self.gastar(cosa.precio())
		ultimaCompra=cosa
		if(cosa.esComida()){
			comproComida=true
		}
	}
	method derrochona(){
		return gastos>5000
	}
	method bacan(){
		return (cuentaQuePaga.saldo()>40000)
	}
	method vieneDeEquiparse(){
		return ultimaCompra.esElectrodomestico()or ultimaCompra.precio()>5000
	}
	method puedeComprar(cosa){
	    return cuentaQuePaga.saldo()>=cosa.precio()
	}
	method cuentaParaGastos(){
		return cuentaQuePaga
	}
	method tieneComida(){
		return comproComida
	}
}
object cuentaCombinada{
	var cuentaPrimaria=cuentaPepe
	var cuentaSecundaria=cuentaJulian
	method saldo(){
		return cuentaPrimaria.saldo()+cuentaSecundaria.saldo()
	}
	
	//si el saldo de la cuenta secundaria es menor a
	//1000 deposita en dicha cuenta. En cualquier otro caso deposita en la primaria.
	method depositar(unaCantidadPesos){
       if(cuentaSecundaria.saldo()<1000){
       	    cuentaSecundaria.depositar(unaCantidadPesos)
       }else{
       	 cuentaPrimaria.depositar(unaCantidadPesos)
       }
	}
	
	//Extrae todo lo que puede de la cuenta primaria y
	//el resto de la secundaria
	method extraer(unaCantidadPesos){
		if(unaCantidadPesos<cuentaPrimaria.saldo()){
			cuentaPrimaria.extraer(unaCantidadPesos)
		}else{
			cuentaSecundaria.extraer(unaCantidadPesos-cuentaPrimaria.saldo())
			cuentaPrimaria.extraer(cuentaPrimaria.saldo())
		}
    }
	
}


object heladera{
    method precio() = 20000
    method esComida() = false
    method esElectrodomestico()= true
}
object cama{
    method precio() = 8000
    method esComida() = false
    method esElectrodomestico()= false
}
object tiraDeAsado{
    method precio() = 350
    method esComida() = true
    method esElectrodomestico()= false
}
object fideos{
    method precio() = 50
    method esComida() = true
    method esElectrodomestico()= false
}
object plancha{
    method precio() = 1200
    method esComida() = false
    method esElectrodomestico()= true
}


/////////////////////////////
