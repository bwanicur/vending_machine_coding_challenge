require_relative '../../services/products_importer'
require_relative '../support/products_data'

RSpec.describe ProductsImporter do
  describe '#run' do
    it 'should return an array of Product objects given an array of data hashes' do
      expect(ProductsData::DATA.first).to be_a(Hash)
      res = ProductsImporter.run(ProductsData::DATA)
      expect(res.first).to be_a(Product)
    end
  end
end
