RSpec.describe Funcional do

    before :each do
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
        #grasas, grasasSat, hidratos, azucares, proteinas, sal
        galletasAvena = Tabla.new(13.6,3.4,51.5,18.5,4.7,0.3) #https://www.yazio.com/es/alimentos/galletas-de-avena.html
        mango = Tabla.new(1.3,0.3,50.3,45.9,2.8,0.09) #https://www.yazio.com/es/alimentos/mango.html
        huevoRevuelto = Tabla.new(7.6,2.9,1.0,0.8,6.5,0.1)#https://www.yazio.com/es/alimentos/huevos-revueltos.html
        panIntegral = Tabla.new(2.5,0.4,23.6,1.8,3.9,0.2)#https://www.yazio.com/es/alimentos/pan-de-trigo-integral.html
        zumoFrutas = Tabla.new(0.1,0.09,26.3,24.2,0.3,0.1)#https://www.yazio.com/es/alimentos/zumo-de-fruta.html
        almendras = Tabla.new(9.4,0.7,4.1,0.7,4.0,0.1)#https://www.yazio.com/es/alimentos/almendras-crudas.html
        pechugaPollo = Tabla.new(16.1,4.6,0.0,0.0,36.3,0.1)#https://www.yazio.com/es/alimentos/pechuga-de-pollo-cruda.html
        ensalada = Tabla.new(0.09,0.09,4.4,0.0,1.7,0.09)#https://www.yazio.com/es/alimentos/ensalada-de-verduras.html
        arrozBlanco = Tabla.new(0.4,0.1,44.5,0.09,4.3,0.09)#https://www.yazio.com/es/alimentos/arroz-blanco-cocinado.html
        pan = Tabla.new(0.9,0.2,13.7,1.4,2.6,0.1)#https://www.yazio.com/es/alimentos/pan-blanco.html
        gelatina = Tabla.new(0.0,0.0,38.3,36.4,3.3,0.2)#https://www.yazio.com/es/alimentos/postre-de-gelatina.html
        ensaladaAtun = Tabla.new(19.0,3.2,19.3,0.0,32.9,0.8)#https://www.yazio.com/es/alimentos/ensalada-de-atun.html
        @menu3 = [galletasAvena, mango, huevoRevuelto, panIntegral, zumoFrutas, te, almendras, pechugaPollo, ensalada, arrozBlanco, pan, gelatina, ensaladaAtun]
        @menu4 = [sandwichPavo, manzana, solomillo, purePapa, yogurNaturalDanone, manzanaHorneada, chocapic, lecheSemi, cañaManzana, potaje, carnePapas]
        @menu5 = [sandwichPavo, te, manzana, solomillo, salsaChampi, purePapa, salsaChampi, purePapa, cañaManzana, potaje, carnePapas, flanChocolate] 
        @menu6 = [galletasAvena, mango, huevoRevuelto, panIntegral, purePapa, salsaChampi, purePapa, cañaManzana, potaje, carnePapas, flanChocolate]
        @menu7 = [sandwichPavo, te, huevoRevuelto, solomillo, panIntegral, zumoFrutas, te, manzanaHorneada, chocapic, lecheSemi,  pechugaPollo, ensalada, arrozBlanco]
        @menu8 = [flanChocolate, lecheSemi, chocapic, arrozBlanco, ensalada, solomillo, salsaChampi, gelatina, almendras, bolPolloArroz]
        @menu9 = [galletasAvena, flanChocolate, te, cañaManzana, guisadoPapaPescado, manzanaHorneada, yogurNaturalDanone, potaje, carnePapas, galletasAvena, cañaManzana]
        @menu10 = [ensaladaAtun, te, solomillo, salsaChampi, cañaManzana, flanChocolate, panIntegral, huevoRevuelto, mango, carnePapas, pan, bolPolloArroz, almendras]
        
        valEnermenus = lambda do |menu,index|
            listaKcal = menu.map.with_index{|x,i| x.valEnerKcal}
            kcal = listaKcal.inject(0){|sum,x| sum + x }.round(2)
            {:menu => index, :valorEnergetico => kcal}
        end
        @menus = [@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10]
        @menusEnergía = [valEnermenus.call(@menu1,1), valEnermenus.call(@menu2,2), valEnermenus.call(@menu3,3), valEnermenus.call(@menu4,4), valEnermenus.call(@menu5,5), valEnermenus.call(@menu6,6), valEnermenus.call(@menu7,7), valEnermenus.call(@menu8,8), valEnermenus.call(@menu9,9), valEnermenus.call(@menu10,10)]

        paciente1 = Paciente.new("Jose", "Pérez", 29, 1,  75, 175, 0.0)
        paciente2 = Paciente.new("María", "Gutierrez", 35, 0, 62, 164, 0.12)
        paciente3 = Paciente.new("Jacinto", "Camacho", 25, 1, 91, 183, 0.27)
        paciente4 = Paciente.new("Carlos", "Rodriguez", 57, 1, 84, 180, 0.27)
        paciente5 = Paciente.new("Susana", "Armas", 47, 0, 51, 159, 0.54)
        paciente6 = Paciente.new("Luis", "Martín", 36, 1,  81, 180, 0.12)
        paciente7 = Paciente.new("Juana", "López", 24, 0, 62, 164, 0.12)
        paciente8 = Paciente.new("Jhon", "Nash", 25, 1, 91, 183, 0.27)
        paciente9 = Paciente.new("Bill", "Murray", 49, 1, 88, 194, 0.0)
        paciente10 = Paciente.new("Alba", "González", 22, 0, 49, 160, 0.54)

        @pacientes = ListaDobleEnlazada.new()
        @pacientes.insertaAdelante(paciente1)
        @pacientes.insertaAdelante(paciente2)
        @pacientes.insertaAdelante(paciente3)
        @pacientes.insertaAdelante(paciente4)
        @pacientes.insertaAdelante(paciente5)
        @pacientes.insertaAdelante(paciente6)
        @pacientes.insertaAdelante(paciente7)
        @pacientes.insertaAdelante(paciente8)
        @pacientes.insertaAdelante(paciente9)
        @pacientes.insertaAdelante(paciente10)

        @pacientesEnergia = ListaDobleEnlazada.new()
        @pacientesEnergia.insertaAdelante(paciente1.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente2.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente3.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente4.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente5.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente6.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente7.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente8.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente9.gastoEnergiaTotal)
        @pacientesEnergia.insertaAdelante(paciente10.gastoEnergiaTotal)

        end



    it "Prueba de si menus están bien los hashes dan una cadena y si es un array y la lista de doblemente enlazada está con pacientes y bien" do
        expect(@menusEnergía.is_a?(Array)).to eq(true)
        expect(@menusEnergía[1][:menu]).to eq(2)
        expect(@menusEnergía[1][:valorEnergetico]).to eq(2203.02)
        expect(@pacientes.is_a?(ListaDobleEnlazada)).to eq(true)
        expect(@pacientes.tamaño).to eq(10)
    end

    it "Obtener otro array para menús, y otra lista de pacientes con sus valores ordenados un bucle for" do
        menusOrdenados = @menusEnergía
        arr = []
        arr = @pacientes.bubbleSortEach!
        expect(@menusOrdenados.bubbleSortFor!).to eq([{menu:1, valorEnergetico:2500}, {menu:10, valorEnergetico:3900}])
        expect(arr).to eq([@paciente1])
    end
end