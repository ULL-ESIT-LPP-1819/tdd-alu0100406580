RSpec.describe Lista do
    it "has a version number" do
      expect(Lista::VERSION).not_to be nil
    end
  
    describe Lista do
      before :each do
        include Enumerable

        @lista1 = ListaDobleEnlazada.new()
        @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.7)
        end 
  
      it "Creación de un método ListaDobleEnlazada" do
        expect(@lista1).not_to eq(nil)
        expect(@cañaManzana2).not_to eq(nil)
        expect(@cañaManzana2.grasas).to eq(22.0)
      end

      it "Insertar adelante" do
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        expect(@lista1.cabeza.prev).to eq(nil)
        expect(@lista1.cabeza.value).to eq(22)
        expect(@lista1.cabeza.next.value).to eq(13)
        expect(@lista1.tamaño).to eq(2)
      end

      it "Insertar Atrás" do
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        expect(@lista1.cola.value).to eq(17)
        expect(@lista1.cola.prev.value).to eq(55)
        expect(@lista1.tamaño).to eq(2)
      end 

      it "Extraer por delante" do
        expect(@lista1.extraerDelante).to eq("Lista Vacía")
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        expect(@lista1.extraerDelante).to eq(22)
        expect(@lista1.cabeza.next.value).to eq(55)
        expect(@lista1.tamaño).to eq(3)
      end

      it "Extraer por detrás" do
        expect(@lista1.extraerDetras).to eq("Lista Vacía")
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        expect(@lista1.extraerDetras).to eq(17)
        expect(@lista1.cola.value).to eq(55)
        expect(@lista1.tamaño).to eq(3)
      end

      it "Mostrar Lista" do
        expect(@lista.to_s).to eq("Lista Vacía")
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        expect(@lista.to_s).to eq(21,22,22,33,22,54,22)
      end
    
    end
end
