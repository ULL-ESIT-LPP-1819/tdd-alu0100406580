RSpec.describe Modulos do

describe Modulos do
    before :each do
      #include Enumerable, Comparable

      @lista1 = ListaDobleEnlazada.new()
      @lista2 = ListaDobleEnlazada.new()
      @cañaManzana1 = Tabla.new(21.0,16.0,47.0,18.0,5.3,0.7)
      @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.8)
      @paciente1 = Paciente.new("Jose", "Pérez", 29, 1,  75, 1.75)
      @paciente2 = Paciente.new("María", "Gutierrez", 35, 0, 62, 1.64)      
      end

      it "Comparar dos etiquetas de información nutricional" do
        expect(@cañaManzana1 < @cañaManzana2).to eq(true)
        expect(@cañaManzana1 > @cañaManzana2).to eq(false)
        expect(@cañaManzana1 >= @cañaManzana2).to eq(false)
        expect(@cañaManzana2 == @cañaManzana2).to eq(true)
      end

      it "Comparar la valoración nutricional entre dos individuos" do
        expect(@paciente1 < @paciente2).to eq(false)
        expect(@paciente1 > @paciente2).to eq(true)
        expect(@paciente1 >= @paciente2).to eq(true)
        expect(@paciente1 == @paciente1).to eq(true)
      end


    end
end
