# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)


class ListaDobleEnlazada

    include Enumerable
    
    attr_accessor :cabeza, :cola, :tamaño

    def initialize()
        @cabeza = nil
        @cola = nil
        @tamaño = 0
    end

    def insertaAdelante(valor)
        nodo = Node.new(valor,nil,nil)
        
        if (self.tamaño == 0)
            @cabeza = nodo
            @cola = nodo

        else
            nodo["next"] = @cabeza
            @cabeza.prev = nodo
            #nodo["prev"] = nil
            @cabeza = nodo
        end
        @tamaño = @tamaño + 1
    end

    def insertaAtras(valor)
        nodo = Node.new(valor,nil,nil)
        
        if (self.tamaño == 0)
            @cabeza = nodo
            @cola = nodo

        else
            nodo["prev"] = @cola
            @cola.next = nodo
            #nodo["next"] = nil
            @cola = nodo
        end
        @tamaño = @tamaño + 1
    end

    def extraerDelante
        if(self.tamaño == 0)
           return "Lista Vacía"
        else
           nodoAux = @cabeza
           @cabeza = @cabeza["next"]
           #@cabeza["prev"] = nil
           @tamaño = @tamaño - 1
           return nodoAux["value"]
        end
    end

        


end