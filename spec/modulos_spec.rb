RSpec.describe Modulos do

describe Modulos do
    before :each do
      #include Enumerable, Comparable

      @lista1 = ListaDobleEnlazada.new()
      @lista2 = ListaDobleEnlazada.new()
      @cañaManzana1 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.8)
      @cañaManzana2 = Tabla.new(21.0,16.0,47.0,18.0,5.3,0.7)
      @cañaManzana3 = Tabla.new(23.0,17.0,49.0,21.0,7.3,0.2)
      @paciente1 = Paciente.new("Jose", "Pérez", 29, 1,  75, 1.75)
      @paciente2 = Paciente.new("María", "Gutierrez", 35, 0, 62, 1.64)
      @paciente3 = Paciente.new("Jacinto", "Camacho", 25, 1, 91, 1.83)      
      end

      it "Comparar dos etiquetas de información nutricional" do
        expect(@cañaManzana1 < @cañaManzana2).to eq(false)
        expect(@cañaManzana1 > @cañaManzana2).to eq(true)
        expect(@cañaManzana1 >= @cañaManzana2).to eq(true)
        expect(@cañaManzana2 == @cañaManzana2).to eq(true)
      end

      it "Comparar la valoración nutricional entre dos individuos" do
        expect(@paciente1 < @paciente2).to eq(false)
        expect(@paciente1 > @paciente2).to eq(true)
        expect(@paciente1 >= @paciente2).to eq(true)
        expect(@paciente1 == @paciente1).to eq(true)
      end

      it "Método Collect, select, min, max listas de etiquetas de información nutrucional" do
        @lista1 = ListaDobleEnlazada.new()
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        expect(@lista1.collect{1}).to eq([1,1,1])
        #expect(@lista1.select{@cañaManzana2}).to eq(@cañaManzana2)
        expect(@lista1.max).to eq(@cañaManzana3)
        expect(@lista1.min).to eq(@cañaManzana2)
        expect(@lista1.sort).to eq([@cañaManzana2,@cañaManzana1,@cañaManzana3])
      end

      it "Método collect, select, min, max de valoraciones nutricionales de individuos" do
        @lista1 = ListaDobleEnlazada.new()
        @lista1.insertaAdelante(@paciente1)
        @lista1.insertaAdelante(@paciente2)
        @lista1.insertaAdelante(@paciente3)
        expect(@lista1.collect{1}).to eq([1,1,1])
        expect(@lista1.select{@paciente2}).to eq(@paciente2)
        expect(@lista1.max).to eq(@paciente3)
        expect(@lista1.min).to eq(@paciente1)
        expect(@lista1.sort).to eq([@paciente2,@paciente1,@paciente3])
      end


    end
end
