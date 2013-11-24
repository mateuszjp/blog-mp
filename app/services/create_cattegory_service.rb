class CreateCattegoryService
  # To change this template use File | Settings | File Templates.
  #class ALAERROR << StandardError end

  attr_accessor :cattegory
  def initialize
    @pass = false
  end

  def createCattegory(params = '')
    return @cattegory = Cattegory.new if params == ''
    @cattegory = Cattegory.new(params)
    if @cattegory.save
      @pass = true
    end
  end

  def pass
    @pass
  end
end