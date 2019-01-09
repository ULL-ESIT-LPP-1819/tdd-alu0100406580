class MenuFacil
    @@desayunos = 1
    @@almuerzos = 1
    @@cenas = 1
    def initialize(name, &block)
        @nombre = name
        @desayuno = []
        @almuerzo = []
        @cena = []
    
        if block_given?  
          if block.arity == 1
            yield self
          else
           instance_eval(&block) 
          end
        end
      end

    def desayuno(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @desayuno << ingrediente
        @@desayunos += 1    
    end
    
    def almuerzo(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @almuerzo << ingrediente
        @@almuerzos += 1  
    end

    def cena(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @cena << ingrediente
        @@cenas += 1  
    end
end