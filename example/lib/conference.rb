class Conference
  # @dynamic title, year
  attr_reader :title
  attr_reader :year

  def initialize(title:, year:)
    @title = title
    @year = year
  end
end

Conference.new(title: "hoge", year: 2022)

# type error
# Conference.new()
