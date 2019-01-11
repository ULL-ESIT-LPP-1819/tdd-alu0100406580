RSpec.describe Lista do
  
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
  
      it "Creación de un método ListaDobleEnlazada" do
        expect(@lista1).not_to eq(nil)
        expect(@cañaManzana2).not_to eq(nil)
        expect(@cañaManzana2.grasas).to eq(22.0)
      end

      it "Insertar adelante" do
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAdelante(@cañaManzana4)
        @lista1.insertaAdelante(@cañaManzana5)
        expect(@lista1.cabeza.prev).to eq(nil)
        expect(@lista1.cabeza.value).to eq(@cañaManzana5)
        expect(@lista1.cabeza.next.value).to eq(@cañaManzana4)
        expect(@lista1.tamaño).to eq(5)
      end

      it "Insertar Atrás" do
        @lista1.insertaAtras(@cañaManzana1)
        @lista1.insertaAtras(@cañaManzana2)
        @lista1.insertaAtras(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana4)
        @lista1.insertaAtras(@cañaManzana5)
        expect(@lista1.cola.value).to eq(@cañaManzana5)
        expect(@lista1.cola.prev.value).to eq(@cañaManzana4)
        expect(@lista1.tamaño).to eq(5)
      end 

      it "Extraer por delante" do
        expect(@lista1.extraerDelante).to eq("Lista Vacía")
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana4)
        @lista1.insertaAtras(@cañaManzana5)
        expect(@lista1.extraerDelante).to eq(@cañaManzana3)
        expect(@lista1.cabeza.next.value).to eq(@cañaManzana1)
        expect(@lista1.tamaño).to eq(5)
      end

      it "Extraer por detrás" do
        expect(@lista1.extraerDetras).to eq("Lista Vacía")
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana4)
        @lista1.insertaAtras(@cañaManzana5)
        expect(@lista1.extraerDetras).to eq(@cañaManzana5)
        expect(@lista1.cola.value).to eq(@cañaManzana4)
        expect(@lista1.tamaño).to eq(5)
      end

      it "Lista vacía" do
        expect(@lista1.is_empty?).to eq(true)
        @lista1.insertaAtras(@cañaManzana1)
        expect(@lista1.is_empty?).to eq(false)
      end

      it "Mostrar Lista" do
        expect(@lista1.to_s).to eq("Lista Vacía")
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana3)
        @lista1.insertaAtras(@cañaManzana4)
        @lista1.insertaAtras(@cañaManzana5)
        expect(@lista1.to_s).to eq([@cañaManzana3, @cañaManzana2, @cañaManzana1, @cañaManzana3, @cañaManzana4, @cañaManzana5])
      end

      it "Lista según los gramos de sal" do
        def salComparacion(lista,comparacion,gramos)
          if (lista.tamaño == 0)
              return "Lista Vacía"
          else
              nodoAux = lista.cabeza
              arr = []
              if (comparacion == "<" )
                  while(nodoAux != nil)
                      if (nodoAux.value.sal < gramos)
                          arr << nodoAux.value
                      end
                          nodoAux = nodoAux["next"]
                  end
                  return arr
              end
              if (comparacion == "=" )
                  while(nodoAux != nil)
                      if (nodoAux.value.sal == gramos)
                          arr << nodoAux.value
                      end
                          nodoAux = nodoAux["next"]
                  end
                  return arr
              end
              if (comparacion == ">" )
                  while(nodoAux != nil)
                      if (nodoAux.value.sal > gramos)
                          arr << nodoAux.value
                      end
                          nodoAux = nodoAux["next"]
                  end
                  return arr
              end
          end
        end
  


        expect(salComparacion(@lista1,"<",0.6)).to eq("Lista Vacía")
        @lista1.insertaAdelante(@cañaManzana1)
        @lista1.insertaAdelante(@cañaManzana2)
        @lista1.insertaAdelante(@cañaManzana3)
        @lista1.insertaAdelante(@cañaManzana4)
        @lista1.insertaAdelante(@cañaManzana5)
        expect(salComparacion(@lista1,"<",0.6)).to eq([@cañaManzana5, @cañaManzana3])
        expect(salComparacion(@lista1,"=",1.7)).to eq([@cañaManzana4])
        expect(salComparacion(@lista1,">",0.6)).to eq([@cañaManzana4, @cañaManzana2, @cañaManzana1])
      end    
end
