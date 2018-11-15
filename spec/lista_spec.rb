RSpec.describe Lista do
    it "has a version number" do
      expect(Lista::VERSION).not_to be nil
    end
  
    describe Lista do
      before :each do
        @lista1 = Lista.new()
        @cañaManzana2 = Tabla.new(22.0,12.0,47.0,18.0,5.3,0.7)
        end 
  
        it "Creación de un método lista" do
            expect(@lista1).not_to eq(nil)
            expect(@cañaManzana2).not_to eq(nil)
            expect(@cañaManzana2.grasas).to eq(22.0)
      end

    end
end
