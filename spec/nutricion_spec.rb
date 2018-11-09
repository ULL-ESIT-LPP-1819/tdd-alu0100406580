RSpec.describe Nutricion do
  it "has a version number" do
    expect(Nutricion::VERSION).not_to be nil
  end

  # it "does something useful" do
  #  expect(false).to eq(false)
  # end

  describe Tabla do
    before :each do
      @cañaManzana = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.7)
  end 

	  it "Creación de una etiqueta nutricional" do
		  expect(@cañaManzana).not_to eq(nil)
    end
    
	  it "La etiqueta nutricional tiene grasas, grasas Saturadas, Hidratos de Carbono, azúcares, proteínas, sal" do
      expect(@cañaManzana.grasas).to eq(22.0)
      expect(@cañaManzana.grasasSat).to eq(12.0)
      expect(@cañaManzana.hidratos).to eq(47.0)
      expect(@cañaManzana.azucares).to eq(18.0)
      expect(@cañaManzana.proteinas).to eq(5.3)
      expect(@cañaManzana.sal).to eq(0.7)
    end

    it "La etiqueta nutricional valor Energetico" do
      expect(@cañaManzana.valEnerKJ).to eq(1703.1)
      expect(@cañaManzana.valEnerKcal).to eq(407.2)
    end

    it "Fibra alimentaria y prueba del valor por defecto" do
      expect(@cañaManzana.fibra).to eq(0)
      @cañaManzana.fibra = 10
      expect(@cañaManzana.fibra).to eq(10)
    end

    it "Método to_s" do
      expect(@cañaManzana.to_s).to eq("El valor energético: #{1703.1}KJ/#{407.2}Kcal\n Cantidad de grasas: #{22.0}\n Cantidad de grasas saturadas: #{12.0}\n Hidratos de carbono: #{47.0}\n Azúcares: #{18.0}\n Proteínas: #{5.3}\n Sal: #{0.7}")
    end

    it "Porciones" do
      expect(@cañaManzana.porciones(75)).to eq("cada porcion de #{75} tiene: Valor energetico:#{1277.325}KJ/#{305.4}, grasas: #{16.5}, grasas saturadas: #{9.0}, hidratos de carbono: #{35.25}, azucares: #{13.5}, proteinas: #{3.975}, sal: #{0.525}") #Hay que poner esta
    end

    it "Índice" do
      expect(@cañaManzana.indice).to eq(25)
    end
    
  end
end
