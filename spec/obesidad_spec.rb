RSpec.describe Obesidad do
    it "has a version number" do
      expect(Obesidad::VERSION).not_to be nil
    end
  
    describe Obesidad do
      before :each do
        include Enumerable, Comparable

        @listaP1 = ListaDobleEnlazada.new()
        @listaP2 = ListaDobleEnlazada.new()
        @paciente1 = Paciente.new("Jose", "Pérez", 29, 1,  75, 1.75)
        @paciente2 = Paciente.new("María", "Gutierrez", 35, 0, 62, 1.64)
        @paciente3 = Paciente.new("Susana", "Armas", 47, 0, 51, 1.59)
        @paciente4 = Paciente.new("Carlos", "Rodriguez", 57, 1, 84, 1.80)
        @paciente5 = Paciente.new("Jacinto", "Camacho", 25, 1, 91, 1.83)
        end 
  
        it "Creación de la lista y de pacientes" do
            expect(@listaP1).not_to eq(nil)
            expect(@paciente2).not_to eq(nil)
            expect(@paciente1).not_to eq(nil)
        end 

        it "Inserción de Pacientes en la lista y método to_s" do
            @listaP1.insertaAtras(@paciente1)
            @listaP1.insertaAtras(@paciente2)
            @listaP1.insertaAtras(@paciente3)
            @listaP1.insertaAtras(@paciente4)
            @listaP1.insertaAtras(@paciente5)
            expect(@listaP1.tamaño).to eq(5)
            expect(@listaP1.cabeza.value.to_s).to eq("{Nombre:Jose, Apellidos:Pérez, Edad:29, Género:1, Peso:75, Talla:1.75}")
        end

        it "Comprobar Clase, tipo y pertenencia a jerarquía" do
            
            expect(@paciente1.is_a?(Persona)).to eq(true)
            expect(@paciente2.instance_of?(Paciente)).to eq(true)
            expect(@paciente3.class.ancestors).to eq([Paciente, Persona, Comparable, Enumerable, Object, Kernel, BasicObject])
            expect(@paciente4).to be_a_kind_of(Persona)
            expect(@paciente5).to respond_to(:nombre, :edad, :fecha, :genero, :apellidos, :talla, :peso)
            expect(@paciente5).to respond_to('to_s', 'imc', 'porcent_grasa', 'rcc', 'pliegues')
        end

        it "Clasificar por IMC" do
            def indiceMasaCorporal(lista, comparacion, masa)
                if (lista.tamaño == 0)
                    return "Lista Vacía"
                else
                    nodoAux = lista.cabeza
                    arr = []
                    if (comparacion == "<" )
                        while(nodoAux != nil)
                            if (nodoAux.value.imc < masa)
                                arr << nodoAux.value
                            end
                                nodoAux = nodoAux["next"]
                        end
                        return arr
                    end
                    if (comparacion == "=" )
                        while(nodoAux != nil)
                            if (nodoAux.value.imc == masa)
                                arr << nodoAux.value
                            end
                                nodoAux = nodoAux["next"]
                        end
                        return arr
                    end
                    if (comparacion == ">" )
                        while(nodoAux != nil)
                            if (nodoAux.value.imc > masa)
                                arr << nodoAux.value
                            end
                                nodoAux = nodoAux["next"]
                        end
                        return arr
                    end
                end
            end

            @listaP1.insertaAtras(@paciente1)
            @listaP1.insertaAtras(@paciente2)
            @listaP1.insertaAtras(@paciente3)
            @listaP1.insertaAtras(@paciente4)
            @listaP1.insertaAtras(@paciente5)
            expect(indiceMasaCorporal(@listaP1,">",25)).to eq([@paciente4, @paciente5])            
        end
    end
end