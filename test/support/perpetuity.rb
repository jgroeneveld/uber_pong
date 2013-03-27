    require 'perpetuity'

    db = Perpetuity::MongoDB.new(db: 'uber_pong_test')
    Perpetuity.configure do
      data_source db
    end



    # krasser hack um db zu raeumen
    mapper_registry = Perpetuity.mapper_registry
    def mapper_registry.mappers
      @mappers.keys.map { |c| self[c] }
    end

    class MiniTest::Spec
      after :each do
        Perpetuity.mapper_registry.mappers.each do |mapper|
          mapper.delete_all
        end
      end
    end
