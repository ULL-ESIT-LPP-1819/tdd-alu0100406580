RSpec.describe Modulos do

describe Modulos do
    before :each do
      #include Enumerable, Comparable

      @lista1 = ListaDobleEnlazada.new()
      @lista2 = ListaDobleEnlazada.new()
      @cañaManzana1 = Tabla.new(21.0,16.0,47.0,18.0,5.3,0.7)
      @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.8)
      @cañaManzana3 = Tabla.new(23.0,16.0,47.0,18.0,5.3,0.2)
      @cañaManzana4 = Tabla.new(25.0,17.0,49.0,18.0,5.3,1.7)
      @cañaManzana5 = Tabla.new(27.0,16.0,49.0,18.0,5.3,0.4)
      end

      it "Comparar dos etiquetas de información nutricional" do
        expect(@cañaManzana1 < @cañaManzana2).to eq(true)
        expect(@cañaManzana1 > @cañaManzana2).to eq(false)
        expect(@cañaManzana1 >= @cañaManzana2).to eq(false)
        expect(@cañaManzana2 == @cañaManzana2).to eq(true)
      end


    end
end
