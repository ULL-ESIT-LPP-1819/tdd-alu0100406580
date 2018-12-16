RSpec.describe Menu do

    before :each do
        include Enumerable
        include Comparable

        sandwichPavo = Tabla.new(15.5,6.4,33.3,0.0,20.7,0.01)
        te = Tabla.new(2.0,0.0,0.71,0.0,0.0,0.0)
        manzana = Tabla.new(0.23,0.039,19.06,14.34,0.36,0.0)
        solomillo = Tabla.new(26.9,10.6,0.0,0.0,64.1,0.2) #https://www.yazio.com/es/alimentos/solomillo-de-ternera-cocinado.html
        salsaChampi = Tabla.new(6.4,1.0,13.0,2.0,3.0,1.4) #https://www.yazio.com/es/alimentos/salsa-de-champinon.html
        purePapa = Tabla.new(6.8,1.4,35.5,1.2,4.0,0.7) #https://www.yazio.com/es/alimentos/pure-de-patatas.html
        bolPolloArroz = Tabla.new(1.6,0.3,22.5,4.1,5.7,0.3) #https://www.yazio.com/es/alimentos/bol-de-arroz-con-pollo.html
        yogurNaturalDanone = Tabla.new(3.6,2.3,5.0,5.0,4.0,0.16) #https://cuantoazucar.com/alimentos/ficha/g0213db
        guisadoPapaPescado = Tabla.new(2.07,0.48,10.87,0.63,13.98,1.35) #https://calcular-imc.net/alimento/guisado-de-patata-de-pescado.html
        manzanaHorneada = Tabla.new(1.52,0.29,11.07,11.3,0.17,0.01) #https://calcular-imc.net/alimento/manzana-horneada.html
        @menu1 = []
        @menu1 << sandwichPavo << te << manzana << solomillo << salsaChampi << purePapa << bolPolloArroz << yogurNaturalDanone << guisadoPapaPescado << manzanaHorneada
        #grasas, grasasSat, hidratos, azucares, proteinas, sal
        chocapic = Tabla.new(2.8,1.0,45.4,17.2,4.8,0.22) #https://cuantoazucar.com/alimentos/ficha/g0232fb
        lecheSemi = Tabla.new(4.6,3.0,14.1,14.1,8.8,0.34) #https://cuantoazucar.com/alimentos/ficha/g0207f6
        solomillo = Tabla.new(26.9,10.6,0.0,0.0,64.1,0.2) #https://www.yazio.com/es/alimentos/solomillo-de-ternera-cocinado.html
        salsaChampi = Tabla.new(6.4,1.0,13.0,2.0,3.0,1.4) #https://www.yazio.com/es/alimentos/salsa-de-champinon.html
        purePapa = Tabla.new(6.8,1.4,35.5,1.2,4.0,0.7) #https://www.yazio.com/es/alimentos/pure-de-patatas.html
        cañaManzana = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.8) #Práctica pasada
        potaje = Tabla.new(12.43,3.18,26.86,4.22,12.36,0.4) #https://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/gen%C3%A9rico/potaje
        carnePapas = Tabla.new(5.75,1.5,21.9,2.77,16.63,0.55) #https://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/gen%C3%A9rico/estofado-de-carne-con-papas-y-verduras-en-salsa-de-tomate
        flanChocolate = Tabla.new(3.3,2.1,20.8,19.8,2.5,0.0) #https://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/hacendado/flan-de-chocolate/100g
        @menu2 = []
        @menu2 << chocapic << lecheSemi << solomillo << salsaChampi << purePapa << cañaManzana << potaje << carnePapas << flanChocolate
        @menu1KCal1 = @menu1.map.with_index{|x,i| x.valEnerKcal}
        @menu1KCalTotal = @menu1KCal1.inject(0){|sum,x| sum + x }.round(2)
        @menu1KCal2 = @menu2.map.with_index{|x,i| x.valEnerKcal}
        @menu2KCalTotal = @menu1KCal2.inject(0){|sum,x| sum + x }.round(2)


        @paciente1 = Paciente.new("Jose", "Pérez", 29, 1,  75, 175, 0.0)
        @paciente2 = Paciente.new("María", "Gutierrez", 35, 0, 62, 164, 0.12)
        @paciente3 = Paciente.new("Jacinto", "Camacho", 25, 1, 91, 183, 0.27)
        @paciente4 = Paciente.new("Carlos", "Rodriguez", 57, 1, 84, 180, 0.27)
        @paciente5 = Paciente.new("Susana", "Armas", 47, 0, 51, 159, 0.54)

        @pacientes = []
        @pacientes << @paciente1 << @paciente2 << @paciente3 << @paciente4 << @paciente5

        @pesoTeorico = @pacientes.map.with_index{|x,i| (x.talla - 150) * 0.75 + 50}
        @gastoEnerBasal = @pacientes.map.with_index do |x,i|  
            if x.genero == 1
                (x.peso * 10) + (6.25 * x.talla) - (5 * x.edad) + 5
            else
                (x.peso * 10) + (6.25 * x.talla) - (5 * x.edad) - 161
            end
        end
        @efectoTermogeno = @gastoEnerBasal.map{|e| (e * 0.10).round(2)}
        
        @gastoActividadFisica = @pacientes.collect{|x| x.factorActividad}
        @gastoActividadFisica =  @gastoActividadFisica.zip(@gastoEnerBasal).map{|x, y| (x * y).round(2)}
        @gastoEnerTotal = @gastoEnerBasal.zip(@efectoTermogeno,@gastoActividadFisica).map{|x,y,z| (x + y + z).round(2)}
        @menu1Requisitos = @gastoEnerTotal.select{|x| x.between?(@menu1KCalTotal*0.9,@menu1KCalTotal*1.10)}
        @menu2Requisitos = @gastoEnerTotal.select{|x| x.between?(@menu2KCalTotal*0.9,@menu2KCalTotal*1.10)}
        
        seleccionMenu = lambda do |number,lista|
            lista.each do |x|
                if number == x
                    return x
                end
            end
            return -1
        end

        @resultadomenu1 = @gastoEnerTotal.map.with_index{|x,i| "Paciente #{i}: #{@pacientes[i].nombre} #{@pacientes[i].apellidos} menú perfecto" if seleccionMenu.call(x,@menu1Requisitos) != -1}.select{|x| x!=nil}
        @resultadomenu2 = @gastoEnerTotal.map.with_index{|x,i| "Paciente #{i}: #{@pacientes[i].nombre} #{@pacientes[i].apellidos} menú perfecto" if seleccionMenu.call(x,@menu2Requisitos) != -1}.select{|x| x!=nil}
    end



    it "Prueba de si menus.to_s dan una cadena y si el factor de actividad está bien" do
        expect(@menu1.to_s).to be_a_kind_of(String)
        expect(@menu2.to_s).to be_a_kind_of(String)
        expect(@paciente2.factorActividad).to eq(0.12)
    end
    
    it "Peso Teorico, Gasto Energético Basal pacientes y Energía de los menus" do
        expect(@menu1KCalTotal).to eq(1667.66)
        expect(@menu2KCalTotal).to eq(2203.02)
        expect(@pesoTeorico).to eq([68.75, 60.5, 74.75, 72.5, 56.75])
        expect(@gastoEnerBasal).to eq([1703.75, 1309.0, 1933.75, 1685.0, 1107.75])
        expect(@efectoTermogeno).to eq([170.38, 130.9, 193.38, 168.5, 110.78])
        expect(@gastoActividadFisica).to eq([0.0, 157.08, 522.11, 454.95, 598.19])
    end

    it "Muestra de resultados de los menus" do
        expect(@menu1Requisitos).to eq([1596.98, 1816.72])
        expect(@menu2Requisitos).to eq([2308.45])
        expect(@resultadomenu1).to eq(["Paciente 1: María Gutierrez menú perfecto", "Paciente 4: Susana Armas menú perfecto"])
        expect(@resultadomenu2).to eq(["Paciente 3: Carlos Rodriguez menú perfecto"])
    end       
end
    