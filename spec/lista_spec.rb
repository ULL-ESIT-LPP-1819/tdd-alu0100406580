RSpec.describe Lista do
    it "has a version number" do
      expect(Lista::VERSION).not_to be nil
    end
  
    describe Lista do
      before :each do
        include Enumerable, Comparable

        @lista1 = ListaDobleEnlazada.new()
        @lista2 = ListaDobleEnlazada.new()
        @cañaManzana1 = Tabla.new(21.0,16.0,47.0,18.0,5.3,0.7)
        @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.8)
        @cañaManzana3 = Tabla.new(23.0,16.0,47.0,18.0,5.3,0.2)
        @cañaManzana4 = Tabla.new(25.0,17.0,49.0,18.0,5.3,1.7)
        @cañaManzana5 = Tabla.new(27.0,16.0,49.0,18.0,5.3,0.4)

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

      it "Lista vacía" do
        expect(@lista1.is_empty?).to eq(true)
      end

      it "Mostrar Lista" do
        expect(@lista1.to_s).to eq("Lista Vacía")
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        @lista1.insertaAtras(55)
        @lista1.insertaAtras(17)
        @lista1.insertaAdelante(13)
        @lista1.insertaAdelante(22)
        expect(@lista1.to_s).to eq([22, 13, 22, 13, 55, 17, 55, 17])
      end

      it "Lista según los gramos de sal" do
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAdelante(@cañaManzana4)
        @lista1.insertaAdelante(@cañaManzana5)
        expect(@lista1.sal(mayor,6) < @lista2).to eq(true)
      end
    
    end
end
