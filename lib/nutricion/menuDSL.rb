class MenuFacil
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
    
    def titulo(titulo)
        @titulo = titulo
    end

    def ingesta(ingesta)
        @ingesta = ingesta
    end

    def desayuno(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @desayuno << ingrediente
    end
    
    def almuerzo(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @almuerzo << ingrediente
    end

    def cena(opciones = {})
        ingrediente = []
        ingrediente << opciones[:descripcion] << opciones[:porcion] << opciones[:gramos] << Tabla.new(opciones[:grasas],opciones[:grasasSaturadas],opciones[:carbohidratos],opciones[:azucares],opciones[:proteinas],opciones[:sal])
        @cena << ingrediente
    end

    def to_s
        output = @nombre
        output << " (#{@titulo}), Ingesta: #{@ingesta}"
        output << "#{' ' * 50} Composición Nutricional #{' ' * 50}"
        output << "\n#{'=' * 165}\n"
        output << "#{' ' * 35} Porción   Gramos #{' ' * 50} Grasas  Grasas-saturadas  Hidratos  Azucares  Proteinas  Sal\n" #58 75 85 95 106 111
        output << "Desayuno\n"
        kcaltotal = 0 
        @desayuno.each_with_index do |instruction, i|
            output << "\"#{instruction[0]}\" #{' ' * (31 - instruction[0].size.to_i)}#{instruction[1]}#{' ' * (15 - instruction[1].size.to_i)}#{instruction[2]}#{' ' * (64 - instruction[2].size.to_i)}#{instruction[3].grasas}#{' ' * 10}#{instruction[3].grasasSat}#{' ' * 12}#{instruction[3].hidratos}#{' ' * 3}#{instruction[3].azucares}#{' ' * 5}#{instruction[3].proteinas}#{' ' * 8}#{instruction[3].sal}\n"
            kcaltotal += instruction[3].valEnerKcal
        end
        output << "\nValor Energetico total desayuno: #{kcaltotal.round(2)}Kcal\n"

        output << "\nAlmuerzo\n"
        kcaltotal = 0 
        @almuerzo.each_with_index do |instruction, i|
            output << "\"#{instruction[0]}\" #{' ' * (31 - instruction[0].size.to_i)}#{instruction[1]}#{' ' * (15 - instruction[1].size.to_i)}#{instruction[2]}#{' ' * (64 - instruction[2].size.to_i)}#{instruction[3].grasas}#{' ' * 10}#{instruction[3].grasasSat}#{' ' * 12}#{instruction[3].hidratos}#{' ' * 3}#{instruction[3].azucares}#{' ' * 5}#{instruction[3].proteinas}#{' ' * 8}#{instruction[3].sal}\n"
            kcaltotal += instruction[3].valEnerKcal
        end
        output << "\nValor Energetico total almuerzo: #{kcaltotal.round(2)}Kcal\n"

        output << "\nCena\n"
        kcaltotal = 0 
        @cena.each_with_index do |instruction, i|
            output << "\"#{instruction[0]}\" #{' ' * (31 - instruction[0].size.to_i)}#{instruction[1]}#{' ' * (15 - instruction[1].size.to_i)}#{instruction[2]}#{' ' * (64 - instruction[2].size.to_i)}#{instruction[3].grasas}#{' ' * 10}#{instruction[3].grasasSat}#{' ' * 12}#{instruction[3].hidratos}#{' ' * 3}#{instruction[3].azucares}#{' ' * 5}#{instruction[3].proteinas}#{' ' * 8}#{instruction[3].sal}\n"
            kcaltotal += instruction[3].valEnerKcal
        end
        output << "\nValor Energetico total cena: #{kcaltotal.round(2)}Kcal\n"
        output

    end
end