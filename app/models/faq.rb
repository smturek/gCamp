class Faq

  attr_reader :question, :answer

  def initialize(q, a)
    @question = q
    @answer = a
  end

  def slug
    question
  end

  def self.all

  end

end
