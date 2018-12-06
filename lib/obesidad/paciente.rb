class Persona

    include Enumerable
    include Comparable
    
    attr_accessor :nombre, :apellidos, :edad, :genero

    def initialize(nombre, apellidos, edad, genero)
        @nombre = nombre
        @apellidos = apellidos
        @edad = edad
        @genero = genero
    end
end


class Paciente < Persona

    include Enumerable
    include Comparable
    
    attr_reader :nombre,:fecha,:edad,:talla
    attr_accessor :genero,:peso,:pc_bicipital,:pc_tricipital,:pc_subescapular,:pc_suprailiaco 

    def initialize(nombre,apellidos,edad, genero, peso, talla)
        super(@nombre = nombre, @apellidos = apellidos, @edad = edad, @genero = genero)
        @peso, @talla = peso, talla
    end

    def pliegues(pc_bicipital,pc_tricipital,pc_subescapular,pc_suprailiaco)
        @pc_bicipital,@pc_tricipital,@pc_subescapular,@pc_suprailiaco = pc_bicipital,pc_tricipital,pc_subescapular,pc_suprailiaco
    end

    def to_s 
       return "{Nombre:#{@nombre}, Apellidos:#{@apellidos}, Edad:#{@edad}, Género:#{@genero}, Peso:#{@peso}, Talla:#{@talla}}"
    end

    def imc
            return (@peso/(@talla*@talla)).round(2)
    end
    
    def rcc(cintura,cadera)
        rcc = (cintura/cadera)
        if ((@genero == 1 && rcc >= 0.83 && rcc <= 0.88) || (@genero == 0 && rcc >= 0.72 && rcc <= 0.75))
            return "Riesgo Bajo RCC: #{rcc.round(2)}"
        elsif ((@genero == 1 && rcc >= 0.88 && rcc <= 0.95) || (@genero == 0 && rcc >= 0.78 && rcc <= 0.82))
            return "Riesgo Medio RCC: #{rcc.round(2)}"
        elsif ((@genero == 1 && rcc >= 0.95 && rcc <= 1.01) || (@genero == 0 && rcc >= 0.82))
            return "Riesgo Alto RCC: #{rcc.round(2)}"
        elsif ((@genero == 1 && rcc >= 1.01))
            return "Riesgo Muy Alto RCC: #{rcc.round(2)}"
        else
            return "fuera de rango o algún dato mal introducido"
        end
    end

    def porcent_grasa
        return (1.2*self.imc+0.23*@edad-10.8*@genero-5.4).round(3)
    end

    def bicipital()
        bicipi = []
        for i in 1..3
            puts "Introduzca medida #{i} para pliegue Bicipital:"
            j = gets.to_i
            bicipi.push(j)
        end
        sum = bicipi.inject(0){ |sum, x| sum + x }
        @pc_bicipital = (sum/bicipi.size.to_f).round(2)
        return "El pliegue Bicipital medio es -> #{pc_bicipital}mm"
    end

    def tricipital()
        tricipi = []
        for i in 1..3
            puts "Introduzca medida #{i} para pliegue tricipital:"
            j = gets.to_i
            tricipi.push(j)
        end
        sum = tricipi.inject(0){ |sum, x| sum + x }
        @pc_tricipital = (sum/tricipi.size.to_f).round(2)
        return "El pliegue Tricipital medio es -> #{pc_tricipital}mm"
    end

    def subescapular()
        subesc = []
        for i in 1..3
            puts "Introduzca medida #{i} para pliegue Subescapular:"
            j = gets.to_i
            subesc.push(j)
        end
        sum = subesc.inject(0){ |sum, x| sum + x }
        @pc_subescapular = (sum/subesc.size.to_f).round(2)
        return "El pliegue Subescapular medio es -> #{pc_subescapular}mm"
    end

    def suprailiaco()
        supraili = []
        for i in 1..3
            puts "Introduzca medida #{i} para pliegue Suprailiaco:"
            j = gets.to_i
            supraili.push(j)
        end
        sum = supraili.inject(0){ |sum, x| sum + x }
        @pc_suprailiaco = (sum/supraili.size.to_f).round(2)
        return "El pliegue Suprailiaco medio es -> #{pc_suprailiaco}mm"
    end

    def <=>(other)
        return nil unless other.instance_of? Paciente
        mayor = 0
        menor = 0

        mayor += 1 if self.peso > other.peso
        mayor += 1 if self.talla > other.talla
        mayor += 1 if self.imc > other.imc
        mayor += 1 if self.porcent_grasa > other.porcent_grasa


        menor += 1 if self.peso < other.peso
        menor += 1 if self.talla < other.talla
        menor += 1 if self.imc < other.imc
        menor += 1 if self.porcent_grasa < other.porcent_grasa


        return mayor <=> menor if ((mayor && menor) != 0)
        return 0<=>0
    end

    def each
    end
end