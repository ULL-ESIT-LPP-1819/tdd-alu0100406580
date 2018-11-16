RSpec.describe Lista do
    it "has a version number" do
      expect(Lista::VERSION).not_to be nil
    end
  
    describe Lista do
      before :each do
        @lista1 = ListaDobleEnlazada.new()
        @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.7)
        end 
  
      it "Creación de un método ListaDobleEnlazada" do
        expect(@lista1).not_to eq(nil)
        expect(@cañaManzana2).not_to eq(nil)
        expect(@cañaManzana2.grasas).to eq(22.0)
      end

      it "Insertar adelante" do
        @lista1.insertaAdelante(22)
        expect(@lista1.cabeza.value).to eq(22)
      end

      it "Insertar Atrás" do
        @lista1.insertaAtras(55)
        expect(@lista1.cola.value).to eq(55)
      end 
    end
end
